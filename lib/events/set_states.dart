



import 'package:formvalidateassign2/events/state_event.dart';
import 'package:formvalidateassign2/model/food.dart';



class SetStates extends StateEvent {
  List<Food> foodList;

  SetStates(List<Food> state) {
    foodList = state;
  }
}
