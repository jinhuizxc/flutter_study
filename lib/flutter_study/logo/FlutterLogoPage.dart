import 'package:flutter/material.dart';

class FlutterLogoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('FlutterLogo'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
