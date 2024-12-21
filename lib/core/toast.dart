import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast extends StatefulWidget {
  const ShowToast({super.key, required this.msg});
  final String msg;
  static FToast fToast = FToast();
  @override

  State<ShowToast> createState() => _ShowToastState();
}

class _ShowToastState extends State<ShowToast> {
 

  @override
  void initState() {
    super.initState();

    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
   ShowToast. fToast.init(context);
  }

   showToast(String msg) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check),
          const SizedBox(
            width: 12.0,
          ),
          Text(msg),
        ],
      ),
    );

    ShowToast.fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );

    // Custom Toast Position
    ShowToast.fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            top: 16.0,
            left: 16.0,
            child: child,
          );
        });
   // return toast;
  }

  @override
  Widget build(BuildContext context) {
    return showToast(widget.msg);
  }
}
