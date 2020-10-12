import 'package:flutter/material.dart';
import 'package:highfives_ui/models/relations/relation.dart';

class EmployerHiringInfo extends StatelessWidget {
  final _relationDetails;
  EmployerHiringInfo(this._relationDetails);
  @override
  Widget build(BuildContext context) {
    return _buildHiringInfoDetails(context, _relationDetails);
  }

  _buildHiringInfoDetails(BuildContext context, Relation _relationDetails) {
    final eligibilityDetails = _relationDetails.eligiblity;
    final tnpDetails = _relationDetails.assignedTnp;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.all(5),
            child: _buildTextAndIcon(context, 'Tnp Contact')),
        _buildTnpDetails(context, tnpDetails),
        Container(
            padding: EdgeInsets.all(5),
            child: _buildTextAndIcon(context, 'Eligibility')),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            eligibilityDetails,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Container(
            padding: EdgeInsets.all(5),
            child: _buildTextAndIcon(context, 'About College')),
        //TODO SEE IF WE WANT TO BUT THIS WILL BE IN PROFILE
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            eligibilityDetails,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    );
  }

  Widget _buildTnpDetails(BuildContext context, AssignedTnp assignedTnp) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                color: Theme.of(context).accentColor.withOpacity(0.05),
                padding: EdgeInsets.all(5),
                child: Text(
                  'Name: ',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(width: 10),
              Container(
                child: Text(
                  assignedTnp.tnpName,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                color: Theme.of(context).accentColor.withOpacity(0.05),
                padding: EdgeInsets.all(5),
                child: Text(
                  'Email: ',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(width: 10),
              Container(
                child: Text(
                  assignedTnp.email,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                color: Theme.of(context).accentColor.withOpacity(0.05),
                padding: EdgeInsets.all(5),
                child: Text(
                  'Contact: ',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(width: 10),
              Container(
                child: Text(
                  assignedTnp.phone,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextAndIcon(BuildContext context, String headline) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor.withOpacity(0.05),
      ),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.verified_user,
            size: 25,
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
}
