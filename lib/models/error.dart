class CUSTOM_ERROR {
  int status;
  String message;
  CUSTOM_ERROR(this.status, this.message);
  Map<String, dynamic> toMap() =>
      {"status": this.status, "message": this.message};
}
