import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knowyourself/features/insights/controller/dashboard_controller.dart';
import 'package:knowyourself/routes.dart';
import 'package:knowyourself/utils/constants/colors.dart';
import 'package:knowyourself/utils/constants/image_strings.dart';
import 'package:knowyourself/utils/constants/sizes.dart';
import 'package:knowyourself/utils/constants/text_strings.dart';
import '../../../../../common/widgets/custom_container.dart';
import 'package:get/get.dart';

import '../../../../personalisation/controller/user_controller.dart';
class MoodSection extends StatelessWidget {
  const MoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    final userController = Get.put(UserController());
    return CustomContainer(
      width: double.infinity,
      color: kApp1Light,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: Opacity(
              opacity: 0.1,
              child: SvgPicture.asset(
                KImages.health13,
                height: 140,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: controller.greeting(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    TextSpan(
                      text: "${userController.user.value.fullName!}!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    TextSpan(
                      text: "\n${KTexts.feel}",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                ),
              const SizedBox(height: KSizes.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: const Color(0x4DF5F5F5),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Express Your Mood & Reflect:\nLog emotions and thoughts.",
                      style: Theme.of(context).textTheme.labelSmall,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(KSizes.md),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(KColors.darkerGrey),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    onPressed: ()=>Get.toNamed(KRoutes.getAddMoodRoute()),
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}