import 'package:flutter/material.dart';
import 'package:flutter_reducer/page/add_screen.dart';
import 'package:flutter_reducer/states/count_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeWidget();
  }
}

class HomeWidget extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("flutter_reducer"),
      ),
      body: new HomeBody(),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => new AddScreen()
            )
          );
        },
        child: new Text("前往"),
      ),
    );
  }
}

class HomeBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new StoreConnector<CountState,int>(
        //获取实时状态值
        converter: (store) => store.state.count,
        builder: (context,count){
          return new Text(count.toString());
        },
      ),
    );
  }
}