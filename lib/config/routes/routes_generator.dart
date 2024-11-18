import 'package:e_commerce_app/config/routes/routes.dart';
import 'package:e_commerce_app/presentation/auth/screens/login_screen.dart';
import 'package:e_commerce_app/presentation/auth/screens/sign_up_screen.dart';
import 'package:e_commerce_app/presentation/main_layout/main_layout.dart';
import 'package:e_commerce_app/presentation/splach/splach_screen.dart';
import 'package:flutter/material.dart';

abstract class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    
      case Routes.splachScreen:
        return MaterialPageRoute(builder: (_) => const SplachScreen());
      case Routes.mainLayout:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) => const UnknownScreen());
    }
  }
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unknown Route')),
      body: const Center(child: Text('Unknown Route')),
    );
  }
}
