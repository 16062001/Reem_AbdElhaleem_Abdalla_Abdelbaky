






import 'dart:ui';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';


class start extends StatelessWidget {
   start({super.key});
bool selected = false;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void initState() {
Future.delayed(const Duration(seconds: 2), () {
selected=true;
});

}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       navigatorKey: navigatorKey,
      home: Container(
        child: Scaffold(

        //backgroundColor: Color(0xff000000),
        // body:AnimatedContainer(
        //   duration: Duration(seconds: 2),
        //   curve: Curves.fastOutSlowIn,
        //    alignment:
        //         selected ? Alignment.center : AlignmentDirectional.topCenter,

        //     padding: EdgeInsets.only(top: 230),
        //     child: const FlutterLogo(size: 75),
        //     width:  100.0,
        //     height:   200.0,
        //     color:   Colors.red ,
        //     //child: Image.asset('images/start.jpg',)
        //    // alignment: Alignment.center,


        // ) ,
        body: Container(

      color: Color.fromARGB(255, 1, 0, 0),
      child: Center(
        child: Container(
          child: AnimatedAlign(
            alignment: selected ? Alignment.centerLeft : Alignment.topRight,
            duration: const Duration(seconds: 5),
            curve: Curves.fastOutSlowIn,

           child:  Image.asset('images/start.jpg',),

            //child: const FlutterLogo(size: 50.0),
          ),


        ),

      )),
        ),
      ),
    );
  }
}