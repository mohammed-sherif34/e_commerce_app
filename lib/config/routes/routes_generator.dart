import 'package:e_commerce_app/config/routes/routes.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:e_commerce_app/features/main_layout/main_layout.dart';
import 'package:flutter/material.dart';

abstract class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        // Handle SignUp route
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.mainLayout:
        // Handle SignUp route
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case Routes.signUp:
        // Handle Login route
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        // Handle unknown routes
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
