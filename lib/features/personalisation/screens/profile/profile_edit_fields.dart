import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:knowyourself/common/widgets/appbar/pagebar.dart';
import 'package:knowyourself/features/personalisation/controller/profile_setup_controller.dart';
import 'package:knowyourself/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class EditPersonalInfo extends StatelessWidget {
  const EditPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProfileSetupController.instance;
    return Scaffold(
      appBar: KPageBar(
        title: 'Edit Personal Info',
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(KSizes.md),
        child: Column(
          children: [
            ListTile(
              title: Text('Your Name'),
              subtitle: TextField(
                onChanged: (value) => controller.name.value = value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: controller.userProfile.value.name,
                ),
              ),
            ),
            // ListTile(
            //   title: Text('Your avatar'),
            //   subtitle: GridView.builder(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     physics: const NeverScrollableScrollPhysics(),
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 1,
            //       crossAxisSpacing: KSizes.sm,
            //       mainAxisSpacing: KSizes.md,
            //       childAspectRatio: 1, // Add childAspectRatio for square grids
            //     ),
            //     itemCount: 12, // Assuming you have 12 avatars
            //     itemBuilder: (context, index) {
            //       // Handle the 'no avatar' option
            //       if (index == 11) {
            //         return Obx(
            //               ()=> GestureDetector(
            //             onTap: () => controller.setAvatar(''),
            //             child: CircleAvatar(
            //               radius: 30,
            //               backgroundColor: controller.avatar.value.isEmpty
            //                   ? KColors.primary // Highlight if selected
            //                   : Colors.transparent,
            //               child: const Icon(
            //                 CupertinoIcons.nosign, size: KSizes.iconMd*2,
            //               ),
            //             ),
            //           ),
            //         );
            //       }
            //
            //       String avatarPath = 'assets/avatars/avatar${index + 1}.svg';
            //       return Obx(
            //             ()=> GestureDetector(
            //           onTap: () => controller.setAvatar(avatarPath),
            //           child: CircleAvatar(
            //             radius: 30,
            //             backgroundColor: controller.avatar.value == avatarPath
            //                 ? KColors.primary  // Highlight if selected
            //                 : Colors.transparent,
            //             child: SvgPicture.asset(
            //               avatarPath,
            //               height: 70,
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            ListTile(
              title: Text('Your avatar'),
              subtitle: Container(
                height: 160,  // Set a fixed height
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: 12, // Number of items in the grid
                  itemBuilder: (context, index) {
                    // Implementation of your avatar selection
                    String avatarPath = 'assets/avatars/avatar${index + 1}.svg';
                    return Obx(
                        ()=> GestureDetector(
                        onTap: () => controller.setAvatar(avatarPath),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: KSizes.md),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: controller.avatar.value == avatarPath
                                ? KColors.primary // Highlight if selected
                                : Colors.transparent,
                            child: index==11 ?Icon(CupertinoIcons.nosign, size: KSizes.iconXxl*2,) : SvgPicture.asset(
                              avatarPath,
                              height: 90, // Adjusted for visual fit within the circle
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            ListTile(
              title: Text('Your Occupation'),
              subtitle: TextField(
                onChanged: (value) => controller.occupation.value = value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: controller.userProfile.value.occupation,
                ),
              ),
            ),
            SizedBox(height: KSizes.md),
            ListTile(
              title: Text('Institution'),
              subtitle: TextField(
                onChanged: (value) => controller.institution.value = value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: controller.userProfile.value.institution,
                ),
              ),
            ),
            SizedBox(height: KSizes.md),
            ElevatedButton(
                onPressed: ()=> controller.updateProfile(),
                child: const Text('Save Changes')
            ),
        ]
        ),
      )
    );
  }
}
