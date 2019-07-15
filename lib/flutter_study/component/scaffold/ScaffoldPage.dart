import 'package:flutter/material.dart';

class ScaffoldPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Scaffold'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
