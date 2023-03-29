import 'package:flutter/material.dart';
import 'package:login_register/chatPage.dart';

import 'model/CreateLink.dart';
import 'model/scroll.dart';


class CurrentMetting extends StatelessWidget {
  static String id = 'HomePage'; 
  
 //const HomePage({Key key}) : super (key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(title: Text("home page")),
      body: Container(
        child: Row(
          children: [
              Container(
                   padding:EdgeInsets.only(top:20,bottom: 20),
                  color: Colors.white,
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                children: [
                  Icon(Icons.volume_down_outlined ,size: 50,),
                  
                   GestureDetector(
                        onTap: () async {
                    Navigator.pushNamed(context, chatPage.id);
                        },
                          
                        child:
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: 100,
                          height: 100,
                          child: Icon(Icons.chat  ,size: 50,),
                        )
            
                        // primary: Colors.deepPurple,
                        // textStyle: TextStyle(fontSize: 10.0 ,backgroundColor: Colors.deepPurple,fontWeight: FontWeight.bold )
            
                        ),
                  
                  Icon(Icons.chat  ,size: 50,),

                  Icon(Icons.add_box_sharp ,size: 50,),
                  Icon(Icons.translate ,size: 50,),
                  Icon(Icons.settings ,size: 50,),
                ],
              )),

              VerticalDivider(color: Colors.deepPurple,thickness: 10,width: 10),

            Column(
              children: [
                // SizedBox(
                //   width: double.infinity,
                // ),
                // Card(margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                //     child: Padding(
                //       padding:  EdgeInsets.all(15),
                //       child: Text("Translation here\nw ya mosaheeel"
                //       ),
                //     )
                // ),
                // Image.asset('images/h3.jpg' ,width:100,height: 100, ),

                Container(color: Colors.orange,
                  child:SizedBox(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 100,
                                color: Colors.purpleAccent,
                                margin: EdgeInsets.all(10),
                                child:
                                Text("ya rab"),
                              ),
                              Container(
                                width: 70,
                                color: Colors.purpleAccent,
                                margin: EdgeInsets.all(10),
                                child:
                                Text("ya kareem ya rab"),
                              ),Container(
                                width: 70,
                                color: Colors.purpleAccent,
                                margin: EdgeInsets.all(10),
                                child:
                                Text("ya kareem ya rab"),
                              ),Container(
                                width: 70,
                                color: Colors.purpleAccent,
                                margin: EdgeInsets.all(10),
                                child:
                                Text("ya kareem ya rab"),
                              ),Container(
                                width: 70,
                                color: Colors.purpleAccent,
                                margin: EdgeInsets.all(10),
                                child:
                                Text("ya kareem ya rab"),
                              ),
                              Container(
                                width: 70,
                                color: Colors.purpleAccent,
                                margin: EdgeInsets.all(10),
                                child:
                                Text("ya kareem ya rab"),
                              ),Container(
                                width: 70,
                                color: Colors.purpleAccent,
                                margin: EdgeInsets.all(10),
                                child:
                                Text("ya kareem ya rab"),
                              ),Container(
                                width: 70,
                                color: Colors.purpleAccent,
                                margin: EdgeInsets.all(10),
                                child:
                                Text("ya kareem ya rab"),
                              ),Container(
                                width: 70,
                                color: Colors.purpleAccent,
                                margin: EdgeInsets.all(10),
                                child:
                                Text("ya kareem ya rab"),
                              ),Container(
                                width: 70,
                                color: Colors.purpleAccent,
                                margin: EdgeInsets.all(10),
                                child:
                                Text("ya kareem ya rab"),
                              ),Container(
                                width: 70,
                                color: Colors.purpleAccent,
                                margin: EdgeInsets.all(10),
                                child:
                                Text("ya kareem ya rab"),
                              ),Container(
                                width: 70,
                                color: Colors.purpleAccent,
                                margin: EdgeInsets.all(10),
                                child:
                                Text("ya kareem ya rab"),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ),
                  ),
                )


              ],
            )

          ],
        ),
      )

    );
  }

}