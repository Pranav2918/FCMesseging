import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 0, 21, 0.9),
        elevation: 0.0,
        title: Text('RED'),
      ),
      backgroundColor: Color.fromRGBO(255, 0, 21, 0.9),
      body: Center(
        child: Text(
          'THIS IS RED...',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
