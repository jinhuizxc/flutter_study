import 'package:flutter/material.dart';

class BehaviorPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Behavior'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
