class EmployerExisTingRelationModel {
  int companyId;
  String collegeLogo;
  String collegeName;
  Map<String, dynamic> hiringInfo;

  EmployerExisTingRelationModel({
    this.companyId,
    this.collegeLogo,
    this.collegeName,
    this.hiringInfo,
  });

  factory EmployerExisTingRelationModel.fromMap(Map<String, dynamic> relation) {
    return new EmployerExisTingRelationModel(
        companyId: relation["collegeId"],
        collegeLogo: relation["collegeLogo"],
        collegeName: relation["collegeName"],
        hiringInfo: relation["hiringInfo"]);
  }

  Map<String, dynamic> toMap() => {
        "companyId": this.companyId,
        "collegeLogo": this.collegeLogo,
        "collegeName": this.collegeName,
        "hiringInfo": this.hiringInfo
      };
}
