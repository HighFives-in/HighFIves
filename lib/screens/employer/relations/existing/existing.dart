import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/constants/const/tnpSideMenuItems.dart';
import 'package:highfives_ui/locator.dart';
import 'package:highfives_ui/models/employer/employerRelationModel.dart';
import 'package:highfives_ui/resources/relations/relations.dart';
import 'package:highfives_ui/screens/utils/loading.dart';
import 'package:highfives_ui/screens/utils/navigationService.dart';
import 'package:highfives_ui/utils/responsiveLayout.dart';
import 'package:highfives_ui/utils/toast.dart';

//TODO MANAGE NULL FOR EXAMPLE WHEN IMAGE WAS NULL NETWORK IMAGE THWORS AN ERROR
// TAKE CARE OF BIG TEXT

class EmployerExistingRelations extends StatelessWidget {
  static const existingRelationsRoute = 'existing';
  final _relationResouce = RelationResource();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Padding(
        padding: EdgeInsets.all(50),
        child: FutureBuilder(
            future: _relationResouce.getexistingRelations(EMPLOYER),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return ResponsiveLayout(
                  largeScreen: ListView(
                    children: [
                      _buildSearchAndFilters(context),
                      // _buildSortByDate(context),
                      ...largeChild(context, snapshot.data)
                    ],
                  ),
                  mediumScreen: ListView(
                    children: [
                      _buildSearchAndFilters(context),
                      ...smallChild(context, snapshot.data),
                    ],
                  ),
                  smallScreen: ListView(
                    children: [
                      _buildSearchAndFilters(context),
                      ...smallChild(context, snapshot.data),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                basicErrorFlutterToast();
                //TODO NOT FOUND OR SOMETHING ELSE
                return Container();
              } else {
                return Loading();
              }
            }),
      ),
    );
  }
}

// Widget _buildSortByDate(context) {
//   Size size = MediaQuery.of(context).size;
//   return Align(
//     alignment: Alignment.bottomRight,
//     child: Row(
//       children: [
//         Text('Sort By Date'),
//         SizedBox(width: 5),
//         Icon(Icons.sort),
//       ],
//     ),
//   );
// }

Widget _buildSearchAndFilters(context) {
  Size size = MediaQuery.of(context).size;
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border.all(color: Colors.grey),
        ),
        width: ResponsiveLayout.isSmallScreen(context)
            ? size.width
            : size.width * 0.3,
        height: 50,
        child: Stack(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Search By Name'),
            ),
            Positioned(
              right: 0,
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
            ),
          ],
        )),
  );
}

List<Widget> smallChild(BuildContext context, final allJobs) {
  List<Widget> allJobsWidgets = List<Widget>();
  if (allJobs == null || allJobs.length == 0) {
    final emptyJobText = Center(
      child: Text('No Relations Found :('),
    );
    allJobsWidgets.add(emptyJobText);
    return allJobsWidgets;
  }
  for (int i = 0; i < allJobs.length; i++) {
    final relationData = EmployerExisTingRelationModel.fromMap(allJobs[i]);
    final allRelationFromCompany = relationData.hiringInfo;

    final singleJob = Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Theme.of(context).primaryColor,
        child: ListTile(
          isThreeLine: true,
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                child: Image.network(
                  relationData.collegeLogo,
                  scale: 2,
                ),
              ),
              SizedBox(width: 10),
              Text(
                relationData.collegeName.toUpperCase(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              allRelationFromCompany["jobProfileName"].toUpperCase(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          onTap: () {
            locator<NavigationService>().navitgateTo('/' +
                EMPLOYER +
                '/' +
                COMMUNICATIONS +
                '/' +
                allRelationFromCompany["hiringId"].toString() +
                '_' +
                relationData.companyId.toString());
          },
          subtitle: Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Text(
                'Accepted ' + allRelationFromCompany["date"],
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          trailing: Text(
            'View Details',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
    allJobsWidgets.add(singleJob);
  }
  return allJobsWidgets;
}

List<Widget> largeChild(BuildContext context, final allJobs) {
  List<Widget> allJobsWidgets = List<Widget>();
  if (allJobs == null || allJobs.length == 0) {
    final emptyJobText = Center(
      child: Text('No Relations Found :('),
    );
    allJobsWidgets.add(emptyJobText);
    return allJobsWidgets;
  }
  for (int i = 0; i < allJobs.length; i++) {
    final relationData = EmployerExisTingRelationModel.fromMap(allJobs[i]);
    final allRelationFromCompany = relationData.hiringInfo;

    final singleJob = Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            //TODO DONT USE DIRECTLY
            locator<NavigationService>().navitgateTo('/' +
                EMPLOYER +
                '/' +
                COMMUNICATIONS +
                '/' +
                allRelationFromCompany["hiringId"].toString() +
                '_' +
                relationData.companyId.toString());
          },
          child: Container(
            height: 105,
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Image.network(
                          relationData.collegeLogo,
                          scale: 2,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(relationData.collegeName.toUpperCase(),
                          style: Theme.of(context).textTheme.headline4),
                    ],
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        allRelationFromCompany["jobProfileName"].toUpperCase(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Accepted ' + allRelationFromCompany["date"],
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        'View Details',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Theme.of(context).accentColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    allJobsWidgets.add(singleJob);
  }
  return allJobsWidgets;
}
