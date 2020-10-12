import 'package:flutter/material.dart';
import 'package:highfives_ui/models/tnp/studentData.dart';
import 'package:highfives_ui/resources/relations/relations.dart';
import 'package:highfives_ui/screens/tnp/analytics/barChart.dart';
import 'package:highfives_ui/screens/tnp/analytics/pieChart.dart';
import 'package:highfives_ui/screens/utils/loading.dart';
import 'package:highfives_ui/utils/toast.dart';

class TnpAnalytics extends StatelessWidget {
  RelationResource _relationResource = RelationResource();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getAllStudents(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Map<String, dynamic>> allData =
              List<Map<String, dynamic>>.from(snapshot.data);
          List<StudentDataForTnp> allStudentsData;
          allStudentsData = allData.map((studentData) {
            return StudentDataForTnp.fromMap(studentData);
          }).toList();
          allData.clear();
          allStudentsData.sort((a, b) {
            var r = a.branch.compareTo(b.branch);
            if (r != 0) return r;
            return a.branch.compareTo(b.branch);
          });

          return BuildAllAnalytics(allStudentsData);
        } else if (snapshot.hasError) {
          basicErrorFlutterToast(null);
          //TODO NOT FOUND OR SOMETHING ELSE
        } else {
          return Loading();
        }
      },
    );
  }

  _getAllStudents() {
    return _relationResource.getAllStudents();
  }
}

class BuildAllAnalytics extends StatefulWidget {
  List<StudentDataForTnp> _allStudentsData;
  BuildAllAnalytics(this._allStudentsData);
  @override
  _BuildAllAnalyticsState createState() => _BuildAllAnalyticsState();
}

class _BuildAllAnalyticsState extends State<BuildAllAnalytics> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Text('OverView of all Students :'.toUpperCase(),
              style: Theme.of(context).textTheme.headline3),
          SizedBox(height: 50),
          _buildOverViewAnalytics(widget._allStudentsData),
          SizedBox(height: 50),
          Text('BranchWise Statistics :'.toUpperCase(),
              style: Theme.of(context).textTheme.headline3),
          SizedBox(
            height: 400,
            child: Row(
              children: [
                ..._buildPieChartForAllBranches(widget._allStudentsData),
              ],
            ),
          ),
          // _buildBranchWiseAnalytics(),
        ],
      ),
    );
  }

  _buildOverViewAnalytics(List<StudentDataForTnp> allStudentsData) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: Stack(
            fit: StackFit.expand,
            children: [
              FractionallySizedBox(
                widthFactor: 0.5,
                alignment: Alignment.centerLeft,
                child: _buildOverviewBarChart(allStudentsData),
              ),
              FractionallySizedBox(
                widthFactor: 0.5,
                alignment: Alignment.centerRight,
                child: _buildOverviewPieChart(allStudentsData),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //placed vs not placed pie chart
  List<Widget> _buildPieChartForAllBranches(
      List<StudentDataForTnp> allStudentsData) {
    Set allBranchesSet = new Set();

    //FIND DIFFERENT BRANCHES
    allStudentsData.forEach((element) {
      allBranchesSet.add(element.branch);
    });

    List<Widget> listOfPieChartsForAllBranches = List<Widget>();
    List<StudentDataForTnp> branchWiseStudents = List<StudentDataForTnp>();
    //ALL Students data is sorted
    int i = 0, j = 1;
    while (i < allBranchesSet.length && j < allStudentsData.length - 1) {
      if (allStudentsData[j].branch == allStudentsData[j - 1].branch &&
          j != allStudentsData.length - 2) {
        branchWiseStudents.add(allStudentsData[j]);
      } else {
        i++;

        Widget pieChart = Expanded(
          child: _buildBranchWisePieChart(
              allStudentsData[j - 1].branch, branchWiseStudents),
        );

        listOfPieChartsForAllBranches.add(pieChart);
        branchWiseStudents.clear();
      }
      j++;
    }
    return listOfPieChartsForAllBranches;
  }

  //branch wise placed vs not placed pie chart
  Widget _buildBranchWisePieChart(String title, List<StudentDataForTnp> data) {
    int totalPlaced = 0;
    int totalUnplaced = 0;
    data.forEach((element) {
      if (element.placedStatus == true) {
        totalPlaced++;
      }
    });
    totalUnplaced = data.length - totalPlaced;
    List<PieData> placedDataList = [
      PieData('Placed', totalPlaced, Colors.green),
      PieData('Not Placed', totalUnplaced, Colors.red)
    ];

    return BuildPieChart('$title Branch Placed vs Not Placed', placedDataList);
  }

  //placed vs not placed pie chart
  Widget _buildOverviewPieChart(List<StudentDataForTnp> allStudentsData) {
    int totalPlaced = 0;
    int totalUnplaced = 0;
    allStudentsData.forEach((element) {
      if (element.placedStatus == true) {
        totalPlaced++;
      }
    });
    totalUnplaced = allStudentsData.length - totalPlaced;
    List<PieData> placedDataList = [
      PieData('Placed', totalPlaced, Colors.green),
      PieData('Not Placed', totalUnplaced, Colors.red)
    ];

    return BuildPieChart('Students Placed vs Not Placed', placedDataList);
  }

  //Bar Chart of Students Branch Wise
  Widget _buildOverviewBarChart(List<StudentDataForTnp> allStudentsData) {
    Set allBranchesSet = new Set();
    Map<String, int> branchVsTotalStudents = Map<String, int>();

    //FIND DIFFERENT BRANCHES
    allStudentsData.forEach((element) {
      allBranchesSet.add(element.branch);
    });

    //Setting each branch student to 0 initially
    var brachList = allBranchesSet.toList();
    for (int i = 0; i < allBranchesSet.length; i++) {
      branchVsTotalStudents[brachList[i]] = 0;
    }

    //iterate and count
    allStudentsData.forEach((element) {
      branchVsTotalStudents[element.branch]++;
    });

    List<BarChartDataModel> listOfData = List<BarChartDataModel>();
    branchVsTotalStudents.forEach((key, value) {
      listOfData.add(BarChartDataModel(key, value, null));
    });

    allBranchesSet.clear();
    brachList.clear();
    branchVsTotalStudents.clear();

    return BuildBarChart('BranchWise Registered Students', listOfData);
  }
}
