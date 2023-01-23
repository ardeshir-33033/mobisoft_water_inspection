import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class AddNewLocationWidget extends StatelessWidget {
  const AddNewLocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        Navigator.pushNamed(context, '/addLocations');
      },
      child: Center(
        child: DottedBorder(
            radius: Radius.circular(15.r),
            strokeCap: StrokeCap.butt,
            borderType: BorderType.RRect,
            child: SizedBox(
              width: 310.w,
              height: 50.h,
              child: Icon(
                Icons.add_circle_outline,
                color: AppColors.primary3,
                size: 30.w,
              ),
            )),
      ),
    );
  }
}
