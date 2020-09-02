import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/business.dart';
import 'package:highfives_ui/constants/const/defaults.dart';
import 'package:highfives_ui/constants/const/employerSideMenuItems.dart';
import 'package:highfives_ui/models/employer/employerProfileModel.dart';
import 'package:highfives_ui/resources/profile/profile.dart';
import 'package:highfives_ui/screens/employer/jobDescription/jd.dart';
import 'package:highfives_ui/screens/utils/loading.dart';
import 'package:highfives_ui/utils/responsiveLayout.dart';

//Its a Scrollable View with many sections like basic profile
// About Company Description and Job Description

class EmployerProfile extends StatelessWidget {
  Profile _profile;

  get profile {
    if (this._profile == null) return new Profile();
    return _profile;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getEmployerProfile(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return BuildEmployerProfile(snapshot.data);
        } else if (snapshot.hasError) {
          //TODO : SHOW ALERT AND ERROR
          return Container(
            //TODO
            width: 100,
            height: 100,
            color: Colors.red,
          );
        } else {
          //TODO LOADING
          return Loading();
        }
      },
    );
  }

  Future<dynamic> getEmployerProfile() {
    return profile.getProfile(EMPLOYER);
  }
}

class BuildEmployerProfile extends StatelessWidget {
  final _profileData;
  BuildEmployerProfile(this._profileData);
  EmployerProfileModel _employerProfileModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _employerProfileModel = EmployerProfileModel.fromMap(this._profileData);
    var profileMap = _employerProfileModel.toMap();
    var personalInfo = profileMap["personal"];
    var jobDescriptions = profileMap["jobDescriptions"];

    return Container(
      width: size.width,
      height: size.height,
      color: Theme.of(context).primaryColor,
      child: ListView(
        children: [
          _buildProfileTextAndIcon(context, EMPLOYER_PROFILE),
          _buildBasicProfileSection(context, personalInfo),
          _buildProfileTextAndIcon(context, 'About Company'),
          _buildAboutCompnay(context),
          _buildProfileTextAndIcon(context, 'Job Descriptions'),
          SizedBox(height: 40),
          EmployerJobDescriptions(jobDescriptions),
        ],
      ),
    );
  }
}

Widget _buildProfileTextAndIcon(BuildContext context, String headline) {
  Size size = MediaQuery.of(context).size;

  return Container(
    width: size.width,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Theme.of(context).accentColor.withOpacity(0.05),
    ),
    height: 100,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.verified_user,
          size: 30,
          color: Theme.of(context).dividerColor,
        ),
        SizedBox(
          width: 40,
        ),
        Text(
          headline,
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    ),
  );
}

Widget _buildBasicProfileSection(BuildContext context, dynamic personalInfo) {
  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
    padding: EdgeInsets.all(50),
    child: Row(
      mainAxisAlignment: ResponsiveLayout.isSmallScreen(context)
          ? MainAxisAlignment.spaceAround
          : MainAxisAlignment.start,
      children: [
        Container(
          width: size.width * 0.3,
          child: Column(
            children: [
              _displayProfilePicture(personalInfo["profilePicture"], context),
              SizedBox(
                height: 10,
              ),
              _editProfilePicture(context),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          alignment: Alignment.center,
          width: size.width * 0.3,
          child: _displayProfileData(context, personalInfo),
        ),
      ],
    ),
  );
}

Widget _displayProfilePicture(String profileImage, BuildContext context) {
  if (profileImage == null) profileImage = DEFAULT_PROFILE_IMAGE;
  return Center(
    child: Container(
      width: ResponsiveLayout.isSmallScreen(context) ? 200 : 300,
      height: 300,
      child: Image(
        image: NetworkImage(profileImage),
      ),
    ),
  );
}

Widget _editProfilePicture(BuildContext context) {
  return Container(
    width: ResponsiveLayout.isSmallScreen(context) ? 100 : 200,
    height: 40,
    decoration: BoxDecoration(
      color: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(8.3),
    ),
    child: InkWell(
      child: Center(
        child: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    ),
  );
}

Widget _displayProfileData(BuildContext context, dynamic personalInfo) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(7),
          color: Theme.of(context).accentColor.withOpacity(0.2),
          child: Text(
            'Name :',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Container(
          padding: EdgeInsets.all(3),
          child: Text(
            personalInfo["firstName"] + " " + personalInfo["lastName"],
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(7),
          color: Theme.of(context).accentColor.withOpacity(0.2),
          child: Text(
            'Email :',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Container(
          padding: EdgeInsets.all(3),
          child: Text(
            personalInfo["email"],
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(7),
          color: Theme.of(context).accentColor.withOpacity(0.2),
          child: Text(
            'Contact Number:',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Container(
          padding: EdgeInsets.all(3),
          child: Text(
            personalInfo["phone"],
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        // Text(''),
        // Text(personalInfo["phone"]),
      ],
    ),
  );
}

Widget _buildAboutCompnay(BuildContext context) {
  return FractionallySizedBox(
    widthFactor: 0.8,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            //TODO THIS NEEDS TO COME FROM API CHANGE LATER
            ABOUT_COLLEGE_TEXT,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    ),
  );
}
