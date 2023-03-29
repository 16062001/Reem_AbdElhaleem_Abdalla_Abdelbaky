import 'package:flutter/material.dart';
import 'package:login_register/widget/settings.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions =
  <Widget>[
    MyStatefulWidget()
    ,
    Text(
      ' Time',
      style: optionStyle,
    )

  ,
    Text(
      ' Schedule',
      style: optionStyle,
    ),
    // Text(
    //   'Settings',
    //   style: optionStyle,
    // )
    Settings()
    ,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: Column(
          children: [
            _widgetOptions.elementAt(_selectedIndex),
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

          ],
        )


        //##############################



        //###############################


      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
