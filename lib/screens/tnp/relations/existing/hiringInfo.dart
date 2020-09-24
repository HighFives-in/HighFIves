import 'package:flutter/material.dart';
import 'package:highfives_ui/models/employer/employerRelationModel.dart';

class TnpHiringInfo extends StatelessWidget {
  final _relationDetails;
  TnpHiringInfo(this._relationDetails);
  @override
  Widget build(BuildContext context) {
    return _buildHiringInfoDetails(context, _relationDetails);
  }

  _buildHiringInfoDetails(BuildContext context, Relation _relationDetails) {
    final eligibilityDetails = _relationDetails.eligiblity;

    return Column(
      children: [
        Text(eligibilityDetails),
      ],
    );
  }
}
