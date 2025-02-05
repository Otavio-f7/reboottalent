import 'package:flutter/material.dart';
import 'package:reboottalent/ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(52, 186, 171, 1),
          secondary: Color.fromRGBO(121, 148, 173, 1),
          tertiary: Color.fromRGBO(70, 96, 103, 1),
          surface: Color.fromRGBO(245, 250, 252, 1)
        ),
        useMaterial3: true,
      ),
      routes: {
        '/' : (context) => const HomePage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


