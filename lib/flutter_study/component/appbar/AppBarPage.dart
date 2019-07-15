import 'package:flutter/material.dart';

class AppBarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('AppBar'),
        leading: BackButton(),
      ),
      body: Center(
        child: Text('AppBar'),
      ),
    );
  }
}
