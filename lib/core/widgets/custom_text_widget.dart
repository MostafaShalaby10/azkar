import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    this.textColor,
    this.textAlign,
    required this.fontWeight,
    this.maxLines,
  });

  final String text;
  final double fontSize;
  final Color? textColor;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign ?? TextAlign.start,
      textDirection: TextDirection.rtl,
      // overflow: TextOverflow.ellipsis,
      text,
      // maxLines: maxLines ?? 2,
      // style: TextStyle(
      //   color: textColor??Colors.black,
      //   fontSize: fontSize.sp,
      //   fontWeight: fontWeight,
      // ),
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: textColor,
      ),
    );
  }
}
