import 'dart:convert';

class BuildNewRelationEmployerModel {
  final int employerId;
  final String companyName;
  final String companyLogo;
  final String employerName;
  final String status;
  final String date;
  BuildNewRelationEmployerModel({
    this.employerId,
    this.companyName,
    this.companyLogo,
    this.employerName,
    this.status,
    this.date,
  });

  BuildNewRelationEmployerModel copyWith({
    int employerId,
    String companyName,
    String companyLogo,
    String employerName,
    String status,
    String date,
  }) {
    return BuildNewRelationEmployerModel(
      employerId: employerId ?? this.employerId,
      companyName: companyName ?? this.companyName,
      companyLogo: companyLogo ?? this.companyLogo,
      employerName: employerName ?? this.employerName,
      status: status ?? this.status,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'employerId': employerId,
      'companyName': companyName,
      'companyLogo': companyLogo,
      'employerName': employerName,
      'status': status,
      'date': date,
    };
  }

  factory BuildNewRelationEmployerModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return BuildNewRelationEmployerModel(
      employerId: map['employerId']?.toInt(),
      companyName: map['companyName'],
      companyLogo: map['companyLogo'],
      employerName: map['employerName'],
      status: map['status'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BuildNewRelationEmployerModel.fromJson(String source) =>
      BuildNewRelationEmployerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BuildNewRelationEmployerModel(employerId: $employerId, companyName: $companyName, companyLogo: $companyLogo, employerName: $employerName, status: $status, date: $date)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is BuildNewRelationEmployerModel &&
        o.employerId == employerId &&
        o.companyName == companyName &&
        o.companyLogo == companyLogo &&
        o.employerName == employerName &&
        o.status == status &&
        o.date == date;
  }

  @override
  int get hashCode {
    return employerId.hashCode ^
        companyName.hashCode ^
        companyLogo.hashCode ^
        employerName.hashCode ^
        status.hashCode ^
        date.hashCode;
  }
}
