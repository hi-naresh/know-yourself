import 'package:flutter/material.dart';
import 'package:knowyourself/features/insights/screens/dashboard/widgets/myself_section.dart';
import '/features/insights/screens/dashboard/widgets/milestones_section.dart';
import '/features/insights/screens/dashboard/widgets/mood_section.dart';
import '/features/insights/screens/dashboard/widgets/progress_milestones.dart';
import '/features/insights/screens/dashboard/widgets/recommend_section.dart';
import '/utils/constants/sizes.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: KSizes.defaultSpace, vertical: KSizes.defaultSpace/2),
        child: Column(
          children: [
            MoodSection(),
            SizedBox(height: KSizes.defaultSpace),
            DailyMilestoneSection(),
            SizedBox(height: KSizes.defaultSpace),
            MyselfSection(),
            SizedBox(height: KSizes.spaceBtwSections),
            ProgressComponent(
              milestonesProgress: {
                'Daily': 0.35,
                'Monthly': 0.5,
                'Yearly': 0.7,
              },
            ),
            SizedBox(height: KSizes.defaultSpace),
            RecommendSection(),
            SizedBox(height: KSizes.defaultSpace*5),
          ],
        ),
      ),
    );
  }
}
