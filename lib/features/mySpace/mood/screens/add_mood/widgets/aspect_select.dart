import 'package:flutter/material.dart';
import 'package:knowyourself/features/mySpace/mood/screens/add_mood/widgets/helpers/progress_bar.dart';
import 'package:knowyourself/utils/constants/sizes.dart';

import '../../../../../../utils/constants/colors.dart';
import 'package:get/get.dart';

import '../../../../../../utils/helpers/shadow_disabler.dart';
import '../../../controller/add_mood_controller.dart';

class AspectSelectPage extends StatelessWidget {
  const AspectSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddMoodController.instance;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.93,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const ProgressBar(
                  steps: "1/3",
                  percent: 0.3,
                ),
                const SizedBox(
                  height: KSizes.defaultSpace,
                ),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Select an Aspect',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      TextSpan(
                          text: '\n\nChoose an aspect to describe your current state. Select one to proceed.',
                          style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: KSizes.defaultSpace * 2,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: List.generate(controller.aspectsList.length,
                        (index) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.selectAspect.value = index;
                            controller.nextPage();
                            },
                          child: Container(
                            margin:
                                const EdgeInsets.symmetric(vertical: 12.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 20.0),
                            decoration: BoxDecoration(
                              color: controller.selectAspect.value == index
                                  ? kApp1
                                  : kEmptyProgress,
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: CustomShadow.getShadow([
                                if (controller.selectAspect.value == index)
                                  BoxShadow(
                                    color: kApp1.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                              ]),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.aspectsList[index],
                                      style: TextStyle(
                                        color: controller.selectAspect.value ==
                                                index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16,
                                      ),
                                      ),
                                    if (controller.selectAspect.value == index)
                                      const Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                      ),
                                  ],
                                ),
                                Text (
                                  controller.aspectDescriptions[index],
                                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: controller.selectAspect.value == index
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            // TextButton(
            //     style: const ButtonStyle().copyWith(
            //         minimumSize: MaterialStateProperty.all(
            //             const Size(double.infinity, 60)),
            //         backgroundColor: MaterialStateProperty.all(kApp1),
            //         foregroundColor: MaterialStateProperty.all(Colors.white)),
            //     onPressed: ()=> controller.nextPage(),
            //     child: Text(
            //       'Next',
            //       style: Theme.of(context).textTheme.titleLarge?.copyWith(
            //           color: Colors.white, fontWeight: FontWeight.bold),
            //     )),
          ],
        ),
      ),
    ));
  }
}
