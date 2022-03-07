class AppRoute {
  String? routeKey;
  Function? action;
  String title;

  AppRoute({
    this.routeKey,
    this.action,
    required this.title,
  });
}
