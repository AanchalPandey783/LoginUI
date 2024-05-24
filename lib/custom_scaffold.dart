import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 8,
        ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child:child!,
      )
    );
  }
}
