import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        child: FlareActor(
          "assets/images/loading.flr",
          animation: 'loading',
          alignment: Alignment.center,
          fit: BoxFit.contain,
          color: Colors.black,
        ),
      ),
    );
  }

  Future<dynamic> handleSubmit(BuildContext context, Future future) async {
    Dialogs.showLoadingDialog(context, _keyLoader); //invoking login

    try {
      var data = await future;
      Navigator.of(_keyLoader.currentContext, rootNavigator: true)
          .pop(); //close the dialoge
      return data;
    } catch (e) {
      return null;
    }
  }

//is needed if above function throws an error
  popDialogFromNavigation() {
    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
  }
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Loading(),
                    )
                  ]));
        });
  }
}
