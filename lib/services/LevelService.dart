import 'package:scorecard/dummy/DummyData.dart';
import 'package:scorecard/models/Level.dart';

class LevelService {

  List<Level> getLevels() {

    return DummyData().getLevels();
  }
}