import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

basicErrorFlutterToast(String msg) {
  Fluttertoast.showToast(
    msg: msg != null ? msg : "SomeThing Went Wrong Please refresh page !",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.orange,
    webPosition: "center",
    textColor: Colors.white,
    webBgColor: "#fd9346",
    fontSize: 16.0,
  );
}
