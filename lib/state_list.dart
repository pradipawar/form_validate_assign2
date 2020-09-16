
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidateassign2/events/set_states.dart';
import 'package:formvalidateassign2/state_form.dart';

import 'bloc/states_bloc.dart';
import 'db/database_provider.dart';

import 'model/food.dart';

class StateList extends StatefulWidget {
  const StateList({Key key}) : super(key: key);

  @override
  _StateListState createState() => _StateListState();
}

class _StateListState extends State<StateList> {
  @override
  void initState() {
    super.initState();
    DatabaseProvider.db.getFoods().then(
          (foodList) {
        BlocProvider.of<StatesBloc>(context).add(SetStates(foodList));
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    print("Building entire food list scaffold");
    return Scaffold(
      appBar: AppBar(title: Text("StateList")),
      body: Container(
        child: BlocConsumer<StatesBloc, List<Food>>(
          builder: (context, foodList) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                print("stateList: $foodList");

                Food food = foodList[index] as Food;
                return ListTile(
                  title: Text(food.country_name, style: TextStyle(fontSize: 30)),
                  subtitle: Text(
                    "State: ${food.state_name}\nCity: ${food.city_name}",
                    style: TextStyle(fontSize: 20),
                  ),

                  /* onTap: () => showFoodDialog(context, food, index));*/
                );
              },
              itemCount: foodList.length,
              separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.black),
            );
          },
          listener: (BuildContext context, foodList) {},
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => StateForm()),
        ),
      ),
    );
  }
}
