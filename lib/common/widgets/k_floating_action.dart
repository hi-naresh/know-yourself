import 'package:flutter/material.dart';

import '../../../common/styles/styles.dart';
import '../../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class KFloatingAction extends StatelessWidget {

  final IconData icon;
  final Widget screenWidget;
  const KFloatingAction({
    super.key, required this.icon, required this.screenWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: KSizes.iconXl * 2,
      width: KSizes.iconXl * 2,
      decoration: KStyles.darkToLight(kApp4),
      child: IconButton(
        icon: Icon(
          icon,
          size: KSizes.iconLg,
          color: Theme.of(context).textTheme.titleMedium!.color,
        ),
        onPressed: () {
          KHelper.showBottomSheet( screenWidget);
        },
      ),
    );
  }
}
