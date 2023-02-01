

import 'package:flutter/material.dart';

import '../../Constant/const.dart';

class WebAppBarWidget extends StatelessWidget {
  const WebAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      decoration: BoxDecoration(
        gradient: Constant.linearGradient
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width:size.width*0.25 ,
              child: RichText(text: const TextSpan(
                  children: [
                    TextSpan(text: "Flutter ", style: TextStyle(fontSize: 18, color: Colors.white)),
                    TextSpan(text: "Bangla", style: TextStyle(fontSize: 15, color: Colors.blue)),
                  ]
              )),
            ),


            SizedBox(
              height: 60,
              width:size.width*0.6 ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.withOpacity(0.2)

                ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8 , top: 5, bottom: 5),
                        child: Text("Home",style: TextStyle(fontSize: 18, color: Colors.white),),
                      )),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.2)

                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8 , top: 5, bottom: 5),
                        child: Text("Tutorial",style: TextStyle(fontSize: 18, color: Colors.white),),
                      )),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.2)

                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8 , top: 5, bottom: 5),
                        child: Text("Hire Us",style: TextStyle(fontSize: 18, color: Colors.white),),
                      )),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.2)

                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8 , top: 5, bottom: 5),
                        child: Text("Blog",style: TextStyle(fontSize: 18, color: Colors.white),),
                      )),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.2)

                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8 , top: 5, bottom: 5),
                        child: Text("About Us",style: TextStyle(fontSize: 18, color: Colors.white),),
                      )),


                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
