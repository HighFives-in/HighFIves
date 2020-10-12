import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/models/relations/relation.dart';
import 'package:highfives_ui/resources/relations/mock.dart';
import 'package:highfives_ui/resources/relations/studentsMock.dart';

class RelationResource {
  //TODO INTEGRATE WITH SERVICE
  Future<dynamic> getexistingRelations(String role) async {
    //this is current logged in role
    if (role == TNP) {
      await Future.delayed(Duration(seconds: 1));
      return relationsMock;
    } else if (role == EMPLOYER) {
      await Future.delayed(Duration(seconds: 1));
      return relationsMock;
    }
  }

  Future<dynamic> getRelationDetails(int id) async {
    //this is current logged in role
    await Future.delayed(Duration(seconds: 1));
    Relation relation = Relation.fromMap(relationsMock[0]);
    return relation;
  }

// new relations
  Future<dynamic> getAllColleges() async {
    await Future.delayed(Duration(seconds: 1));
    return newRelationMock;
  }

  Future<dynamic> getAllEmployers() async {
    await Future.delayed(Duration(seconds: 1));
    return allEmployersMock;
  }

  //This is not a property relations will move it later, keeping all mocks in one file
  Future<dynamic> getAllStudents() async {
    await Future.delayed(Duration(seconds: 1));
    return allStudentsMock;
  }
}
