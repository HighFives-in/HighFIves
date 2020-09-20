import 'package:flutter/material.dart';
import 'package:highfives_ui/models/relations/allColleges.dart';
import 'package:highfives_ui/screens/employer/relations/new/large.dart';
import 'package:highfives_ui/screens/utils/loading.dart';
import 'package:highfives_ui/utils/responsiveLayout.dart';
import 'package:highfives_ui/resources/relations/relations.dart';
import 'package:highfives_ui/utils/toast.dart';
import 'dart:convert';

class BuildNewRelations extends StatelessWidget {
  RelationResource _relationResource = RelationResource();

  Future<dynamic> _getAllColleges() {
    return _relationResource.getAllColleges();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: FutureBuilder(
        future: this._getAllColleges(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            var allColleges = (snapshot.data as List)
                .map((college) => BuildNewRelationCollegeModel.fromMap(college))
                .toList();
            return ResponsiveLayout(
              largeScreen: LargeBuildNewRelation(allColleges),
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
