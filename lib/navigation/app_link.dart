import 'app_pages.dart';

class AppLink {

  static const String tabParam = 'page';
  static const String idParam = 'id';
  String? location;
  int? currentTab;
  String? itemId;

  AppLink({
    this.location,
    this.currentTab,
    this.itemId,
  });

  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);
    final params = uri.queryParameters;
    final currentTab = int.tryParse(params[AppLink.tabParam] ?? '');
    final itemId = params[AppLink.idParam];
    final link = AppLink(
      location: uri.path,
      currentTab: currentTab,
      itemId: itemId,
    );
    return link;
  }

  String toLocation() {
    String addKeyValPair({
      required String key,
      String? value,
    }) =>
        value == null ? '' : '${key}=$value&';
    switch (location) {
      case AppPages.loginPath:
        return AppPages.loginPath;
      case AppPages.onboardingPath:
        return AppPages.onboardingPath;
      case AppPages.profilePath:
        return AppPages.profilePath;
      case AppPages.selectedItemDetails:
        var loc = '${AppPages.selectedItemDetails}?';
        loc += addKeyValPair(
          key: idParam,
          value: itemId,
        );
        return Uri.encodeFull(loc);
      default:
        var loc = '${AppPages.home}?';
        loc += addKeyValPair(
          key: tabParam,
          value: currentTab.toString(),
        );
        return Uri.encodeFull(loc);
    }
  }
}