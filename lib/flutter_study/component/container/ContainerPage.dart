import 'package:flutter/material.dart';

// Container组件
class ContainerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Container'),
        leading: BackButton(),
      ),
      body: Center(
        
      ),
    );
  }
}
