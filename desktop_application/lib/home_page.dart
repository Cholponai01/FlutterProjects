import 'package:flutter/material.dart';

class UmnyiZvonok extends StatefulWidget {
  const UmnyiZvonok({super.key});

  @override
  State<UmnyiZvonok> createState() => _UmnyiZvonokState();
}

class _UmnyiZvonokState extends State<UmnyiZvonok> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(""))
        ),
      ),
      
    );
  }
}