import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/resources/relations/mock.dart';

class RelationResource {
  //TODO INTEGRATE WITH SERVICE
  Future<dynamic> getexistingRelations(String role) async {
    //this is current logged in role
    if (role == TNP) {
      await Future.delayed(Duration(seconds: 1));
      return existingRelationMock;
    } else if (role == EMPLOYER) {
      await Future.delayed(Duration(seconds: 2));
      return employerExistingRelationMock;
    }
  }

  Future<dynamic> getRelationDetails(int id) async {
    //this is current logged in role
    await Future.delayed(Duration(seconds: 1));
    return relationDetailsMock;
  }
}
