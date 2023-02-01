import 'package:flutter/material.dart';

import 'Constant/const.dart';
import 'Pages/MainHomePage/homepage.dart';
import 'Pages/WebAppBar/webapp.dart';
import 'Widget/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}



