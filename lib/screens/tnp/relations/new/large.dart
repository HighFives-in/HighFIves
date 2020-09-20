import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:highfives_ui/models/relations/allEployersRelationModel.dart';
import 'package:highfives_ui/screens/utils/commons.dart';

class LargeBuildTnpNewRelation extends StatelessWidget {
  List<BuildNewRelationEmployerModel> _allCompanies;
  LargeBuildTnpNewRelation(this._allCompanies);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: viewCollegesInGrid(context, _allCompanies),
    );
  }

  viewCollegesInGrid(
      BuildContext context, List<BuildNewRelationEmployerModel> allCompanies) {
    if (allCompanies.length == 0)
      return Center(
        child: Text('No Companies Found'),
      );
    return new StaggeredGridView.countBuilder(
      crossAxisCount: 8,
      itemCount: allCompanies.length,
      itemBuilder: (BuildContext context, int index) =>
          _getComapnyItemWidget(context, allCompanies[index]),
      staggeredTileBuilder: (int index) => new StaggeredTile.count(2, 2),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 10.0,
    );
  }
}

Widget _getComapnyItemWidget(
    BuildContext context, BuildNewRelationEmployerModel company) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).accentColor.withOpacity(0.1),
              blurRadius: 5),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonWidgetUtils.buildCircularImage(company.companyLogo, 80),
            Text(
              company.companyName,
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              width: 280,
              height: 40,
              child: FlatButton(
                color: Theme.of(context).accentColor,
                onPressed: () {},
                child: Text(
                  'View Details And Invite',
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// List<Widget> _buildNewRelationsFromColleges(
//     BuildContext context, List<BuildNewRelationCollegeModel> allColleges) {
//   Size size = MediaQuery.of(context).size;
//   double screenwidth = size.width - SIDE_VIEW_WIDTH - 150;
//   List<Widget> allCollegesWidgets = new List<Widget>();
//   List<Widget> allCollegesInARow = new List<Widget>();

//   double oneCollegeWidth = 200;

//   for (int i = 0; i < allColleges.length;) {
//     for (var j = i; j < (screenwidth / oneCollegeWidth).toInt(); j++) {
//       if (j >= allColleges.length) break;
//       allCollegesInARow.add(_getCollegeItemWidget(context, allColleges[j]));
//     }
//     // Widget item2 = i + 1 < allColleges.length
//     //     ? getCollegeItemWidget(context, allColleges[i + 1])
//     //     : null;
//     Widget combined = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [...allCollegesInARow],
//     );
//     i += allCollegesInARow.length;
//     allCollegesWidgets.add(combined);
//   }
//   return allCollegesWidgets;
// }
