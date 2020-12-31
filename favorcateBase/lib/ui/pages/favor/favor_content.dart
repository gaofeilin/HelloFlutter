import 'package:flutter/material.dart';
import 'pop_mask_view.dart';
import 'package:fluwx/fluwx.dart';
import 'wechat_share.dart';



class FavorContent extends StatefulWidget {
  @override
  _FavorContentState createState() => _FavorContentState();
}

class _FavorContentState extends State<FavorContent> {

  List<Widget> _addPageStackList = [];


  _initFluwx() async{
    await registerWxApi(
      appId: "wx2313f1102858bfac",
      doOnAndroid: false,
      doOnIOS: true,
      universalLink: "https://yunchuangzhixun/zsh/"
    );
    var result = await isWeChatInstalled;
    print("is installed $result");

  }
  Future<void> initPlatformState() async {}


  @override
  void initState() {
    super.initState();
    _addPageStackList = [];

    _initFluwx();

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[buildFatherView()]..addAll(_addPageStackList),
    );
  }

  Widget buildFatherView(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildImg(),
          buildPopMask(),
          buildText("跳转到分享页面"),
          buildSetpsList(),
          buildText("结果"),
          // buildMaterialList(),
        ],
      ),
    );
  }

  Widget buildImg(){
    return Image.network("https://www.itying.com/images/flutter/1.png");
  }

  Widget buildPopMask(){
    return RaisedButton(
      child: Icon(Icons.add,color: Colors.red,),
        onPressed: (){
        setState(() {
          _addPageStackList.add(AddPage(callback: _onTapBackground));
        });
        },
    );
  }
  _onTapBackground() {
    setState(() {
      _addPageStackList.removeLast();
    });
  }

  Widget buildText(String title){
    return GestureDetector(
      child: Container(
        color: Colors.lightBlue,
        padding: EdgeInsets.all(10),
          child: Text(title,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),)
      ),
      onTap: (){
        // Navigator.of(context).pushNamed("WeChatSharePge");
        ///路由跳转
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return WeChatSharePge();
        }));
      },
    );
  }

  Widget buildSetpsList(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(6),
      ),


      width: MediaQuery.of(context).size.width-20,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),//不滚动


        itemCount: 5,
          itemBuilder: (BuildContext context, int index){
            return Card(
              color: Colors.orangeAccent,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("1234"),
              ),
            );
          }
      ),
    );
  }

  Widget buildMaterialList(){
    return Container(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              leading: Icon(Icons.people),
              title: Text("联系人：张三"),
              subtitle: Text("15210587392"),
              trailing: Icon(Icons.add),
            );
          }
      ),
    );
  }

}
