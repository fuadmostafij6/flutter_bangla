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

class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin  {
  AnimationController? _animationController;

  Animation<double>? _menuBackgroundAnimation;

  List<Animation<Offset>> ?_listAnimation;

  Animation<double> ?_fadeAnimation;

  List<String> _menuList = [
    'ABOUT',
    'SHARE',
    'ACTIVITY',
    'SETTINGS',
    'CONTACT',
  ];

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _menuBackgroundAnimation =
        Tween<double>(begin: 0, end: 1000).animate(CurvedAnimation(
          parent: _animationController!,
          curve: Curves.ease,
        ));

    _listAnimation = List.generate(_menuList.length, (index) {
      return Tween<Offset>(
        begin: Offset(0, 0),
        end: Offset(0, index * 50 * 1.0),
      ).animate(CurvedAnimation(
          parent: _animationController!,
          curve: Interval(index * 0.1, index * 0.1 + 0.3)));
    });

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Interval(0.4, 0.7),
    ));
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

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

