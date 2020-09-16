
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidateassign2/state_list.dart';



import 'bloc/states_bloc.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StatesBloc>(
      create: (context) => StatesBloc(),
      child: MaterialApp(
        title: 'Add Country Data',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: StateList(),
      ),
    );
  }
}
