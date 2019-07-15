import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Image'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
