import 'package:flutter/material.dart';

class GreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        title: Text('GREEN'),
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          'THIS IS Green...',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
