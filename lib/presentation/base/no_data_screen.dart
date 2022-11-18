import 'package:flutter/material.dart';

import '../../app/utill/images.dart';

class NoDataView extends StatelessWidget {
  final String message;
  final String? image;
  const NoDataView( {required this.message, this.image,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //image for wishlist empty
          Image.asset(
            image??  Images.appLogo,
            height: 200,
            width: 200,
          ),
          Text(
            message,
            style: TextStyle(
                fontSize: 20,

                color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
