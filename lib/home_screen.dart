import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('HomeScreen', style:TextStyle(color:Colors.white, fontSize: 25, fontWeight: FontWeight.w500)),backgroundColor: Colors.blueGrey,),
      body: Center(child:Text('Welcome to Aeologic!')),
    );
  }
}
