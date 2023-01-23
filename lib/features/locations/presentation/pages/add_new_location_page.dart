import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobisoft_inspection/core/components/button/login_button.dart';
import 'package:mobisoft_inspection/features/locations/presentation/widgets/page_title.dart';

import '../../../../core/components/textfields/custom_textfield.dart';
import '../../../../core/theme/app_text_style.dart';

class AddNewLocationPage extends StatefulWidget {
  const AddNewLocationPage({Key? key}) : super(key: key);

  @override
  State<AddNewLocationPage> createState() => _AddNewLocationPageState();
}

class _AddNewLocationPageState extends State<AddNewLocationPage> {
  TextEditingController addressTitleController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageTitle(title: "Add New Location"),
              Text("Please fill data",
                  style: AppTextStyles.descriptionStyle.copyWith()),
              SizedBox(height: 30.h),
              SizedBox(
                height: 60.h,
                child: CustomTextField(
                  textAlign: TextAlign.start,
                  hint: "Address Title",
                  textEditingController: addressTitleController,
                  contentPadding: EdgeInsets.symmetric(horizontal: 7.w),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 60.h,
                child: CustomTextField(
                  textAlign: TextAlign.start,
                  hint: "Address",
                  textEditingController: addressController,
                  contentPadding: EdgeInsets.symmetric(horizontal: 7.w),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),

              Container(
                height: 250.h,
                color: Colors.grey.withOpacity(0.2),
                child: const Center(
                  child: Text("GOOGLE MAP"),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),

              Center(
                child: CustomRegisterButton(
                    active: true,
                    title: "Add Location",
                    onTap: () {
                      Navigator.pop(context);
                    }),
              )

              // MapWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
