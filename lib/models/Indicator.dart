

import 'package:scorecard/models/GenericModel.dart';

class Indicator extends GenericModel{
  bool isEnabled;
  Indicator(int id, String name, this.isEnabled) : super(id, name);
}


