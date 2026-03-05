import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:client/features/chat/domain/entities/chat_message_entity.dart';
import 'package:client/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/Uuid.dart';

part 'chat_bloc_event.dart';
part 'chat_bloc_state.dart';

/// Chat bloc for the chat feature
class ChatBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  /// Send message use case for the chat feature
  final SendMessageUseCase sendMessageUseCase;

  static const int _statusServiceUnavailable = 503;
  static const int _statusTooManyRequests = 429;
  static const int _statusForbidden = 403;
  static const int _statusInternalServerError = 500;

  /// Constructor for the ChatBloc
  ChatBloc(this.sendMessageUseCase) : super(const ChatBlocState()) {
    on<SendMessageEvent>(_onSendMessage);
  }

  static String _errorToMessage(Object e) {
    if (e is DioException) {
      final code = e.response?.statusCode;
      if (code == _statusServiceUnavailable ||
          code == _statusInternalServerError) {
        return '''Server temporarily unavailable or models overloaded. Try again.''';
      }
      if (code == _statusTooManyRequests) {
        return '''Exceeded request limit. Try again later.''';
      }
      if (code == _statusForbidden) {
        return '''Quota exceeded or access limited. Try again later.''';
      }
    }

    return '''Failed to send message. Try again.''';
  }

  Future<void> _onSendMessage(
    SendMessageEvent event,
    Emitter<ChatBlocState> emit,
  ) async {
    final service = event.service;
    log('ChatBloc: SendMessageEvent received: "${event.message}" (service: $service)');

    final userMessage = ChatMessageEntity(
      id: const Uuid().v4(),
      content: event.servicePrompt ?? event.message,
      role: ChatMessageEntityRole.user,
      createdAt: DateTime.now(),
    );

    final currentList = state.messagesFor(service);
    final newChats = Map<String, List<ChatMessageEntity>>.from(state.chats)
      ..[service] = [...currentList, userMessage];

    emit(
      state.copyWith(
        chats: newChats,
        loadingService: service,
        errorMessage: null,
      ),
    );

    try {
      final aiMessage = await sendMessageUseCase(event.message);
      log('ChatBloc: AI reply received: "${aiMessage.content}"');

      final afterList = state.chats[service] ?? [];
      final updatedChats = Map<String, List<ChatMessageEntity>>.from(state.chats)
        ..[service] = [...afterList, aiMessage];

      emit(
        state.copyWith(
          chats: updatedChats,
          loadingService: null,
          errorMessage: null,
        ),
      );
    } catch (e, st) {
      log('ChatBloc: error while sending message: $e', stackTrace: st);
      emit(
        state.copyWith(
          loadingService: null,
          errorMessage: _errorToMessage(e),
        ),
      );
    }
  }
}
