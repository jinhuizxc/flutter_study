import 'package:flutter/material.dart';

class GlobalKeyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('GlobalKey'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
