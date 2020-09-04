class ExisTingRelationModel {
  int companyId;
  String companyLogo;
  String companyName;
  Map<String, dynamic> hiringInfo;

  ExisTingRelationModel({
    this.companyId,
    this.companyLogo,
    this.companyName,
    this.hiringInfo,
  });

  factory ExisTingRelationModel.fromMap(Map<String, dynamic> relation) {
    return new ExisTingRelationModel(
        companyId: relation["companyId"],
        companyLogo: relation["companyLogo"],
        companyName: relation["companyName"],
        hiringInfo: relation["hiringInfo"]);
  }

  Map<String, dynamic> toMap() => {
        "companyId": this.companyId,
        "companyLogo": this.companyLogo,
        "companyName": this.companyName,
        "hiringInfo": this.hiringInfo
      };
}
