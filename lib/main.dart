import 'package:flutter/material.dart';
import 'package:mario/screens/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mario',
      theme: ThemeData(
        useMaterial3: true, colorScheme: ColorScheme.light()
      ),
      home: HomeView(),
    );
  }
}
