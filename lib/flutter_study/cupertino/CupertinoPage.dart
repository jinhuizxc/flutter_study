import 'package:flutter/material.dart';

class CupertinoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Cupertino'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
