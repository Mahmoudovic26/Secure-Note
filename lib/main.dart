// ignore_for_file: slash_for_doc_comments

/**
 * @authors
 * محمود محمد بيومي محمد
 * مهند محمد عثمان
 * محمد محمود ربيع
 * أحمد محمد محمد
 * مصطفى أشرف مطر
 * دينا محمد فرغلي
 * 
 */

import 'package:flutter/material.dart';

import 'auth_screen.dart';

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
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: AuthScreen());
  }
}
