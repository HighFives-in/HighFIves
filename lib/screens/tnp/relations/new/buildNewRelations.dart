import 'package:flutter/material.dart';
import 'package:highfives_ui/models/relations/allEployersRelationModel.dart';
import 'package:highfives_ui/screens/tnp/relations/new/large.dart';
import 'package:highfives_ui/screens/utils/loading.dart';
import 'package:highfives_ui/utils/responsiveLayout.dart';
import 'package:highfives_ui/resources/relations/relations.dart';
import 'package:highfives_ui/utils/toast.dart';

class TnpBuildNewRelations extends StatelessWidget {
  RelationResource _relationResource = RelationResource();

  Future<dynamic> _getAllEmployers() {
    return _relationResource.getAllEmployers();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: FutureBuilder(
        future: this._getAllEmployers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            var allcompanies = (snapshot.data as List)
                .map(
                    (company) => BuildNewRelationEmployerModel.fromMap(company))
                .toList();
            return ResponsiveLayout(
              largeScreen: LargeBuildTnpNewRelation(allcompanies),
              smallScreen: Container(
                color: Colors.red,
              ),
            );
          } else if (snapshot.hasError) {
            basicErrorFlutterToast(null);
            //TODO NOT FOUND OR SOMETHING ELSE
            return Container();
          } else {
            return Loading();
          }
        },
      ),
    );
  }
}
