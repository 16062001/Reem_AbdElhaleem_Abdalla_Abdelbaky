import 'package:flutter/material.dart';

import '../SignUp.dart';

class Splach extends StatefulWidget {
  const Splach({Key? key}) : super(key: key);

  @override
  State<Splach> createState() => _SplachState();
}


class _SplachState extends State<Splach> {

  // @override
  // Widget build(BuildContext context) {
  //   return AnimatedSplashScreen(
  //     splash: 'images/splash.png',
  //     nextScreen: MainScreen(),
  //     splashTransition: SplashTransition.rotationTransition,
  //     pageTransitionType: PageTransitionType.scale,
  //   );
  // }

  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async{
    await Future.delayed(Duration(microseconds: 50000), (){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder:  (context)=> SignUp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        // color: Color.fromARGB(255, 1, 0, 0),
        child: Center(
          child: Container(
            // child: Image.asset('images/start.jpg',),
            child: Text("EastMeet" , style: TextStyle(color: Colors.purple,fontSize: double.maxFinite),),
          ),
        ),
      ),

    );
  }
}
