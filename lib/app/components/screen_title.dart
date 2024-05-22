import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  final double? dividerEndIndent;
  const ScreenTitle({
    Key? key,
    required this.title,
    this.dividerEndIndent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Use min to fit content size
      crossAxisAlignment:
          CrossAxisAlignment.center, // Center children horizontally
      children: [
        Text(
          title,
          textAlign: TextAlign.center, // Center align text
          style: context.theme.textTheme.displayLarge?.copyWith(
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 8.h), // spacing before the divider, adjust as needed
        Center(
          // Use Center to ensure the Container (and thus the Divider) is centered
          child: Container(
            width:
                MediaQuery.of(context).size.width * 0.8, // 80% of screen width
            child: const Divider(
              thickness: 3,
              color: Colors
                  .black, // Ensure the divider color contrasts with the background
            ),
          ),
        ),
      ],
    );
  }
}
