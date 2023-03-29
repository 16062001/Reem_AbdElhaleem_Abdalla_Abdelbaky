import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class HomePage extends StatelessWidget {
  //const HomePage({super.key});
  static String id ='HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 100),
          
            color: Colors.black,
            height: double.infinity,
            width: double.infinity,
          child: Column(
       
            children: [

                     
                    //    Image.asset('images/start.jpg',
                    //   height: 400,
                    //   width: 500,
                    //
                    // ),
                    GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        height: 50,
                        width: 300,
                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                         color: Color.fromARGB(255, 237, 170, 245),
                        ),
                        child: Center(child: Text('New Meeting',style: 
                        TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 136, 2, 146)
                        )
                        ,)),
                      ),
                    ),
                  
                 Padding(
                   padding: const EdgeInsets.only(top: 30),
                   child: GestureDetector(
                    
                        onTap: () {
                          
                        },
                        child: Container(
                          height: 50,
                          width: 300,
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                           color: Color.fromARGB(255, 143, 3, 159),
                          ),
                          child: Center(child: Text('Join Meeting',style: 
                          TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 230, 167, 235)
                          )
                          ,)),
                        ),
                      ),
                 ),

                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Container(
                    height: 70,
                    color: Color.fromARGB(255, 137, 5, 170),
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                     Icon(Icons.home,size: 40,semanticLabel: 'Home',),
                      Icon(Icons.history,size: 40,),
                       Icon(Icons.schedule,size: 40,),
                        Icon(Icons.settings,size: 40,),
                    ]),
                  ),
                )
            
            ],
          ),
        ),
      ),

    );
  }
}