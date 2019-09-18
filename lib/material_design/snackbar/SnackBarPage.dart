import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('SnackBar'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
