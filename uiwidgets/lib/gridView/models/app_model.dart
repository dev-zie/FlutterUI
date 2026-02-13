class AppModel {
  final String appIcon;
  final String appName;
  final String releaseDate;
  final String appCategory;
  final String storeURL;
  bool isSelected;

  AppModel({
    required this.appIcon,
    required this.appName,
    required this.releaseDate,
    required this.appCategory,
    required this.storeURL,
    this.isSelected = false,
  });
}
