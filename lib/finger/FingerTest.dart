
import 'package:flutter/material.dart';
import 'package:flutter_study/finger/services/local_authentication_service.dart';
import 'package:flutter_study/finger/services/service_locator.dart';

/*
 * Flutter - 通过指纹和人脸识别认证
 * https://www.jianshu.com/p/06ba43743b1f
 */
class FingerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFingerPage(),
    );
  }
}

class MyFingerPage extends StatefulWidget {
  @override
  _MyFingerPageState createState() => _MyFingerPageState();
}

class _MyFingerPageState extends State<MyFingerPage> {
  final LocalAuthenticationService _localAuth = locator<LocalAuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/dancamdev.png'),
        ),
        title: Text('Local Authentication'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('authenticate'),
          onPressed: _localAuth.authenticate,
        ),
      ),
    );
  }
}


