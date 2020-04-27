import 'package:scorecard/dummy/DummyData.dart';
import 'package:scorecard/models/Indicator.dart';

class IndicatorService {

  List<Indicator> getIndicators(){

    return DummyData().getIndicators();
  }
}