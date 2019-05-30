import 'package:flutter/material.dart';
import 'package:flutter_reducer/page/home_screen.dart';
import 'package:flutter_reducer/states/count_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  /**
   * reducer ：连接state和action
   * initialState：初始化状态
   */
  final store = Store<CountState>(reducer,initialState: CountState.initState());
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {

  final Store<CountState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    //必须用StoreProvider包裹
    return new StoreProvider<CountState>(
      store: store,
      child:  MaterialApp(
        title: 'Flutter Redux',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new HomeScreen(),
      ),
    );
  }
}

