import 'package:flutter/material.dart';

class CollectionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Collection'),
        leading: BackButton(),
      ),
      body: Center(

      ),
    );
  }
}
