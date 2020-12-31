import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}


/*
* 两种方式可以监听：1.通过controller，2。notificationlisstener.
* controller:可以监听默认值offset，监听滚动的位置
* notification：包裹着需要滚动的widget。-----NotificationListener(
        onNotification: (ScrollNotification notification) {
          if(notification is ScrollStartNotification){
            print("ScrollNotification监听到开始滚动---当前位置：${notification.metrics.pixels}");
          }else if(notification is ScrollUpdateNotification){
            print("ScrollNotification监听到Z正在滚动---当前位置：${notification.metrics.pixels}");
          }else if(notification is ScrollEndNotification){
            print("ScrollNotification监听到结束滚动---当前位置：${notification.metrics.pixels}");
          }else{
            print("ScrollNotification监听到滚动---当前位置：${notification.metrics.pixels}");
          }

          return true;
        },
        child: ListView.builder
* */
class _CategoryPageState extends State<CategoryPage> {
  ScrollController _scrollController = ScrollController(initialScrollOffset: 100);
  bool _isShowFloatBtn = false;


  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length+1).toString());
    if(mounted)
      setState(() {

      });
    _refreshController.loadComplete();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        _isShowFloatBtn = _scrollController.offset>50;
      });

    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("监听滚动"),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          // if(notification is ScrollStartNotification){
          //   print("ScrollNotification监听到开始滚动---当前位置：${notification.metrics.pixels}");
          // }else if(notification is ScrollUpdateNotification){
          //   print("ScrollNotification监听到Z正在滚动---当前位置：${notification.metrics.pixels}");
          // }else if(notification is ScrollEndNotification){
          //   print("ScrollNotification监听到结束滚动---当前位置：${notification.metrics.pixels}");
          // }else{
          //   print("ScrollNotification监听到滚动---当前位置：${notification.metrics.pixels}");
          // }
          return true;
        },
        child: buildSmartRefresh(),
      ),

      floatingActionButton: _isShowFloatBtn==true? FloatingActionButton(
        child: Icon(Icons.arrow_upward),
          onPressed: (){
          _scrollController.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeOut);
          }
      ):null,
    );

  }

  Widget buildSmartRefresh(){
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
          builder: (BuildContext context,LoadStatus mode){
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("上拉加载");
            }
            else if(mode==LoadStatus.loading){
              body =  CupertinoActivityIndicator();
            }
            else if(mode == LoadStatus.failed){
              body = Text("加载失败！点击重试！");
            }
            else if(mode == LoadStatus.canLoading){
              body = Text("松手,加载更多!");
            }
            else{
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child: body,),
            );
          }
      ),

      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: buildListView(),

    );
  }


  Widget buildListView(){
    return ListView.builder(
        controller: _scrollController,
        itemCount: items.length,
        itemExtent: 100.0,
        itemBuilder: (context, index) {
          return ListTile(
            // leading: Icon(Icons.pets),
            title: Text("【关于我们${items[index]}】",style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            )),
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text("如果是使用enabled为false这种方式，那么TextField使用到的边框样式只是disabledBorder所配置的边框样式",style: TextStyle(
                  fontSize: 13,
                  color: Colors.black
              ),),
            ),
          );
        });
  }






























  Widget buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
            leading: Icon(Icons.people),
            title: Text("联系人"),
          );
        },
        childCount: 10,
      ),
    );
  }

  Widget buildSliverGrid() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.8,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
          );
        },
        childCount: 10,
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        // title: Text("hello world"),
        background: Image.network(
          "https://www.itying.com/images/flutter/1.png",
          fit: BoxFit.cover,
        ),
      ),
      title: Text("Sliver家族"),
      pinned: true,
    );
  }
}
