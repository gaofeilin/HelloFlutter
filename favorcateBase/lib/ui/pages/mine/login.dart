import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/size_fit.dart';
import 'package:favorcate/core/extension/int_extension.dart';
import 'package:flutter/rendering.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _pwdEditingController;
  TextEditingController _userNameEditingController;

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  List<TextEditingController> _textFieldList = [];
  List<FocusNode> _focusNodeList = [];

  @override
  void initState() {
    super.initState();

    _pwdEditingController = TextEditingController();
    _userNameEditingController = TextEditingController();
    _pwdEditingController.addListener(() {});
    _userNameEditingController.addListener(() {});

    _textFieldList = [_pwdEditingController, _userNameEditingController];
    _focusNodeList = [_userNameFocusNode, _pwdFocusNode];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("登录"),
        // backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopBannerWidget(),
          _buildAccountLoginTip(),
          _buildEditWidget(),
          _buildListView(),
          _buildLoginAndRegistBtn(),
        ],
      ),
    );
  }

  _buildTopBannerWidget() {
    return Container(
      child: Image.network(
        "https://www.itying.com/images/flutter/1.png",
        fit: BoxFit.cover,
      ),
    );
  }

  _buildAccountLoginTip() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        "中食汇会员登录",
        maxLines: 1,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 16, color: Colors.black54),
      ),
    );
  }

  _buildEditWidget() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
            width: 1.0 / MediaQuery.of(context).devicePixelRatio,
            color: Colors.grey.withOpacity(0.5)),
      ),
    );
  }

  _buildListView() {
    return Container(
      // padding: EdgeInsets.only(left: 10,right: 10),
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.5)),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(), //不滚动

          itemCount: 2,
          itemBuilder: (context, index) {
            return _buildLoginNameTextField(index);
          }),
    );
  }

  _buildLoginNameTextField(int index) {
    return TextField(
      controller:
          index == 0 ? _userNameEditingController : _pwdEditingController,
      focusNode: index == 0 ? _userNameFocusNode : _pwdFocusNode,
      keyboardType: TextInputType.text, //键盘类型 即 可输入的类型，比如number就只能输入数字
      textInputAction: TextInputAction.done, //即键盘右下角的按钮，常见的比如完成，右下角是一个完成的对号按钮
      cursorColor: Colors.orange, //默认是一个蓝色的竖线
      cursorWidth: 2, //光标宽度，默认为 2.0
      maxLines: 1, //设置最多行,maxLines: 3,minLines: 1,
      decoration: InputDecoration(
        hintText: "登录名/邮箱/手机", //输入提示文字
        border: InputBorder.none, // 隐藏边框
        prefixIcon:
            index == 0 ? Icon(Icons.people) : Icon(Icons.local_activity),
        suffixIcon: buildsuffixIcon(index),

        // (_userNameEditingController.text ?? "").isNotEmpty
        //     ? IconButton(
        //         icon: Icon(Icons.scanner),
        //         onPressed: () => {},
        //       )
        //     : IconButton(
        //         icon: Icon(
        //           Icons.cancel,
        //           color: Colors.grey,
        //         ),
        //
        //         onPressed: () {
        //           _userNameEditingController.clear();
        //           _userNameFocusNode.unfocus();
        //           setState(() {});
        //         })
      ),

      onChanged: (text) {
        print("输入改变时" + text);
      },
    );
  }

  Widget buildsuffixIcon(int index) {
    if (index == 0) {
      if (_userNameEditingController.text.length > 0) {
        return IconButton(
            icon: Icon(
              Icons.cancel,
              color: Colors.grey,
            ),
            onPressed: () {
              _userNameEditingController.clear();
              _userNameFocusNode.unfocus();
              setState(() {});
            });
      } else {
        return IconButton(
            icon: Icon(
              Icons.scanner,
              color: Colors.grey,
            ));
      }
    } else {
      if (_userNameEditingController.text.length > 0) {
        return IconButton(
            icon: Icon(
              Icons.cancel,
              color: Colors.grey,
            ),
            onPressed: () {
              _userNameEditingController.clear();
              _userNameFocusNode.unfocus();
              setState(() {});
            });
      } else {
        return IconButton(
            icon: Icon(
              Icons.scanner,
              color: Colors.grey,
            ));
      }
    }
  }

  _buildLoginAndRegistBtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton("登录"),
          _buildButton("注册"),
        ],
      ),
    );
  }

  _buildButton(String text) {
    return GestureDetector(
      child: Container(
        width: (ZSHSizeFit.screenWidth - 60) / 2,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.5)),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      onTap: _logButtonPressed(text),
    );
  }





  _logButtonPressed(String text){
    if(text == "登录"){

    }else{//注册

    }

  }
}
