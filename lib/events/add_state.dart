


import 'package:formvalidateassign2/events/state_event.dart';
import 'package:formvalidateassign2/model/food.dart';




class AddState extends StateEvent {
  Food newFood;

  AddState(Food food) {
    newFood = food;
  }
}
