import 'package:flutter/material.dart';
import '../../app/utill/color_resources.dart';
import '../../app/utill/images.dart';
// implements PreferredSizeWidget

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const CustomAppBar( {Key? key,  this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.withOpacity(0.7),
      automaticallyImplyLeading: false,
      centerTitle: true,
      leadingWidth: 80,
      title: Text( title ?? '',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
      leading:Navigator.canPop(context)? Padding(
        padding: const EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorResources.goldColor),
              child: const Icon(Icons.arrow_back)
            ),
          ),
        ),
      ):const SizedBox(),
    );
  }
  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}
