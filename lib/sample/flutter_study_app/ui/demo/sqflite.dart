import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/*
 * Sqflite数据库
 */
class SqflitePage extends StatefulWidget {
  @override
  _SqflitePageState createState() => _SqflitePageState();
}

class _SqflitePageState extends State<SqflitePage> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _ageController = new TextEditingController();
  String _data = '暂无数据';

  String _dbName = 'user.db'; // 数据库名称
  int _dbVersion = 1; // 数据库版本
  // 创建学生表
  String _createTableSQL =
      'create table student_table(id integer primary key, name text, age integer)';

  @override
  void initState() {
    super.initState();
    // 创建数据库、学生表
    _createDb(_dbName, _dbVersion, _createTableSQL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("sqflite数据存储", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        color: Colors.grey[200],
        margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(
                "设置进入程序默认创建数据库和一张学生表，如下可对表的姓名、年龄进行增删改查操作：",
                style: TextStyle(fontSize: 14, color: Color(0xff666666)),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getNameInputView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getAgeInputView(),
            Padding(padding: EdgeInsets.only(top: 30)),
//            _getAddBtnView(),
            Padding(padding: EdgeInsets.only(top: 10)),
//            _getdeleteBtnView(),
            Padding(padding: EdgeInsets.only(top: 10)),
//            _getUpdateBtnView(),
            Padding(padding: EdgeInsets.only(top: 10)),
//            _getQueryBtnView(),
            Padding(padding: EdgeInsets.only(top: 30)),
            Text(_data,style: TextStyle(color: Colors.red,fontSize: 18),)
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  // 输入名字
  _getNameInputView() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _nameController,
      decoration: InputDecoration(
          hintText: '姓名',
          hintStyle: TextStyle(color: Color(0xFF888888)),
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
    );
  }

  _getAgeInputView() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _ageController,
      decoration: InputDecoration(
        hintText: "年龄",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  void _createDb(String dbName, int dbVersion, String createTableSQL) async {
    // 获取数据库路径
    var dataBasePath = await getDatabasesPath();
    // import 'package:path/path.dart';
    String path = join(dataBasePath, dbName);
    print("数据库路径：$path数据库版本$dbVersion");
    // 打开数据库
    await openDatabase(path, version: dbVersion,
        onUpgrade: (Database db, int oldVersion, int newVersion) async {
      // 数据库升级,只回调一次
      print('数据库需要升级！旧版：$oldVersion,新版：$newVersion');
    }, onCreate: (Database db, int dbVersion) async {
      // 创建表，只回调一次
      await db.execute(createTableSQL);
      await db.close();
    });

    // 设置状态？
    setState(() {
      _data = '成功创建数据库db！\n数据库路径: $path \n数据库版本$dbVersion';
    });
  }
}
