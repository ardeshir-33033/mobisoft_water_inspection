import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobisoft_inspection/core/theme/app_text_style.dart';
import 'package:mobisoft_inspection/core/theme/shadow.dart';
import 'package:mobisoft_inspection/features/locations/domain/entities/location_entity.dart';

import '../../../../core/static/locations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../camera/presentation/pages/camera_page.dart';

class LocationItemWidget extends StatelessWidget {
  const LocationItemWidget({Key? key, required this.location})
      : super(key: key);

  final LocationEntity location;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CameraPage(
                    )));
        Locations().setLocation(location);
      },
      child: Column(
        children: [
          Container(
            width: 320.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [FixedBoxShadow().fixedContainerShadow()],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    location.title ?? "Address Title",
                    style: AppTextStyles.body2
                        .copyWith(color: AppColors.titleColor),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  location.address ?? "Address",
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
