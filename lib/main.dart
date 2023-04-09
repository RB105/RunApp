import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/provider/auth/auth_provider.dart';
import 'package:runningapp/view/auth_page.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
