import 'package:client/features/history/bloc/history_bloc.dart';
import 'package:client/features/history/bloc/history_event.dart';
import 'package:client/features/history/bloc/history_state.dart';
import 'package:client/features/history/domain/entity/chat_session_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// History screen for the history feature
class HistoryScreen extends StatefulWidget {
  /// Constructor for the HistoryScreen
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryBloc>().add(LoadHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (_, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFA0A0A5),
              ),
            );
          }

          if (state.sessions.isEmpty && state.error == null) {
            return const _EmptyHistoryWidget();
          }

          return ListView(
            padding: const EdgeInsets.fromLTRB(24, 25, 24, 100),
            children: [
              if (state.error != null) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.orange.shade200,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: Colors.orange.shade800,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          state.error ?? '',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.orange.shade900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const Text(
                'History',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              if (state.sessions.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: _EmptyHistoryContent(),
                )
              else
                ...state.sessions.map(
                  (session) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _HistoryChatTile(session: session),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _HistoryChatTile extends StatelessWidget {
  final ChatSessionEntity session;

  const _HistoryChatTile({
    required this.session,
  });

  static const int padLeft = 2;

  String _formatTime(DateTime time) {
    final now = DateTime.now();

    if (now.difference(time).inDays == 0) {
      return "${time.hour}:${time.minute.toString().padLeft(padLeft, '0')}";
    }

    return "${time.day}.${time.month}";
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(session.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        context.read<HistoryBloc>().add(DeleteSessionEvent(session.id));
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFA0A0A5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(
          Icons.delete_outline,
          color: Colors.white,
          size: 28,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          // TODO: открыть чат по sessionId — Navigator.push(...)
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFA0A0A5),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      session.preview,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      session.service,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                _formatTime(session.lastMessageAt),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyHistoryContent extends StatelessWidget {
  const _EmptyHistoryContent();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.history_rounded,
            size: 70,
            color: Color(0xFF757474),
          ),
          SizedBox(height: 20),
          Text(
            'No chats yet',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Your conversations will appear here',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyHistoryWidget extends StatelessWidget {
  const _EmptyHistoryWidget();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 25, 24, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'History',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: Center(
              child: _EmptyHistoryContent(),
            ),
          ),
        ],
      ),
    );
  }
}
