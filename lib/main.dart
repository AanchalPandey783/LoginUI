import 'package:flutter/material.dart';
import 'package:u_ui_design/sign_in.dart';
import 'package:u_ui_design/welcome_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home:OrientationBuilder(
        builder:(context,orientation){
          if (orientation==Orientation.portrait){
            return  const AspectRatio(
              aspectRatio: 9/16 ,
              child: NewUi(),
            );
          }
          else{
           return const AspectRatio(
              aspectRatio: 16/9 ,
              child: NewUi(),
            );
          }
        }
      )
    );
  }
}



