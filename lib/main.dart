import 'package:e_commerce_app/config/routes/routes.dart';
import 'package:e_commerce_app/config/routes/routes_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>  MaterialApp(
        home: child,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesGenerator.onGenerateRoute,
        initialRoute: Routes.login,
      ),
    );
  }
}