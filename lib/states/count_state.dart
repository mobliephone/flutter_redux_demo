import 'package:meta/meta.dart';

//定义状态
@immutable
class CountState{
  final int _count;
  get count => _count;

  CountState(this._count);

  //定义初始化状态
  CountState.initState(): _count = 0;
}

//定义action
enum Action{
  increment
}

//链接action和状态
CountState reducer(CountState state,action){
  if (action == Action.increment){
    return CountState(state._count+1);
  }
  return state;
}