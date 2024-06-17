import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_project/Controller/food_controller.dart';
import 'package:interview_project/View/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(FoodController());

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'InterView Project',
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home:const HomeScreen(),
    );
  }
}