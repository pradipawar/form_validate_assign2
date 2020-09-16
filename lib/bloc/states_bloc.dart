
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidateassign2/events/add_state.dart';

import 'package:formvalidateassign2/events/set_states.dart';
import 'package:formvalidateassign2/events/state_event.dart';
import 'package:formvalidateassign2/model/food.dart';




class StatesBloc extends Bloc<StateEvent, List<Food>> {
  @override
  List<Food> get initialState => List<Food>();

  @override
  Stream<List<Food>> mapEventToState(StateEvent event) async* {
    if (event is SetStates) {
      yield event.foodList;
    } else if (event is AddState) {
      List<Food> newState = List.from(state);
      if (event.newFood != null) {
        newState.add(event.newFood);
      }
      yield newState;
    } /*else if (event is DeleteFood) {
      List<Food> newState = List.from(state);
      newState.removeAt(event.foodIndex);
      yield newState;
    } *//*else if (event is UpdateFood) {
      List<Food> newState = List.from(state);
      newState[event.foodIndex] = event.newFood;
      yield newState;
    }*/
  }
}
