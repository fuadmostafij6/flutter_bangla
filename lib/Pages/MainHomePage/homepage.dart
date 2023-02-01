import 'package:flutter/material.dart';

import '../../Constant/const.dart';
import '../../Widget/customPainter/customPainter.dart';
import '../../Widget/responsive.dart';
import '../WebAppBar/webapp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  Animation<double>? _menuBackgroundAnimation;

  List<Animation<Offset>>? _listAnimation;

  Animation<double>? _fadeAnimation;

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
        begin: const Offset(0, 0),
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
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? null

          : PreferredSize(
              preferredSize: Size(size.width, 80),
              child: const WebAppBarWidget()),
      body: Column(
        children: [
          ResponsiveWidget.isSmallScreen(context)
              ? Stack(
                  children: [
                    Container(
                      height: 70,
                      decoration:
                          BoxDecoration(gradient: Constant.linearGradient),
                      child: Center(
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: "Flutter ",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                          TextSpan(
                              text: "Bangla",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.blue)),
                        ])),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _animationController!,
                      builder: (context, child) {
                        return CustomPaint(
                          painter: MenuPainter(
                              radius: _menuBackgroundAnimation!.value),
                          child: Center(
                            child: FadeTransition(
                              opacity: _fadeAnimation!,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(top: 10),
                                height: _menuList.length * 50 * 1.0,
                                decoration: BoxDecoration(
                                    gradient: Constant.linearGradient),
                                child: ListView.builder(

                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount:_menuList.length ,
                                    itemBuilder: (context, index){

                                  return ListTile(
                                    hoverColor: Colors.deepPurple.shade300,
                                    title: Text(_menuList[index], style: TextStyle(color: Colors.white),),
                                  );
                                }),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        constraints: const BoxConstraints.tightFor(
                            width: 56.0, height: 56.0),
                        child: IconButton(
                            icon: AnimatedIcon(
                              icon: AnimatedIcons.menu_close,
                              color: Colors.white,
                              progress: _animationController!,
                            ),
                            onPressed: () {
                              if (_animationController!.status ==
                                  AnimationStatus.completed) {
                                _animationController!.reverse();
                              } else {
                                _animationController!.forward();
                              }
                            }),
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
