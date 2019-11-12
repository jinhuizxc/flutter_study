import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  static String table_name = "student_table";

  // 创建学生表
  String _createTableSQL = 'create table ' +
      table_name +
      '(id integer primary key, name text, age integer)';

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
            _getAddBtnView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getdeleteBtnView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getUpdateBtnView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getQueryBtnView(),
            Padding(padding: EdgeInsets.only(top: 30)),
            Text(
              _data,
              style: TextStyle(color: Colors.red, fontSize: 18),
            )
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
    print("数据库路径：$path数据库版本: $dbVersion");
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

  _getAddBtnView() {
    return RaisedButton(
      onPressed: () {
        if (_nameController.text == null || _nameController.text == "") {
          Fluttertoast.showToast(
              msg: 'name不能为空！', backgroundColor: Colors.orange);
          return;
        }
        if (_ageController.text == null || _ageController.text == "") {
          Fluttertoast.showToast(
              msg: 'age不能为空！', backgroundColor: Colors.orange);
          return;
        }

        // 插入数据
        String sql =
            "insert into '$table_name'(name, age) VALUES('${_nameController.text}', '${_ageController.text}')";
        _add(_dbName, sql);
      },
      child: Text(
        '插入数据',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: Colors.orange,
    );
  }

  _getdeleteBtnView() {
    return RaisedButton(
        onPressed: () {
          String sql = "DELETE FROM $table_name"; //无条件删除学生表数据
          _delete(_dbName, sql);
        },
        child: Text(
          "删除数据",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }

  _getUpdateBtnView() {
    return RaisedButton(
        onPressed: () {
          if (_nameController.text == null || _nameController.text == "") {
            Fluttertoast.showToast(
                msg: "姓名不能为空！", backgroundColor: Colors.orange);
            return;
          }

          // int count = await database.rawUpdate(
          //    'UPDATE Test SET name = ?, VALUE = ? WHERE name = ?',
          //    ['updated name', '9876', 'some name']);
          //    print('updated: $count');
          String sql = "UPDATE $table_name SET name =? WHERE id = ?";
          _update(_dbName, sql, [_nameController.text, 1]); // 更改名字，id为1的数据
        },
        child: Text(
          "修改姓名数据",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }

  _getQueryBtnView() {
    return RaisedButton(
        onPressed: () {
          String sql = 'SELECT * FROM $table_name';
          _query(_dbName, sql);
        },
        child: Text(
          "查询数据",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }

  /*********************************数据的增删改查***********************************/
  // 增加一条数据
  void _add(String dbName, String sql) async {
    // 获取数据库路径
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    print("数据库路径：$path");

    Database db = await openDatabase(path);
    await db.transaction((txn) async {
      int count = await txn.rawInsert(sql);
    });
    await db.close();

    setState(() {
      _data = '插入数据成功！';
    });
  }

  ///删
  _delete(String dbName, String sql) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    Database db = await openDatabase(path);
    int count = await db.rawDelete(sql);
    await db.close();

    if (count > 0) {
      setState(() {
        _data = "执行删除操作完成，该sql删除条件下的数目为：$count";
      });
    } else {
      setState(() {
        _data = "无法执行删除操作，该sql删除条件下的数目为：$count";
      });
    }
  }


  // 改
  _update(String dbName, String sql, List list) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    Database db = await openDatabase(path);
    int count = await db.rawUpdate(sql, list); // 修改条件，对应参数值
    await db.close();
    if (count > 0) {
      setState(() {
        _data = "更新数据库操作完成，该sql删除条件下的数目为：$count";
      });
    } else {
      setState(() {
        _data = "无法更新数据库，该sql删除条件下的数目为：$count";
      });
    }
  }

  // 查条数
  _getQueryNum(String dbName, String sql) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    Database db = await openDatabase(path);
    int count = Sqflite.firstIntValue(await db.rawQuery(sql));
    await db.close();
    return count;
  }

  ///查全部
  _query(String dbName, String sql) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    Database db = await openDatabase(path);
//    List<Map> list = await db.rawQuery(sql);
    List<Map<String, dynamic>> list = await db.rawQuery(sql);

    await db.close();
    setState(() {
      _data = '数据详情: $list';
    });
  }
}
