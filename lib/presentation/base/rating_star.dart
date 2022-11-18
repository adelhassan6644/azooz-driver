import 'package:flutter/material.dart';

import '../../app/utill/color_resources.dart';
typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating; final double iconSize;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;  final MainAxisAlignment alignment;

  const StarRating({this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color, this.alignment=MainAxisAlignment.end, this.iconSize=20});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon =  Icon(
        Icons.star_border,
        size: iconSize,
        color: ColorResources.goldColor,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon =  Icon(
        Icons.star_half,
        size: iconSize,
        color: ColorResources.goldColor,
      );
    } else {
      icon =  Icon(
        Icons.star,
        size: iconSize,
        color: ColorResources.goldColor,
      );
    }
    return  InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: alignment,
        children:  List.generate(starCount, (index) => buildStar(context, index)));
  }
}