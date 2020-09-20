import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/tnp-relations-tabs.dart';
import 'package:highfives_ui/screens/employer/relations/existing/hiringInfo.dart';
import 'package:highfives_ui/utils/toast.dart';
import 'package:highfives_ui/screens/utils/loading.dart';
import 'package:highfives_ui/screens/tnp/relations/existing/tabChoices.dart';
import 'package:highfives_ui/utils/responsiveLayout.dart';
import 'package:highfives_ui/resources/relations/relations.dart';
import 'package:highfives_ui/resources/profile/profile.dart';
import 'package:highfives_ui/models/relations/relation.dart';

class ViewEmployerRelationDetails extends StatelessWidget {
  RelationResource _relationResource = RelationResource();
  Profile _profile = Profile();

  int _hiringId;
  dynamic _relationDetails;

  ViewEmployerRelationDetails(this._hiringId);
  @override
  Widget build(BuildContext context) {
    _relationDetails = ModalRoute.of(context).settings.arguments;
    return FutureBuilder(
      future: getHiringAndProfileInfo(_hiringId),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          _relationDetails = snapshot.data;
          return buildResponsiveRelationDetailsView(context, _relationDetails);
        } else if (snapshot.hasError) {
          basicErrorFlutterToast(null);
          //TODO
          return Container(
            color: Colors.black38,
            height: 100,
            width: 100,
          );
        } else {
          return Center(child: Loading());
        }
      },
    );
  }

  Future<dynamic> getHiringAndProfileInfo(int hiringId) async {
    if (_relationDetails != null && _relationDetails is Relation) {
      return _relationDetails;
    }
    return _relationResource.getRelationDetails(hiringId);
  }
}

Widget buildResponsiveRelationDetailsView(
    BuildContext context, Relation relationDetails) {
  return ResponsiveLayout(
    largeScreen: RelationDetailsLargeView(relationDetails),
    // smallScreen: //TODO SMALL SCREEN,
  );
}

// class relationDetailsLargeViewWithTabs extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Container(
//         padding: EdgeInsets.all(100),
//         color: Colors.green,
//         child: Scaffold(
//           appBar: TabBar(
//             isScrollable: true,
//             tabs: getAllTabs(context),
//           ),
//           body: TabBarView(
//             children: [
//               Container(
//                 color: Colors.red,
//               ),
//               Container(
//                 color: Colors.teal,
//               ),
//               Container(
//                 color: Colors.yellow,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   List<Widget> getAllTabs(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return tabsChoiceList.map((Choice choice) {
//       return Container(
//         width: size.width * 0.3 - 10,
//         color: Colors.amber,
//         child: Tab(
//           text: choice.title,
//           // icon: Icon(choice.icon),
//         ),
//       );
//     }).toList();
//   }
// }

// relationDetailsLargeView(BuildContext context) {
//   return
// }
class RelationDetailsLargeView extends StatefulWidget {
  final _relationDetails;
  @override
  RelationDetailsLargeView(this._relationDetails);
  _RelationDetailsLargeViewState createState() =>
      _RelationDetailsLargeViewState();
}

class _RelationDetailsLargeViewState extends State<RelationDetailsLargeView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBasicCollegeDetails(widget._relationDetails, context),
          Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: tabsChoiceList
                .asMap()
                .map((int index, Choice choice) {
                  return MapEntry(
                    index,
                    InkWell(
                      onTap: () {
                        _selectedIndex = index;
                        setState(() {});
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: index == _selectedIndex
                                  ? Radius.circular(10.0)
                                  : Radius.zero,
                              topRight: index == _selectedIndex
                                  ? Radius.circular(10.0)
                                  : Radius.zero,
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.zero,
                            ),
                            color: index == _selectedIndex
                                ? Theme.of(context).primaryColor
                                : Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.05),
                          ),
                          width: MediaQuery.of(context).size.width * 0.7 * 0.3,
                          child: Center(
                            child: Text(
                              choice.title,
                              style: index == _selectedIndex
                                  ? Theme.of(context).textTheme.headline3
                                  : Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })
                .values
                .toList(),
          ),
          _buildSelectedTabChoiceView(context, _selectedIndex),
        ],
      ),
    );
  }

  Widget _buildSelectedTabChoiceView(BuildContext context, int index) {
    //THIS 200 is subtracted for 2 * padding(40) + tab height (90)
    String tabSelected = tabsChoiceList[index].title;
    Widget selectedTabView;
    switch (tabSelected) {
      case JOB_DETAILS_TAB:
        selectedTabView = EmployerHiringInfo(widget._relationDetails);
        break;
      case COMMUNICATION_TAB:
        selectedTabView = EmployerHiringInfo(widget._relationDetails);
        break;
      case VOLUNTEER_TAB:
        selectedTabView = EmployerHiringInfo(widget._relationDetails);
        break;
      default:
        selectedTabView = EmployerHiringInfo(widget._relationDetails);
        break;
    }
    return Container(
      padding: EdgeInsets.all(20),
      color: Theme.of(context).primaryColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 200,
      child: ListView(
        children: [selectedTabView],
      ),
    );
  }
}

Widget _buildBasicCollegeDetails(
    Relation _relationDetails, BuildContext context) {
  // final company = empProfile.company;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        _relationDetails.college.collegeName.toUpperCase() +
            " - " +
            _relationDetails.jobInfo.jobProfile.toUpperCase(),
        style: Theme.of(context).textTheme.headline3,
      ),
      SizedBox(height: 10),
      Text(
        'Accepted on ' + _relationDetails.dates.acceptedDate,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      SizedBox(height: 10),
    ],
  );
}
