import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
   Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        appBar: AppBar(title: Text('Profile Info')),
        body: Center(
          child: ProfilePage(),
        ),
      ),
    );
   }
}

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child:Center(
            child: Text(
              'Dương Văn Tùng',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        //Date at the bottom in a row
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Date: ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'October 22, 2024',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],),
        )
      ],
    );
  }
}

