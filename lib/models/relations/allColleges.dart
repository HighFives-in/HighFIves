import 'dart:convert';

class BuildNewRelationAllCollegesModel {
  List<BuildNewRelationCollegeModel> allColleges;
  BuildNewRelationAllCollegesModel(this.allColleges);
}

class BuildNewRelationCollegeModel {
  final int collegeId;
  final String collegeName;
  final String collegeLogo;
  final String status;
  final String date;
  BuildNewRelationCollegeModel({
    this.collegeId,
    this.collegeName,
    this.collegeLogo,
    this.status,
    this.date,
  });

  BuildNewRelationCollegeModel copyWith({
    int collegeId,
    String collegeName,
    String collegeLogo,
    String status,
    String date,
  }) {
    return BuildNewRelationCollegeModel(
      collegeId: collegeId ?? this.collegeId,
      collegeName: collegeName ?? this.collegeName,
      collegeLogo: collegeLogo ?? this.collegeLogo,
      status: status ?? this.status,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'collegeId': collegeId,
      'collegeName': collegeName,
      'collegeLogo': collegeLogo,
      'status': status,
      'date': date,
    };
  }

  factory BuildNewRelationCollegeModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return BuildNewRelationCollegeModel(
      collegeId: map['collegeId']?.toInt(),
      collegeName: map['collegeName'] != null ? map['collegeName'] : "",
      collegeLogo: map['collegeLogo'],
      status: map['status'] != null ? map['status'] : 'New',
      date: map['date'] != null ? map['date'] : "",
    );
  }

  String toJson() => json.encode(toMap());

  factory BuildNewRelationCollegeModel.fromJson(String source) =>
      BuildNewRelationCollegeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BuildNewRelationCollegeModel(collegeId: $collegeId, collegeName: $collegeName, collegeLogo: $collegeLogo, status: $status, date: $date)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is BuildNewRelationCollegeModel &&
        o.collegeId == collegeId &&
        o.collegeName == collegeName &&
        o.collegeLogo == collegeLogo &&
        o.status == status &&
        o.date == date;
  }

  @override
  int get hashCode {
    return collegeId.hashCode ^
        collegeName.hashCode ^
        collegeLogo.hashCode ^
        status.hashCode ^
        date.hashCode;
  }
}
