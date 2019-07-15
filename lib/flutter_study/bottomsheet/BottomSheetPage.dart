import 'package:flutter/material.dart';

class BottomSheetPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('BottomSheet'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
