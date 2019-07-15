import 'package:flutter/material.dart';

class DecorationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Decoration'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
