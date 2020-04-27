import 'package:scorecard/dummy/DummyData.dart';
import 'package:scorecard/models/OrganisationUnit.dart';

class OrganisationUnitService {

  List<OrganisationUnit> getOrganisationUnits() {

    return DummyData().getOrganisationUnits();
  }
  List<OrganisationUnit> getOrganisationUnitsByLevel(int levelId) {
    print("${levelId} HAHAHAHA");

    return DummyData().getOrganisationUnitsByLevel(levelId);
  }
}