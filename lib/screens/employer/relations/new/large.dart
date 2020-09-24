import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:highfives_ui/constants/const/defaults.dart';
import 'package:highfives_ui/constants/const/size.dart';
import 'package:highfives_ui/constants/const/tnpSideMenuItems.dart';
import 'package:highfives_ui/locator.dart';
import 'package:highfives_ui/models/relations/allColleges.dart';
import 'package:highfives_ui/screens/utils/commons.dart';
import 'package:highfives_ui/screens/utils/loading.dart';

class LargeBuildNewRelation extends StatelessWidget {
  List<BuildNewRelationCollegeModel> _allColleges;
  LargeBuildNewRelation(this._allColleges);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: viewCollegesInGrid(context, _allColleges),
    );
  }

  viewCollegesInGrid(
      BuildContext context, List<BuildNewRelationCollegeModel> allColleges) {
    if (allColleges.length == 0)
      return Center(
        child: Text('No Colleges Found'),
      );
    return new StaggeredGridView.countBuilder(
      crossAxisCount: 8,
      itemCount: allColleges.length,
      itemBuilder: (BuildContext context, int index) =>
          _getCollegeItemWidget(context, allColleges[index]),
      staggeredTileBuilder: (int index) => new StaggeredTile.count(2, 2),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 10.0,
    );
  }
}

Widget _getCollegeItemWidget(
    BuildContext context, BuildNewRelationCollegeModel college) {
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
            CommonWidgetUtils.buildCircularImage(college.collegeLogo, 80),
            Text(
              college.collegeName,
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
