import 'package:client/features/services/models/service_category/service_category_model.dart';
import 'package:client/features/services/widgets/service_item_widget.dart';
import 'package:flutter/material.dart';

/// Choose service widget for the services feature
class ChooseServiceWidget extends StatelessWidget {
  /// Category for the choose service widget
  final ServiceCategoryModel category;

  /// On tap callback
  final void Function()? onTap;

  /// Constructor for the ChooseServiceWidget
  const ChooseServiceWidget({
    required this.category,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 163,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.items.length,
            itemBuilder: (_, index) {
              final item = category.items[index];

              return ServiceItemWidget(
                onTap: onTap,
                asset: item.asset,
                title: item.title,
                description: item.description,
              );
            },
          ),
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}
