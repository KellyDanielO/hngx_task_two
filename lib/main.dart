import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HGNx Task Two',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.mainBg,
        appBarTheme: const AppBarTheme(color: AppColors.mainBg)
      ),
      home: const HomeScreen(),
    );
  }
}
