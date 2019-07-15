import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Button'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
