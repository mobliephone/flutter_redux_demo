import 'package:flutter/material.dart';
import 'package:flutter_reducer/states/count_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AddScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new AddWidget();
  }
}

class AddWidget extends State<AddScreen>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("add_screen"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("点击右下角按钮，你将会看到数字在不断增加！"),
            StoreConnector<CountState,int>(
              converter: (store) => store.state.count,
              builder: (context,count){
                return new Text(count.toString());
              },
            )
          ],
        ),
      ),
      floatingActionButton: StoreConnector<CountState,VoidCallback>(
        converter: (store){
          //分发事件
          return () => store.dispatch(Action.increment);
        },
        builder: (context,callback){
          return new FloatingActionButton(
            onPressed: callback,
            child: new Icon(Icons.add),
          );
        },
      )
    );
  }

}