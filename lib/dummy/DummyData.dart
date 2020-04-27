import 'package:scorecard/models/Indicator.dart';
import 'package:scorecard/models/Level.dart';
import 'package:scorecard/models/OrganisationUnit.dart';

class DummyData{

  List<Indicator> getIndicators(){
    return <Indicator>[
      Indicator(0, 'Select an Indicator**', true),
      Indicator(1, '% of maleria nets', false),
      Indicator(2, '% of treated persons', false),
      Indicator(3, '% of dead persons', true),
    ];
  }

  List<OrganisationUnit> getOrganisationUnits(){
    return <OrganisationUnit>[
      OrganisationUnit(1, 'org unit 1'),
      OrganisationUnit(2, 'org unit 2'),
      OrganisationUnit(3, 'org unit 3'),
    ];
  }

  List<OrganisationUnit> getOrganisationUnitsByLevel(int levelId){

    switch(levelId){

      case 1: {
        return <OrganisationUnit>[
          OrganisationUnit(1, 'org unit 1'),
          OrganisationUnit(2, 'org unit 2'),
          OrganisationUnit(3, 'org unit 3'),
        ];
      }
      break;

      case 2: {
        return <OrganisationUnit>[
          OrganisationUnit(1, 'org unit 4'),
          OrganisationUnit(2, 'org unit 5'),
          OrganisationUnit(3, 'org unit 6'),
        ];
      }

      break;

      case 3: {
        return <OrganisationUnit>[
          OrganisationUnit(1, 'org unit 7'),
          OrganisationUnit(2, 'org unit 8'),
          OrganisationUnit(3, 'org unit 9'),
        ];
      }

      break;

      default:{
        return <OrganisationUnit>[
          OrganisationUnit(1, 'Select org unit...'),
        ];
      }
      break;
    }


  }

  List<Level> getLevels(){
    return <Level>[
      Level(0, 'Select a level**^^^???'),
      Level(1, 'National'),
      Level(2, 'Regional'),
      Level(3, 'District'),
    ];
  }
}