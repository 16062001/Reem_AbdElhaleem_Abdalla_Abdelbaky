// import 'package:flutter/material.dart';
// import 'package:login_register/chatPage.dart';
//
// import 'model/CreateLink.dart';
// import 'model/scroll.dart';
//
//
// class meeting extends StatelessWidget {
//   static String id = 'meeting';
//
//  //const HomePage({Key key}) : super (key: key);
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(title: Text("home page")),
//       body: Container(
//         child: Row(
//           children: [
//               Container(
//                    padding:EdgeInsets.only(top:20,bottom: 20),
//                   color: Colors.white,
//                   child: Column(
//
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                 children: [
//                   Icon(Icons.volume_down_outlined ,size: 50,),
//
//                    GestureDetector(
//                         onTap: () async {
//   Navigator.pushNamed(context, chatPage.id);
//                         },
//
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.deepPurple,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           width: 100,
//                           height: 100,
//                           child: Icon(Icons.chat  ,size: 50,),
//                         )
//
//                         // primary: Colors.deepPurple,
//                         // textStyle: TextStyle(fontSize: 10.0 ,backgroundColor: Colors.deepPurple,fontWeight: FontWeight.bold )
//
//                         ),
//
//                   Icon(Icons.chat  ,size: 50,),
//
//                   Icon(Icons.add_box_sharp ,size: 50,),
//                   Icon(Icons.translate ,size: 50,),
//                   Icon(Icons.settings ,size: 50,),
//                 ],
//               )),
//
//               VerticalDivider(color: Colors.deepPurple,thickness: 10,width: 20),
//
//               Column(
//                 children: [
//                   //  Container(
//                   //    child: Card(margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
//
//                   //    ),
//                   //  ),
//
//
//                   // Container(
//
//                   //   child: Image.asset('images/start.jpg' ,width:100,height: 100, )),
//
//                   Wrap(
//                     children:[ Column(
//                       children: [
//                         Container(
//                           width: 100,
//                           color: Colors.purpleAccent,
//                           margin: EdgeInsets.all(10),
//                           child:
//                           Text("ya kareem ya rab"),
//                         ),
//                         Container(
//                           width: 70,
//                           color: Colors.purpleAccent,
//                           margin: EdgeInsets.all(10),
//                           child:
//                           Text("ya kareem ya rab"),
//                         ),
//                         Container(
//                           width: 70,
//                           color: Colors.purpleAccent,
//                           margin: EdgeInsets.all(10),
//                           child:
//                           Text("ya kareem ya rab"),
//                         ),
//                         Container(
//                           width: 70,
//                           color: Colors.purpleAccent,
//                           margin: EdgeInsets.all(10),
//                           child:
//                           Text("ya kareem ya rab"),
//                         ),
//                         Container(
//                           width: 70,
//                           color: Colors.purpleAccent,
//                           margin: EdgeInsets.all(10),
//                           child:
//                           Text("ya kareem ya rab"),
//                         ),
//                         Container(
//                           width: 70,
//                           color: Colors.purpleAccent,
//                           margin: EdgeInsets.all(10),
//                           child:
//                           Text("ya kareem ya rab"),
//                         ),
//                         Container(
//                           width: 70,
//                           color: Colors.purpleAccent,
//                           margin: EdgeInsets.all(10),
//                           child:
//                           Text("ya kareem ya rab"),
//                         ),
//                         // Container(
//                         //   width: 70,
//                         //   color: Colors.purpleAccent,
//                         //   margin: EdgeInsets.all(10),
//                         //   child:
//                         //   Text("ya kareem ya rab"),
//                         // ),
//                         // Container(
//                         //   width: 70,
//                         //   color: Colors.purpleAccent,
//                         //   margin: EdgeInsets.all(10),
//                         //   child:
//                         //   Text("ya kareem ya rab"),
//                         // ),Container(
//                         //   width: 70,
//                         //   color: Colors.purpleAccent,
//                         //   margin: EdgeInsets.all(10),
//                         //   child:
//                         //   Text("ya kareem ya rab"),
//                         // ),
//                         // Container(
//                         //   width: 70,
//                         //   color: Colors.purpleAccent,
//                         //   margin: EdgeInsets.all(10),
//                         //   child:
//                         //   Text("ya kareem ya rab"),
//                         // ),Container(
//                         //   width: 70,
//                         //   color: Colors.purpleAccent,
//                         //   margin: EdgeInsets.all(10),
//                         //   child:
//                         //   Text("ya kareem ya rab"),
//                         // ),Container(
//                         //   width: 70,
//                         //   color: Colors.purpleAccent,
//                         //   margin: EdgeInsets.all(10),
//                         //   child:
//                         //   Text("ya kareem ya rab"),
//                         // ),Container(
//                         //   width: 70,
//                         //   color: Colors.purpleAccent,
//                         //   margin: EdgeInsets.all(10),
//                         //   child:
//                         //   Text("ya kareem ya rab"),
//                         // ),Container(
//                         //   width: 70,
//                         //   color: Colors.purpleAccent,
//                         //   margin: EdgeInsets.all(10),
//                         //   child:
//                         //   Text("ya kareem ya rab"),
//                         // ),Container(
//                         //   width: 70,
//                         //   color: Colors.purpleAccent,
//                         //   margin: EdgeInsets.all(10),
//                         //   child:
//                         //   Text("ya kareem ya rab"),
//                         // ),Container(
//                         //   width: 70,
//                         //   color: Colors.purpleAccent,
//                         //   margin: EdgeInsets.all(10),
//                         //   child:
//                         //   Text("ya kareem ya rab"),
//                         // ),
//                       ],
//                     ),]
//                   ),
//
//                   Row(
//
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    // crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                         Icon(Icons.mic ,size: 50,color: Colors.white,),
//                           Icon(Icons.voice_chat,size: 50,color: Colors.white,),
//                             Icon(Icons.share ,size: 50,color: Colors.white,),
//
//                                Center(
//                     child: GestureDetector(
//                         onTap: () async {
//    Navigator.pushNamed(context, CreateLink.id);
//
//                         },
//
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.deepPurple,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           width: 50,
//                           height: 30,
//                           child: Text("end"),
//                         )
//
//                         // primary: Colors.deepPurple,
//                         // textStyle: TextStyle(fontSize: 10.0 ,backgroundColor: Colors.deepPurple,fontWeight: FontWeight.bold )
//
//                         ),
//                   ),
//
//                     ],
//                   )
//
//
//
//                  ],
//               )
//           ],
//         ),
//       )
//
//     );
//   }
//
// }