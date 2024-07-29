import 'package:chatapp/views/chat_page.dart';
import 'package:chatapp/views/home.dart';
import 'package:chatapp/views/phone_login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat On',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/chat_page',
      routes: {
        '/': (context) => const PhoneLogin(),
        '/home':(context)=> const HomePage(),
        '/chat_page': (context) => const ChatPage(),
      },
    );
  }
}
