import 'dart:convert';
import 'package:collection/collection.dart';

class Relation {
  final int hiringId;
  final College college;
  final Employer employer;
  final Dates dates;
  final AssignedTnp assignedTnp;
  final JobInfo jobInfo;
  final String sentBy;
  final String eligiblity;
  final String status;
  final String isPublished;
  final List<Result> results;
  Relation({
    this.hiringId,
    this.college,
    this.employer,
    this.dates,
    this.assignedTnp,
    this.jobInfo,
    this.sentBy,
    this.eligiblity,
    this.status,
    this.isPublished,
    this.results,
  });

  Relation copyWith({
    int hiringId,
    College college,
    Employer employer,
    Dates dates,
    AssignedTnp assignedTnp,
    JobInfo jobInfo,
    String sentBy,
    String eligiblity,
    String status,
    String isPublished,
    List<Result> results,
  }) {
    return Relation(
      hiringId: hiringId ?? this.hiringId,
      college: college ?? this.college,
      employer: employer ?? this.employer,
      dates: dates ?? this.dates,
      assignedTnp: assignedTnp ?? this.assignedTnp,
      jobInfo: jobInfo ?? this.jobInfo,
      sentBy: sentBy ?? this.sentBy,
      eligiblity: eligiblity ?? this.eligiblity,
      status: status ?? this.status,
      isPublished: isPublished ?? this.isPublished,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hiringId': hiringId,
      'college': college?.toMap(),
      'employer': employer?.toMap(),
      'dates': dates?.toMap(),
      'assignedTnp': assignedTnp?.toMap(),
      'jobInfo': jobInfo?.toMap(),
      'sentBy': sentBy,
      'eligiblity': eligiblity,
      'status': status,
      'isPublished': isPublished,
      'results': results?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Relation.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Relation(
      hiringId: map['hiringId']?.toInt(),
      college: College.fromMap(map['college']),
      employer: Employer.fromMap(map['employer']),
      dates: Dates.fromMap(map['dates']),
      assignedTnp: AssignedTnp.fromMap(map['assignedTnp']),
      jobInfo: JobInfo.fromMap(map['jobInfo']),
      sentBy: map['sentBy'],
      eligiblity: map['eligiblity'],
      status: map['status'],
      isPublished: map['isPublished'],
      results: List<Result>.from(map['results']?.map((x) => Result.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Relation.fromJson(String source) =>
      Relation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Relation(hiringId: $hiringId, college: $college, employer: $employer, dates: $dates, assignedTnp: $assignedTnp, jobInfo: $jobInfo, sentBy: $sentBy, eligiblity: $eligiblity, status: $status, isPublished: $isPublished, results: $results)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Relation &&
        o.hiringId == hiringId &&
        o.college == college &&
        o.employer == employer &&
        o.dates == dates &&
        o.assignedTnp == assignedTnp &&
        o.jobInfo == jobInfo &&
        o.sentBy == sentBy &&
        o.eligiblity == eligiblity &&
        o.status == status &&
        o.isPublished == isPublished &&
        listEquals(o.results, results);
  }

  @override
  int get hashCode {
    return hiringId.hashCode ^
        college.hashCode ^
        employer.hashCode ^
        dates.hashCode ^
        assignedTnp.hashCode ^
        jobInfo.hashCode ^
        sentBy.hashCode ^
        eligiblity.hashCode ^
        status.hashCode ^
        isPublished.hashCode ^
        results.hashCode;
  }
}

class College {
  final int collegeId;
  final String collegeName;
  final String collegeLogo;
  College({
    this.collegeId,
    this.collegeName,
    this.collegeLogo,
  });

  College copyWith({
    int collegeId,
    String collegeName,
    String collegeLogo,
  }) {
    return College(
      collegeId: collegeId ?? this.collegeId,
      collegeName: collegeName ?? this.collegeName,
      collegeLogo: collegeLogo ?? this.collegeLogo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'collegeId': collegeId,
      'collegeName': collegeName,
      'collegeLogo': collegeLogo,
    };
  }

  factory College.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return College(
      collegeId: map['collegeId']?.toInt(),
      collegeName: map['collegeName'],
      collegeLogo: map['collegeLogo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory College.fromJson(String source) =>
      College.fromMap(json.decode(source));

  @override
  String toString() =>
      'College(collegeId: $collegeId, collegeName: $collegeName, collegeLogo: $collegeLogo)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is College &&
        o.collegeId == collegeId &&
        o.collegeName == collegeName &&
        o.collegeLogo == collegeLogo;
  }

  @override
  int get hashCode =>
      collegeId.hashCode ^ collegeName.hashCode ^ collegeLogo.hashCode;
}

class Employer {
  final int employerId;
  final String companyName;
  final String companyLogo;
  final String employerName;
  Employer({
    this.employerId,
    this.companyName,
    this.companyLogo,
    this.employerName,
  });

  Employer copyWith({
    int employerId,
    String companyName,
    String companyLogo,
    String employerName,
  }) {
    return Employer(
      employerId: employerId ?? this.employerId,
      companyName: companyName ?? this.companyName,
      companyLogo: companyLogo ?? this.companyLogo,
      employerName: employerName ?? this.employerName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'employerId': employerId,
      'companyName': companyName,
      'companyLogo': companyLogo,
      'employerName': employerName,
    };
  }

  factory Employer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Employer(
      employerId: map['employerId']?.toInt(),
      companyName: map['companyName'],
      companyLogo: map['companyLogo'],
      employerName: map['employerName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Employer.fromJson(String source) =>
      Employer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Employer(employerId: $employerId, companyName: $companyName, companyLogo: $companyLogo, employerName: $employerName)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Employer &&
        o.employerId == employerId &&
        o.companyName == companyName &&
        o.companyLogo == companyLogo &&
        o.employerName == employerName;
  }

  @override
  int get hashCode {
    return employerId.hashCode ^
        companyName.hashCode ^
        companyLogo.hashCode ^
        employerName.hashCode;
  }
}

class Dates {
  final String arrivalDate;
  final String createdDate;
  final String acceptedDate;
  Dates({
    this.arrivalDate,
    this.createdDate,
    this.acceptedDate,
  });

  Dates copyWith({
    String arrivalDate,
    String createdDate,
    String acceptedDate,
  }) {
    return Dates(
      arrivalDate: arrivalDate ?? this.arrivalDate,
      createdDate: createdDate ?? this.createdDate,
      acceptedDate: acceptedDate ?? this.acceptedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'arrivalDate': arrivalDate,
      'createdDate': createdDate,
      'acceptedDate': acceptedDate,
    };
  }

  factory Dates.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Dates(
      arrivalDate: map['arrivalDate'],
      createdDate: map['createdDate'],
      acceptedDate: map['acceptedDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Dates.fromJson(String source) => Dates.fromMap(json.decode(source));

  @override
  String toString() =>
      'Dates(arrivalDate: $arrivalDate, createdDate: $createdDate, acceptedDate: $acceptedDate)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Dates &&
        o.arrivalDate == arrivalDate &&
        o.createdDate == createdDate &&
        o.acceptedDate == acceptedDate;
  }

  @override
  int get hashCode =>
      arrivalDate.hashCode ^ createdDate.hashCode ^ acceptedDate.hashCode;
}

class AssignedTnp {
  final int tnpId;
  final String tnpName;
  final String email;
  final String phone;
  AssignedTnp({
    this.tnpId,
    this.tnpName,
    this.email,
    this.phone,
  });

  AssignedTnp copyWith({
    int tnpId,
    String tnpName,
    String email,
    String phone,
  }) {
    return AssignedTnp(
      tnpId: tnpId ?? this.tnpId,
      tnpName: tnpName ?? this.tnpName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tnpId': tnpId,
      'tnpName': tnpName,
      'email': email,
      'phone': phone,
    };
  }

  factory AssignedTnp.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AssignedTnp(
      tnpId: map['tnpId']?.toInt(),
      tnpName: map['tnpName'],
      email: map['email'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AssignedTnp.fromJson(String source) =>
      AssignedTnp.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AssignedTnp(tnpId: $tnpId, tnpName: $tnpName, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AssignedTnp &&
        o.tnpId == tnpId &&
        o.tnpName == tnpName &&
        o.email == email &&
        o.phone == phone;
  }

  @override
  int get hashCode {
    return tnpId.hashCode ^ tnpName.hashCode ^ email.hashCode ^ phone.hashCode;
  }
}

class JobInfo {
  final String jobId;
  final String jobProfile;
  final String pdfUrl;
  JobInfo({
    this.jobId,
    this.jobProfile,
    this.pdfUrl,
  });

  JobInfo copyWith({
    String jobId,
    String jobProfile,
    String pdfUrl,
  }) {
    return JobInfo(
      jobId: jobId ?? this.jobId,
      jobProfile: jobProfile ?? this.jobProfile,
      pdfUrl: pdfUrl ?? this.pdfUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'jobId': jobId,
      'jobProfile': jobProfile,
      'pdfUrl': pdfUrl,
    };
  }

  factory JobInfo.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return JobInfo(
      jobId: map['jobId'],
      jobProfile: map['jobProfile'],
      pdfUrl: map['pdfUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory JobInfo.fromJson(String source) =>
      JobInfo.fromMap(json.decode(source));

  @override
  String toString() =>
      'JobInfo(jobId: $jobId, jobProfile: $jobProfile, pdfUrl: $pdfUrl)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is JobInfo &&
        o.jobId == jobId &&
        o.jobProfile == jobProfile &&
        o.pdfUrl == pdfUrl;
  }

  @override
  int get hashCode => jobId.hashCode ^ jobProfile.hashCode ^ pdfUrl.hashCode;
}

class Result {
  final String studentId;
  final String studentName;
  final String profilePic;
  Result({
    this.studentId,
    this.studentName,
    this.profilePic,
  });

  Result copyWith({
    String studentId,
    String studentName,
    String profilePic,
  }) {
    return Result(
      studentId: studentId ?? this.studentId,
      studentName: studentName ?? this.studentName,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'studentName': studentName,
      'profilePic': profilePic,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Result(
      studentId: map['studentId'],
      studentName: map['studentName'],
      profilePic: map['profilePic'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) => Result.fromMap(json.decode(source));

  @override
  String toString() =>
      'Result(studentId: $studentId, studentName: $studentName, profilePic: $profilePic)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Result &&
        o.studentId == studentId &&
        o.studentName == studentName &&
        o.profilePic == profilePic;
  }

  @override
  int get hashCode =>
      studentId.hashCode ^ studentName.hashCode ^ profilePic.hashCode;
}
