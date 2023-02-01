import 'package:flutter/material.dart';

import 'Constant/const.dart';
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:
      ResponsiveWidget.isSmallScreen(context)?
          AppBar(
            elevation: 0,
              centerTitle: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: Constant.linearGradient),
              ),
            title:  RichText(text: const TextSpan(
                children: [
                  TextSpan(text: "Flutter ", style: TextStyle(fontSize: 18, color: Colors.white)),
                  TextSpan(text: "Bangla", style: TextStyle(fontSize: 15, color: Colors.blue)),
                ]

            ))):
      PreferredSize(
        preferredSize: Size(size.width, 80),
        child:

        const WebAppBarWidget()
      ),
      endDrawer:


      ResponsiveWidget.isSmallScreen(context)?   Drawer(

      ):null,

          );

  }
}

