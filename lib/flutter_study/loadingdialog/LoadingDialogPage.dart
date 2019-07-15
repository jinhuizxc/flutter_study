import 'package:flutter/material.dart';

class LoadingDialogPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('LoadingDialog'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
