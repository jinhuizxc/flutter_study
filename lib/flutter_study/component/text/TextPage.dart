import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('TextPage'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
