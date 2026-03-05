import 'package:client/features/services/models/service_item_model/service_item_model.dart';

/// Service category model
class ServiceCategoryModel {
  /// Title for the service category
  final String title;

  /// Items for the service category
  final List<ServiceItemModel> items;

  /// Constructor for the ServiceCategory
  const ServiceCategoryModel({
    required this.title,
    required this.items,
  });
}
