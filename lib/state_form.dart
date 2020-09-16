
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidateassign2/events/add_state.dart';


import 'bloc/states_bloc.dart';
import 'db/database_provider.dart';

import 'model/food.dart';


class StateForm extends StatefulWidget {
  final Food food;
  final int foodIndex;

  StateForm({this.food, this.foodIndex});

  @override
  State<StatefulWidget> createState() {
    return FoodFormState();
  }
}

class FoodFormState extends State<StateForm> {
  String _country_name;
  String _state_name;
  String _city_name;
  bool _isVegan = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildCountryName() {
    return TextFormField(
      initialValue: _country_name,
      decoration: InputDecoration(labelText: 'Country Name'),
      maxLength: 15,
      style: TextStyle(fontSize: 15),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Country Name is Required';
        }

        return null;
      },
      onSaved: (String value) {

        _country_name = value;
      },
    );
  }

  Widget _buildSatateName() {
    return TextFormField(
      initialValue: _state_name,
      decoration: InputDecoration(labelText: 'State Name'),
      maxLength: 15,
      style: TextStyle(fontSize: 15),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Country Name is Required';
        }

        return null;
      },
      onSaved: (String value) {

        _state_name = value;
      },

    );
  }
  Widget _buildCityName() {
    return TextFormField(
      initialValue: _city_name,
      decoration: InputDecoration(labelText: 'City Name'),
      maxLength: 15,
      style: TextStyle(fontSize: 15),
      validator: (String value) {
        if (value.isEmpty) {
          return 'City Name is Required';
        }

        return null;
      },
      onSaved: (String value) {

        _city_name = value;
      },

    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.food != null) {

      _country_name = widget.food.country_name;
      _state_name = widget.food.state_name;
      _city_name = widget.food.city_name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("State Form")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildCountryName(),
              _buildSatateName(),
              _buildCityName(),
              SizedBox(height: 20),
              widget.food == null
                  ? RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  Food food = Food(
                    country_name: _country_name,
                    state_name: _state_name,
                    city_name: _city_name,
                  );

                  DatabaseProvider.db.insert(food).then(
                        (storedstate) => BlocProvider.of<StatesBloc>(context).add(
                      AddState(storedstate),
                    ),
                  );

                  Navigator.pop(context);
                },
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        print("form");
                        return;
                      }

                      _formKey.currentState.save();

                      Food food = Food(
                        country_name: _country_name,
                        state_name: _state_name,
                        city_name: _city_name,
                      );
/*
                      DatabaseProvider.db.update(widget.food).then(
                            (storedFood) => BlocProvider.of<FoodBloc>(context).add(
                          UpdateFood(widget.foodIndex, food),
                        ),
                      );*/

                      Navigator.pop(context);
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
