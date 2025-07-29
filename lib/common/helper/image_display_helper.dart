import 'package:e_commerce_app/core/constants/app_urls.dart';

class ImageDisplayHelper {
  static String generateCategoryImageUrl(String title) {
    return AppUrls.categoryImage + title + AppUrls.alt;
  }

  static String generatePrductImageUrl(String title) {
    return AppUrls.categoryImage + title + AppUrls.alt;
  }
}
