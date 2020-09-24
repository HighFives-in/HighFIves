import 'package:flutter/material.dart';

class HiringInfo extends StatelessWidget {
  final hiringInfo;
  final employerProfile;
  HiringInfo(this.hiringInfo, this.employerProfile);
  @override
  Widget build(BuildContext context) {
    return _buildHiringInfoDetails(context, hiringInfo, employerProfile);
  }

  _buildHiringInfoDetails(
      BuildContext context, final hiringInfo, final employerProfile) {
    final jobInfo = hiringInfo["jobInfo"];
    final eligibilityDetailsMap = Map<String, dynamic>.from(jobInfo);
    final eligibilityDetails = eligibilityDetailsMap["eligibility"];
    final eligibility = Map<String, dynamic>.from(eligibilityDetails);

    return Column(
      children: [
        Text(eligibility["combined"]),
      ],
    );
  }
}
