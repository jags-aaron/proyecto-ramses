import 'package:experimental_app/config/app_routes.dart';
import 'package:experimental_app/pages/homepage.dart';
import 'package:experimental_app/pages/login_page.dart';
import 'package:experimental_app/pages/new_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experimental App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue),
      onGenerateRoute: (settings) {
        switch(settings.name) {
          case AppRoutes.newPage:
            return MaterialPageRoute(builder: (context) => const NewPage());
          case AppRoutes.home:
            return MaterialPageRoute(builder: (context) => const HomePageScreen());

          default:
            return MaterialPageRoute(builder: (context) => const LoginPage());
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
