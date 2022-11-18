import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import '../../app/utill/color_resources.dart';
import '../../app/utill/dimensions..dart';
import '../../app/utill/images.dart';

loadingDialog(BuildContext context) {
  return showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(30.0)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(Images.appLogo,
            height: MediaQuery.of(context).size.width*.3,   width: MediaQuery.of(context).size.width*.3,
          ),
          const Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            child: Text(
              "يرجي الانتظار....",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: ColorResources.goldColor,
              ),
            ),
          ),
        ]),
      );
    },
    animationType: DialogTransitionType.slideFromRight,
    curve: Curves.easeInOutBack,
    duration: const Duration(milliseconds: 700),
  );
}
