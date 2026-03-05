import 'package:client/features/services/models/service_category/service_category_model.dart';
import 'package:client/features/services/models/service_item_model/service_item_model.dart';

/// App constants for the app
class AppConstants {
  /// Base URL for the API for postman
  // static const String apiBaseUrl = 'http://127.0.0.1:2000/api';
  static const String apiBaseUrl = 'http://192.168.1.189:2000/api';

  /// Services for the app
  static const List<ServiceCategoryModel> services = [
    ServiceCategoryModel(
      title: 'Social Media',
      items: [
        ServiceItemModel(
          asset: 'assets/images/tiktok.png',
          title: 'TikTok',
          description: 'Generate My Video\nHashtags',
        ),
        ServiceItemModel(
          asset: 'assets/images/telegram.png',
          title: 'Telegram',
          description: 'Generate popular\nChannels in telegram',
        ),
        ServiceItemModel(
          asset: 'assets/images/twit.png',
          title: 'Twitter',
          description: 'Generate My\nTrending Hashtags',
        ),
      ],
    ),
    ServiceCategoryModel(
      title: 'Health',
      items: [
        ServiceItemModel(
          asset: 'assets/images/pill.png',
          title: 'Medicine',
          description: 'Generate Text For\nMy All Medicine',
        ),
        ServiceItemModel(
          asset: 'assets/images/dna.png',
          title: 'Disease',
          description: 'Generate Text For\nAll Disease problems',
        ),
        ServiceItemModel(
          asset: 'assets/images/weed.png',
          title: 'Natural',
          description: 'Generate Text For\nNatural Medicine',
        ),
      ],
    ),
    ServiceCategoryModel(
      title: 'Sport',
      items: [
        ServiceItemModel(
          asset: 'assets/images/football.png',
          title: 'Football',
          description: 'Generate Plan\n Of My Training',
        ),
        ServiceItemModel(
          asset: 'assets/images/dumbell.png',
          title: 'Gym',
          description: 'Generate Plan\n Of My Training',
        ),
        ServiceItemModel(
          asset: 'assets/images/baseball.png',
          title: 'Baseball',
          description: 'Generate Plan\n Of My Training',
        ),
      ],
    ),
  ];
}
