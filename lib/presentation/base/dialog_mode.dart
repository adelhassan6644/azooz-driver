import 'package:azooz_diver/provider/home_provider/contact_proider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';

import '../../app/utill/images.dart';

guestModeDialog(BuildContext context,String massage) {
  return showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Consumer<ContactProvider>(builder: (context, contactProvider, child) {
        return AlertDialog(
          shape: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(30.0)),
          content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.asset(
                        Images.checkMarkIcon,
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(height: 10,),
                      Text(massage,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(height: 5,),
                    ],
                  ),
                ),

              ]),
        );
      });
    },

    animationType: DialogTransitionType.slideFromRight,
    curve: Curves.easeInOutBack,
    duration: const Duration(milliseconds: 200),
  );
}
