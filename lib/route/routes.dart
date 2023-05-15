import 'package:go_router/go_router.dart';
import 'package:to_do_flutter_app/ui/add_todo_page.dart';
import 'package:to_do_flutter_app/ui/home_page.dart';

class RoutePath {
  RoutePath._();

  static const homePath = "/home";
  static const addPath = "add";
}

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: RoutePath.homePath,
  routes: [
    _homePageRoute(),
  ],
);

GoRoute _homePageRoute() {
  return GoRoute(
      path: RoutePath.homePath,
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
            path: RoutePath.addPath,
            builder: (context, state) {
              return const AddTodoPage();
            })
      ]);
}
