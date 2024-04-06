import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:knowyourself/utils/constants/image_strings.dart';

import '../../../../../common/widgets/my_card.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../master.dart';
import '../../../../mySpace/space_screen.dart';
import '/utils/constants/sizes.dart';

class MyselfSection extends StatelessWidget {
  const MyselfSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Myself", style: Theme.of(context).textTheme.headlineSmall),
              GestureDetector(
                onTap: ()=> MasterController.instance.currentIndex.value = 3,
                child: Text(
                  "View All",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: KSizes.md),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            myCard(
              context: context,
              title: "Reflect",
              color: kApp1,
              imageUrl: KImages.health12,
              screenWidth: kIsWeb? 390: KDeviceUtils.getScreenWidth(context),
              onTap: () {
                final controller = MySpaceController.instance;
                final masterController = MasterController.instance;
                controller.updateTabIndex(0);
                masterController.currentIndex.value = 3;
              },
            ),
            myCard(
              context: context,
              title: "Review",
              color: kApp2,
              imageUrl: KImages.health1,
              screenWidth: kIsWeb? 390: KDeviceUtils.getScreenWidth(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget myCard({
    required BuildContext context,
    required String title,
    required Color color,
    required String imageUrl,
    required double screenWidth,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: MyCard(
        width: screenWidth * 0.4,
        height: KSizes.hCardSmall,
        left: screenWidth * 0.09,
        title: title,
        color: color,
        imageUrl: imageUrl,
      ),
    );
  }
}
