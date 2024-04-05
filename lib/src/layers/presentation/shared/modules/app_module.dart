import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasklist/src/layers/presentation/ui/pages/home_page.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
    );
  }
}
