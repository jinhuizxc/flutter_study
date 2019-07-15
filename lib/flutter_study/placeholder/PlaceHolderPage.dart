import 'package:flutter/material.dart';

class PlaceHolderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('PlaceHolder'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
