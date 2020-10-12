import 'package:flutter/material.dart';
import 'package:highfives_ui/models/tnp/studentData.dart';
import 'package:highfives_ui/resources/relations/relations.dart';
import 'package:highfives_ui/screens/utils/loading.dart';
import 'package:highfives_ui/utils/toast.dart';

class AllStudentsForTnp extends StatelessWidget {
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

          return StudentViewWithFilters(allStudentsData);
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

class StudentViewWithFilters extends StatefulWidget {
  List<StudentDataForTnp> _allStudentsData;
  StudentViewWithFilters(this._allStudentsData);
  @override
  _StudentViewWithFilterState createState() => _StudentViewWithFilterState();
}

class _StudentViewWithFilterState extends State<StudentViewWithFilters> {
  Set _allBranchesSet = new Set();
  String _selectedBranch;
  int _placedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Students Tracking',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          _buildFilters(widget._allStudentsData),
          _buildStudentsView(widget._allStudentsData),
        ],
      ),
    );
  }

  Widget _buildFilters(List<StudentDataForTnp> allStudentsData) {
    allStudentsData.forEach((student) {
      this._allBranchesSet.add(student.branch.toString());
    });
    List<String> branches = new List<String>();
    branches.add('All');
    _allBranchesSet.forEach((element) => branches.add(element));

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Sort By', style: Theme.of(context).textTheme.headline4),
          SizedBox(width: 200),
          Row(
            children: [
              Radio(
                groupValue: _placedIndex,
                activeColor: Theme.of(context).dividerColor,
                value: 0,
                onChanged: (v) {
                  _placedIndex = v;
                  setState(() {});
                },
              ),
              Text('All', style: Theme.of(context).textTheme.headline6),
              Radio(
                groupValue: _placedIndex,
                activeColor: Theme.of(context).dividerColor,
                value: 1,
                onChanged: (v) {
                  _placedIndex = v;
                  setState(() {});
                },
              ),
              Text('Placed', style: Theme.of(context).textTheme.headline6),
              Radio(
                groupValue: _placedIndex,
                activeColor: Theme.of(context).dividerColor,
                value: 2,
                onChanged: (v) {
                  _placedIndex = v;
                  setState(() {});
                },
              ),
              Text('Unplaced', style: Theme.of(context).textTheme.headline6),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: DropdownButton(
                  hint: Text("Select Branch"),
                  value: _selectedBranch,
                  items: branches.map((branch) {
                    return new DropdownMenuItem<String>(
                      value: branch,
                      child: Text(branch),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    _selectedBranch = newValue;
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentsView(List<StudentDataForTnp> allStudentsData) {
    return Container(
      height: 1000,
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          ..._getAllStudentsView(allStudentsData),
        ],
      ),
    );
  }

  List<Widget> _getAllStudentsView(List<StudentDataForTnp> allStudentsData) {
    List<Widget> allStudentsView = List<Widget>();
    List<StudentDataForTnp> filteredStudents = List<StudentDataForTnp>();
    //Filter Branch Wise
    if (this._selectedBranch == null || this._selectedBranch == 'All') {
      filteredStudents = [...allStudentsData];
    } else {
      allStudentsData.forEach((studentData) {
        if (studentData.branch == this._selectedBranch) {
          filteredStudents.add(studentData);
        }
      });
    }

    //Filter Placed Unplaced
    if (this._placedIndex != 0) {
      bool placed = this._placedIndex == 1;
      filteredStudents = filteredStudents
          .where((student) => student.placedStatus == placed)
          .toList();
    }
    for (int i = 0; i < filteredStudents.length; i++) {
      StudentDataForTnp studentMap = filteredStudents[i];
      Widget view = Container(
        height: 80,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(studentMap.name),
                      Text(studentMap.email),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(studentMap.branch),
                    Text(studentMap.cgpa),
                  ],
                ),
                studentMap.placedStatus == true
                    ? Text(
                        'Placed',
                        style: TextStyle(color: Colors.green),
                      )
                    : Text(
                        'Unlaced',
                        style: TextStyle(color: Colors.red),
                      ),
              ],
            ),
          ),
        ),
      );
      allStudentsView.add(view);
    }
    return allStudentsView;
  }
}
