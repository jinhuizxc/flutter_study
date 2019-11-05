import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
 * 文本TextField
 *
 * Flutter（五）TextField
 * https://www.jianshu.com/p/f7b37f7fa2a0
 *
 *
 */
class TextFieldWidget extends StatelessWidget {
  //添加文本编辑控制器 监听文本输入内容变化
  TextEditingController _textEditingController = new TextEditingController();

  // 该输入框的焦点处理，当获取/失去焦点时回调方法
  FocusNode _focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    // 对文本编辑器进行监听
    _textEditingController.addListener(() {
      print('你输入的内容为: ${_textEditingController.text}');
    });

    return Scaffold(
        appBar: AppBar(
          title: Text('TextField组件学习'),
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Column(children: <Widget>[
                  new TextField(
                    //绑定controller
                    controller: _textEditingController,
                    // 允许输入的最大长度，一个字母一个符号一个汉字都算1 ,
                    // 设置此项会让TextField右下角有一个输入数量的统计字符串
                    maxLength: 20,
                    //超过最大长度后是否还允许继续输入
                    // maxLengthEnforced: true,//默认true  超过长度后输入无效
                    // 右下角数字 显示10/10   此时onchange方法依然会调用，返回值就是限制了长度的值 超过后的输入不显示
                    maxLengthEnforced: false,
                    //超过后可继续输入  右下角数字显示，比如 23/10
                    //不是允许输入的最大行数,指的是输入框内可显示的高度是几行，超过设定行数后，scroll滚动显示
                    maxLines: 1,
                    //是否自动更正
                    autocorrect: true,
                    // 该输入框的焦点处理，当获取/失去焦点时回调方法
//                    focusNode: _focusNode,
                    //是否自动对焦
                    autofocus: false,
                    //是否是密码
                    obscureText: false,
                    //文本对齐方式  输入文字后，文字显示时是靠左靠右还是居中
                    textAlign: TextAlign.left,
                    // 靠右  textDirection的设置无效
//              textAlign: TextAlign.left,// 靠左   textDirection的设置无效
//              textAlign: TextAlign.center,// 居中
//              textAlign: TextAlign.start,// TextDirection.ltr时靠左，TextDirection.rtl时靠右
//              textAlign: TextAlign.end,// TextDirection.ltr时靠右，TextDirection.rtl时靠左
//              textAlign: TextAlign.justify,// 两端对齐
                    // 从左边还是右边开始输入文字
//                    textDirection: TextDirection.ltr,
                    textDirection: TextDirection.rtl,
                    //从右边输入  光标在右边
                    //从左边输入  光标在左边
                    // 输入文本的样式  字体大小  颜色 等

                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.red,
                    ),
                    //是否启用输入  如果是false 就无法输入了，且errorText失效
                    enabled: true,
                    //白名单校验，只允许输入符合规则的文本
//                    inputFormatters: [
//                      WhitelistingTextInputFormatter.digitsOnly
//                    ],
                    //允许的输入格式,不是控制的键盘，只有符合格式的输入才会显示 digitsOnly表示只允许数字。
//              inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-z]"))],//只允许输入a-z小写字母。

                    //允许输入的最大长度，一个字母一个符号一个汉字都算1 不会显示右下角的字数
                    //如果设置了maxLength  那么长度限制以这里的限制为准，但是会显示右下角的字数
//              inputFormatters: [LengthLimitingTextInputFormatter(15)],

                    //黑名单校验，只允许输入给定规则以外的文本
//            inputFormatters: [BlacklistingTextInputFormatter(RegExp("[a-z]"))],//不允许输入a-z小写字母
//            inputFormatters: [BlacklistingTextInputFormatter(RegExp("[a-z]"),replacementString: "-")],//不允许输入a-z小写字母  如果输入了 用“-”替代

                    //弹出的键盘的类型
                    keyboardType: TextInputType.text,
                    // 文本
//              keyboardType: TextInputType.number,//数字  数字键盘  + 部分常用数学符合
//              keyboardType: TextInputType.phone,//手机号  数字键盘  + 部分手机号常用符合"*", and "#".
//              keyboardType: TextInputType.datetime,// 时间  数字键盘  + 部分时间常用符合":", and "-".
//              keyboardType: TextInputType.emailAddress,//邮件  英文键盘 + 邮件符合  "@" and "."
//              keyboardType: TextInputType.multiline,// 多行输入   控制enter键的功能为换行了
//              keyboardType: TextInputType.url,//url格式 英文键盘+url符合 "/" and "."

                    //设置键盘上enter键的显示内容
                    textInputAction: TextInputAction.search,
                    //搜索
//              textInputAction: TextInputAction.none,//默认回车符号
//              textInputAction: TextInputAction.done,//安卓显示 回车符号
//              textInputAction: TextInputAction.go,//开始
//              textInputAction: TextInputAction.next,//下一步
//              textInputAction: TextInputAction.send,//发送
//              textInputAction: TextInputAction.continueAction,//android  不支持
//              textInputAction: TextInputAction.emergencyCall,//android  不支持
//              textInputAction: TextInputAction.newline,//安卓显示 回车符号
//              textInputAction: TextInputAction.route,//android  不支持
//              textInputAction: TextInputAction.join,//android  不支持
//              textInputAction: TextInputAction.previous,//安卓显示 回车符号
//              textInputAction: TextInputAction.unspecified,//安卓显示 回车符号

                    // 控制键盘大小写切换的   试过了 但是好像没有效果？？
//              textCapitalization: TextCapitalization.characters,  // 输入时键盘的英文都是大写
//              textCapitalization: TextCapitalization.none,  //  键盘英文默认显示小写
//              textCapitalization: TextCapitalization.sentences, // 在输入每个句子的第一个字母时，键盘大写形式，输入后续字母时键盘小写形式
//              textCapitalization: TextCapitalization.words,// 在输入每个单词的第一个字母时，键盘大写形式，输入其他字母时键盘小写形式

                    //光标颜色
                    cursorColor: Colors.red,
                    //光标圆角
                    cursorRadius: Radius.circular(10),
                    //光标宽度
//                    cursorWidth: 10,

                    // // 添加装饰效果InputDecoration, 输入框的边框样式
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        // 级别最低的border，没有设置其他border时显示的border
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width: 5, color: Colors.yellow,
                              style: BorderStyle.solid)),
                      //显示在输入框前面的图标，在文字和下划线前面
//                      icon: Icon(Icons.star_border),
                      helperText: 'Name',
//                      hintText: '请输入用户名',
                      icon: Icon(Icons.phone),
                      labelText:"labelText", //显示在输入框内的提示语，一旦输入框获取焦点就字体缩小并上移到输入上方，作为提示使用
                      labelStyle: TextStyle(color: Colors.green),
                      hasFloatingPlaceholder: false, //默认为true，表示labelText是否上浮，true上浮，false表示获取焦点后labelText消失

                      errorText: "errorText", //在输入框下方的提示语，通常用于错误提示，比如密码错误 用户名错误等  同时输入框的下划线修改为了红色
                      errorStyle: TextStyle(color: Colors.orange),
                      errorMaxLines: 1, //做多显示的行数  ，超过行数显示...
                      errorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.orange,style: BorderStyle.solid)), //失去焦点时，error时下划线显示的边框样式，不设置则使用默认的的下划线
                      focusedErrorBorder: UnderlineInputBorder( borderSide: BorderSide(width: 5, color: Colors.green,style: BorderStyle.solid)), //获得焦点时，error时下划线显示的边框样式，不设置则使用默认的的下划线

                      //输入框的padding  对内部的文字有效,
                      // 输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                      contentPadding: EdgeInsets.all(20),
                      isDense: true, //改变输入框是否为密集型，默认为false，修改为true时，图标及间距会变小  行间距减小

                      fillColor: Colors.grey[100], //输入框内部的填充颜色  需filled=true
                      filled: true,

//                      prefixText: "prefixText",
                      //显示在输入框内，光标前面的文字   获得焦点后显示
//                      prefixStyle: TextStyle(color: Colors.red),
                      //文本样式
                      ////显示在输入框内，光标前面的图标，注意icon是在输入框外
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: Icon(Icons.phone),
                      //显示在输入框内，光标文字后面，输入框最后面的图标
//                      suffixText: "suffixText",
                      //显示在输入框内，输入框最后面的文字    但是在suffixIcon之前。 注意suffixText不能与suffix共存
//                      suffixStyle: TextStyle(color: Colors.red),
                      //文本样式
//                      suffix: Image.asset(
//                        "images/img04.jpg",
//                        width: 40,
//                        height: 40,
//                      ),
//                      suffix: Icon(Icons.home),
                      counterText: "counterText",
                      //显示在输入的下划线外右下角的文字提示,会覆盖maxLength的右下角显示的字数限制。
                      counterStyle: TextStyle(color: Colors.pink),
//                      counter: Icon(Icons.send),//显示在输入的下划线外右下角的提示,可以是任何Widget ，counterText与counter只能存在一个
                      //显示在输入框内，最后面的指定图片或其他Widget
                      // 以下属性可用来去除TextField的边框
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),

                    // 键盘外观  仅ios有效
//              keyboardAppearance: Brightness.light,
                    keyboardAppearance: Brightness.dark,

                    //？？？暂未发现什么用途
                    scrollPadding: EdgeInsets.all(50),

                    //？？？暂未发现什么用途
//              dragStartBehavior: DragStartBehavior.start,
                    dragStartBehavior: DragStartBehavior.down,

                    //长按输入的文字时，true显示系统的粘贴板  false不显示
                    enableInteractiveSelection: false,
                    //自定义数字显示   指定maxLength后 右下角会出现字数，flutter有默认实现  可以通过这个自定义
//                    buildCounter: _buildCount,

                    //点击一次输入就调用
                    onTap: () {
                      print('ontap');
                    },
                    // 文本内容改变时回调
                    onChanged: (text) {
                      print('change  调用: $text');
                    },
                    // 内容提交时回调
                    onSubmitted: (text) {
                      //键盘按回车后调用
                      print('submit 调用:  $text');
                    },
                    //按回车时调用 先调用此方法  然后调用onSubmitted方法
                    onEditingComplete: () {
                      print('onEditingComplete');
                    },
                  ),
                ]))));
  }

  // 自定义数字显示
  Widget _buildCount(
    /// The build context for the TextField
    BuildContext context, {

    /// 当前字数长度
    @required int currentLength,

    /// 最大字数长度
    @required int maxLength,

    /// 当前输入框是否有焦点
    @required bool isFocused,
  }) {
    //自定义的显示格式
    return Text("$currentLength $maxLength");
  }
}

/*
 * TextEditingController和FocusNode
 *
 * TextEditingController，可以看做TextField的一个引用，
 * 通过controller可以获取输入框的文本、设置光标位置、清空输入框等操作。
 * FocusNode，管理TextField的焦点。
 *
 */
class FlutterTextFieldPage extends StatefulWidget {
  @override
  _FlutterTextFieldPageState createState() => _FlutterTextFieldPageState();
}

class _FlutterTextFieldPageState extends State<FlutterTextFieldPage> {
  var controller = TextEditingController();
  FocusNode _focusNode = new FocusNode();

//焦点变化时回调
  void focusListener() {
    print(_focusNode.hasFocus); //当前的输入框的焦点
//    _focusNode.unfocus();//释放焦点
  }

//输入框内容变化时回调
  void controllerListener() {
    print(controller.text); //获取输入框内的值
//    controller.text = "aaa";//设置输入框内的值
//    if(controller.text.length>5) {
//      controller.clear(); //清空输入框内的内容
//    }
//    print(controller.selection);//获取当前选中的文字，如果没有选中那么显示当前光标的位置  TextSelection(baseOffset: 4, extentOffset: 4, affinity: TextAffinity.downstream, isDirectional: false)
    //设置文字选中，baseOffset起始index  extentOffset结束index(不含）如果二者相同则是设置光标位置  如果二者不同则是选中它们之间的文字
//    controller.selection = TextSelection(baseOffset: 2, extentOffset: 4, affinity: TextAffinity.downstream, isDirectional: false);
    controller.selection = TextSelection(
        baseOffset: 1,
        extentOffset: 1,
        affinity: TextAffinity.upstream,
        isDirectional: true);
  }

  @override
  void initState() {
    super.initState();
    //添加焦点版本的监听
    _focusNode.addListener(focusListener);
    //添加输入内容改变时的监听
    controller.addListener(controllerListener);
  }

  @override
  void dispose() {
    //disponse时需要处理
    controller.removeListener(controllerListener);
    _focusNode.removeListener(focusListener);
    controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Divider(
                height: 20,
                color: Colors.grey,
              ),
              TextField(
                controller: controller, //设置controller
                focusNode: _focusNode, //设置焦点管理
              )
            ])));
  }
}

/**
 * decoration 输入框的边框样式，InputDecoration类型
 *
 * TextField(
    decoration: InputDecoration(
    icon: Icon(Icons.phone), //显示在输入框前面的图标，在文字和下划线前面

    //输入框光标前面的图标和文字
    prefixIcon: Icon(Icons.phone),//显示在输入框内，光标前面的图标，注意icon是在输入框外
    prefixText: "prefixText",//显示在输入框内，光标前面的文字   获得焦点后显示
    prefixStyle: TextStyle(color:Colors.yellow),
    prefix: Image.asset("images/img04.jpg",width: 20, height: 20,),//显示在输入框内，光标前面的指定图片或其他Widget   获取焦点后显示。注意prefix不能与prefixIcon prefixText同时指定

    //输入框光标后面的图标和文字
    suffixIcon: Icon(Icons.phone), //显示在输入框内，光标文字后面，输入框最后面的图标
    suffixText: "suffixText", //显示在输入框内，输入框最后面的文字    但是在suffixIcon之前。 注意suffixText不能与suffix共存
    suffixStyle: TextStyle(color: Colors.yellow),
    suffix: Image.asset("images/img04.jpg",width: 20,height: 20,),  //显示在输入框内，最后面的指定图片或其他Widget

    // 显示在输入的下划线外右下角的文字提示
    counterText:"counterText", //显示在输入的下划线外右下角的文字提示,会覆盖maxLength的右下角显示的字数限制。
    counterStyle: TextStyle(color: Colors.pink),
    counter: Icon(Icons.send),//显示在输入的下划线外右下角的提示,可以是任何Widget ，counterText与counter只能存在一个

    // 输入框的文字提示
    labelText:"labelText", //显示在输入框内的提示语，一旦输入框获取焦点就字体缩小并上移到输入上方，作为提示使用
    labelStyle: TextStyle(color: Colors.green),
    helperText: "helperText", //显示在输入框下划线下面的提示语，提示使用
    helperStyle: TextStyle(color: Colors.blue),
    hasFloatingPlaceholder:true, //默认为true，表示labelText是否上浮，true上浮，false表示获取焦点后labelText消失
    hintText: "hintText", //显示在输入框内的提示信息，当输入框为空时显示，一旦开始输入内容就消失
    hintStyle: TextStyle(color: Colors.grey),
    hintMaxLines: 2, //提示语的做多显示行数，超过行数显示...

    // 错误提示相关
    errorText:"errorText", //在输入框下方的提示语，通常用于错误提示，比如密码错误 用户名错误等  同时输入框的下划线修改为了红色
    errorStyle: TextStyle(color: Colors.orange),
    errorMaxLines: 1, //做多显示的行数  ，超过行数显示...
    errorBorder: UnderlineInputBorder(borderSide: BorderSide( width: 5,color: Colors.orange,style: BorderStyle.solid)), //失去焦点时，error时下划线显示的边框样式，不设置则使用默认的的下划线
    focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide( width: 5, color: Colors.green, style: BorderStyle .solid)), //获取焦点时，error时下划线显示的边框样式，不设置则使用默认的的下划线

    //输入框内文字 密集显示
    isDense: true, //改变输入框是否为密集型，默认为false，修改为true时，图标及间距会变小  行间距减小

    //内部padding
    contentPadding: EdgeInsets.all(20), //输入框的padding  对内部的文字有效

    //背景色
    fillColor: Colors.red, //输入框内部的填充颜色  需filled=true
    filled: true,

    //启用和禁用输入框时的边框样式
    disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.blue,style: BorderStyle.solid)), //输入框禁用时，下划线的样式.如果设置了errorText，则此属性无效
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.orange,style: BorderStyle.solid)), //输入框启用时，下划线的样式
    enabled: false,//是否启用输入框
    focusedBorder: UnderlineInputBorder( borderSide: BorderSide(width: 5,color: Colors.blue,style: BorderStyle.solid)), //获取焦点时，下划线的样式
    border: OutlineInputBorder(borderSide: BorderSide(width: 5,color: Colors.yellow,style: BorderStyle.solid)), //级别最低的border，没有设置其他border时显示的border
    //                border: InputBorder.none, //隐藏输入框的线


    ),
    ),


 */
