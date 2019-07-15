import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Stack'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
