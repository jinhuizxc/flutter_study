import 'package:flutter/material.dart';

class RefreshPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Refresh'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
