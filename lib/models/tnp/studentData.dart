import 'dart:convert';

class StudentDataForTnp {
  final String name;
  final String branch;
  final String id;
  final bool placedStatus;
  final String cgpa;
  final String company;
  final String email;
  StudentDataForTnp({
    this.name,
    this.branch,
    this.id,
    this.placedStatus,
    this.cgpa,
    this.company,
    this.email,
  });

  StudentDataForTnp copyWith({
    String name,
    String branch,
    String id,
    bool placedStatus,
    String cgpa,
    String company,
    String email,
  }) {
    return StudentDataForTnp(
      name: name ?? this.name,
      branch: branch ?? this.branch,
      id: id ?? this.id,
      placedStatus: placedStatus ?? this.placedStatus,
      cgpa: cgpa ?? this.cgpa,
      company: company ?? this.company,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'branch': branch,
      'id': id,
      'placedStatus': placedStatus,
      'cgpa': cgpa,
      'company': company,
      'email': email,
    };
  }

  factory StudentDataForTnp.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return StudentDataForTnp(
      name: map['name'],
      branch: map['branch'],
      id: map['id'],
      placedStatus: map['placedStatus'],
      cgpa: map['cgpa'],
      company: map['company'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentDataForTnp.fromJson(String source) =>
      StudentDataForTnp.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentDataForTnp(name: $name, branch: $branch, id: $id, placedStatus: $placedStatus, cgpa: $cgpa, company: $company, email: $email)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is StudentDataForTnp &&
        o.name == name &&
        o.branch == branch &&
        o.id == id &&
        o.placedStatus == placedStatus &&
        o.cgpa == cgpa &&
        o.company == company &&
        o.email == email;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        branch.hashCode ^
        id.hashCode ^
        placedStatus.hashCode ^
        cgpa.hashCode ^
        company.hashCode ^
        email.hashCode;
  }
}
