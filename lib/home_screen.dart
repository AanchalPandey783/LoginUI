import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String name, email;
  HomeScreen({ required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('HomeScreen', style:TextStyle(color:Colors.white, fontSize: 25, fontWeight: FontWeight.w500)),backgroundColor: Colors.blueGrey,),
      body: Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Welcome to Aeologic!', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),),
          const SizedBox(height:50),
          const Text('User Details :'),
          Text('Email : ${email}'),
          Text('Name : ${name}'),

        ],
      )),
    );
  }
}
