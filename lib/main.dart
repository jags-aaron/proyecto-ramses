import 'package:experimental_app/config/app_routes.dart';
import 'package:experimental_app/pages/homepage.dart';
import 'package:experimental_app/pages/login_page.dart';
import 'package:experimental_app/pages/new_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Establece la orientación del dispositivo en PorTrait y luego corre la app
  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experimental App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.newPage:
            return MaterialPageRoute(
              builder: (context) => const NewPage(),
            );
          case AppRoutes.home:
            return MaterialPageRoute(
              builder: (context) => HomePageScreen(
                title: settings.arguments as String,
              ),
            );

          default:
            return MaterialPageRoute(
              builder: (context) => const LoginPage(),
            );
        }
      },
      // onGenerateRoute: (settings) {
      //   switch(settings.name) {
      //     case AppRoutes.newPage:
      //       return MaterialPageRoute(builder: (context) => const NewPage());
      //     default:
      //       return MaterialPageRoute(builder: (context) => const HomePageScreen());
      //   }
      // },
    );
  }
}
