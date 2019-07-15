import 'package:flutter/material.dart';

class PageViewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('PageView'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
