import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobisoft_inspection/core/components/animations/custom-loading-animation.dart';
import 'package:mobisoft_inspection/core/components/button/login_button.dart';
import 'package:mobisoft_inspection/core/theme/app_text_style.dart';
import 'package:mobisoft_inspection/features/locations/presentation/manager/location_cubit.dart';
import 'package:mobisoft_inspection/features/locations/presentation/widgets/add_new_location_widget.dart';
import 'package:mobisoft_inspection/features/locations/presentation/widgets/location_item_widget.dart';
import 'package:mobisoft_inspection/features/locations/presentation/widgets/page_title.dart';
import '../../../../locator.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  final LocationCubit locationCubit = locator<LocationCubit>();

  @override
  void initState() {
    locationCubit.getAllLocations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {
          if (state is LocationError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is LocationPending) {
            return const Center(child: CustomLoadingAnimation());
          }
          if (state is LocationSuccess) {
            return SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PageTitle(title: "Locations"),
                      Text(
                          locationCubit.locations.isNotEmpty
                              ? "Please choose a location"
                              : "Please add location",
                          style: AppTextStyles.descriptionStyle.copyWith()),
                      SizedBox(height: 10.h),
                      Flexible(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: locationCubit.locations.length,
                              itemBuilder: (context, int index) {
                                return LocationItemWidget(
                                    location: locationCubit.locations[index]);
                              })),
                      const AddNewLocationWidget()
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is LocationError) {
            return Center(
                child: CustomRegisterButton(
                    title: "Retry",
                    active: true,
                    onTap: () {
                      locationCubit.getAllLocations();
                    }));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
