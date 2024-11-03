import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
 static showToastM() {
    return Fluttertoast.showToast(
      
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColor.whiteColor,
        textColor: AppColor.primaryColor,
        fontSize: 16.0);
  }
}
