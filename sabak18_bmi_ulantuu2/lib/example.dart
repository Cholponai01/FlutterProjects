import 'package:flutter/material.dart';

class ForExample extends StatefulWidget {
  const ForExample({super.key});

  @override
  State<ForExample> createState() => _ForExampleState();
}

class _ForExampleState extends State<ForExample> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('ForExample'),
        
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
          width: 50,  
          height:50,
          color: Colors.red,
          )
        ],
      )
    );
  }
}
