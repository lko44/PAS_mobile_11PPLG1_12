import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pas_mobile_11pplg1_12/routes/pages.dart';
import 'package:pas_mobile_11pplg1_12/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FakeStore API Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute:Routes.splashscreen, 
      getPages: AppPages.pages,
    );
  }
}
