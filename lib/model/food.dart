import 'package:formvalidateassign2/db/database_provider.dart';

class Food {
  int id;
  String country_name;
  String state_name;
  String city_name;
  bool isVegan;

  Food({this.id, this.country_name, this.state_name, this.city_name});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_NAME: country_name,
      DatabaseProvider.COLUMN_NAME1: state_name,
      DatabaseProvider.COLUMN_NAME2: city_name,
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  Food.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID];
    country_name = map[DatabaseProvider.COLUMN_NAME];
    state_name = map[DatabaseProvider.COLUMN_NAME1];
    city_name = map[DatabaseProvider.COLUMN_NAME2];
  }
}
