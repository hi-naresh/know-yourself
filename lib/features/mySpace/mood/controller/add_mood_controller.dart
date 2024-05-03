import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowyourself/features/mySpace/mood/model/activity_info_model.dart';
import 'package:knowyourself/features/mySpace/mood/model/mood_model_input.dart';
import 'package:knowyourself/routes.dart';
import 'package:knowyourself/utils/constants/enums.dart';
import 'package:knowyourself/utils/constants/text_strings.dart';
import 'package:knowyourself/utils/helpers/helper_functions.dart';

import '../../../../data/repo/space/mood/mood_repo.dart';
import '../screens/add_mood/widgets/aspect_select.dart';
import '../screens/add_mood/widgets/express_feelings.dart';
import '../screens/add_mood/widgets/mood_select.dart';

class AddMoodController extends GetxController {

  static AddMoodController get instance => Get.find();

  final _moodRepo = Get.put(MoodRepo());

  final RxInt index = 0.obs;
  final PageController pageController = PageController();

  final RxList<MoodModel> moodEntries = <MoodModel>[].toList().obs;

  final Rx<MoodModel?> moodModel = Rx<MoodModel?>(null);

  final RxString humanState = ''.obs;

  //physical
  final List physicalList = [
    'Energetic',
    'Fatigued',
    'Relaxed',
    'Tense',
    'Sore',
    'Alert',
    'Lethargic',
    'Flexible',
    'Achy',
    'Numb',
    'Strong',
    'Weak',
  ];
  final selectedPhysical = ''.obs;
  void setSelectedPhysical(int index) {
    selectedPhysical.value = physicalList[index];
  }

  //mental
  final List mentalList = [
    'Stressed',
    'Focused',
    'Confused',
    'Creative',
    'Exhausted',
    'Assertive',
  ];
  final selectedMental = ''.obs;
  void setSelectedMental(int index) {
    selectedMental.value = mentalList[index];
  }

  //spiritual
  final List spiritualList = [
    'Connected',
    'Grounded',
    'Seeking',
    'Surrendered',
    'Aligned',
    'Empowered',
  ];
  final selectedSpiritual = ''.obs;
  void setSelectedSpiritual(int index) {
    selectedSpiritual.value = spiritualList[index];
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    loadMoodEntries();
    moodEntries.refresh();
  }

  void loadMoodEntries() async{
    final getEntries = await _moodRepo.getMoodEntries();
    if (getEntries.isNotEmpty) {
      moodEntries.assignAll(getEntries);
    }
  }

  //mood
  RxDouble sliderValue = 0.0.obs;

  static myEmojis(emoji) => AnimatedEmoji(emoji, size: 40, repeat: true, source:  AnimatedEmojiSource.asset,);

  final List<AnimatedEmoji> emotionalEmojis= [
    myEmojis(AnimatedEmojis.grin),
    myEmojis(AnimatedEmojis.sad),
    myEmojis(AnimatedEmojis.rage),
    myEmojis(AnimatedEmojis.anxiousWithSweat),
    myEmojis(AnimatedEmojis.surprised),
    myEmojis(AnimatedEmojis.sweat),
    myEmojis(AnimatedEmojis.scared),
    myEmojis(AnimatedEmojis.grinning),
    myEmojis(AnimatedEmojis.pleading),
    myEmojis(AnimatedEmojis.distraught),
    myEmojis(AnimatedEmojis.cry),
  ];

  String get moodString=> emotionalEmojis[(sliderValue.value * emotionalEmojis.length).round() % emotionalEmojis.length].emoji.name;

  //set strings for each emoji in this order
  //sad -> sad
  //rage -> angry
  //anxiousWithSweat -> anxious
  //surprised -> surprised
  //distraught -> distraught
  //cry -> cry
//pleading -> guilty
  //scared -> scared
  //sweat -> stressed
  //grinning -> excited
  //grin -> happy
  String get userMoodString => moodString == 'sad' ? 'Sad' : moodString == 'rage' ? 'Angry' : moodString == 'anxiousWithSweat' ? 'Anxious' : moodString == 'surprised' ? 'Surprised' : moodString == 'distraught' ? 'Distraught' : moodString == 'cry' ? 'Cry' : moodString == 'pleading' ? 'Guilty' : moodString == 'scared' ? 'Scared' : moodString == 'sweat' ? 'Stressed' : moodString == 'grinning' ? 'Excited':moodString=="grin" ? 'Happy' : 'Nothing';
  int get moodIndex => (sliderValue.value * emotionalEmojis.length).round();

  //human state from physical, mental, emotional, spiritual
  String getHumanState() {
    if (selectAspect.value == 0) {
      return selectedMental.value;
    } else if (selectAspect.value == 1) {
      return selectedPhysical.value;
    } else if (selectAspect.value == 2) {
      return userMoodString;
    } else {
      return selectedSpiritual.value;
    }
  }

  RxInt selectAspect = 0.obs;
  // List<String> aspectsList = ['Mentally\n ${KTexts.mentalDescription}', 'Physically\n ${KTexts.physicalDescription}', 'Emotionally\n ${KTexts.vitalDescription}', 'Spiritually\n ${KTexts.spiritualDescription}'];
  List<String> aspectsList = ['Mentally', 'Physically', 'Emotionally', 'Spiritually'];
  List<String> aspectDescriptions = [(KTexts.mentalDescription), (KTexts.physicalDescription), (KTexts.vitalDescription), (KTexts.spiritualDescription)];
  //get aspect from index
  String get aspectString => aspectsList[selectAspect.value];
  RxInt selectHappenedAt = 0.obs; //0 for social, 1 for work, 2 for home, 3 for personal
  final happenedAt = ['Social', 'Work', 'Home', 'Personal'];
  //get happenedAt from index
  String get happenedAtString => happenedAt[selectHappenedAt.value];
  final TextEditingController reasons = TextEditingController();

  final RxList activitiesTitle = [].obs;


  final List<Widget> journalPages = [
    const AspectSelectPage(),
    const MoodSelectPage(),
    const ExpressFeelingsPage(),
  ];


  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void jumpToPage( index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut
    );
  }

  void previousPage() {
    if (pageController.page!.round() > 0) {
      pageController.previousPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn);
    } else {
      Get.back();
    }
  }

  Future<void> saveMoodData() async {
    await _moodRepo.saveMoodEntry(MoodModel(
      // consider saving all states physically, mentally, emotionally, spiritually
      mood: getHumanState() ,
      aspect: aspectString,
      description: reasons.text,
      happenedAt: happenedAtString, id: '',
      entryDate: DateTime.now(),
    ));
    loadMoodEntries();
    moodEntries.refresh();
    Get.back();
    KHelper.showSnackBar("Saved Entry!", "Successfully stored your entry at mood board.");

  }

  // void shiftMood() {
  //   Get.toNamed(KRoutes.getActivitiesRoute());
  // }

  // //solve error - type 'String' is not a subtype of type 'Map<String, dynamic>' in above function
  // List<ActivityModel> parseActivities(List<dynamic> jsonList) {
  //   return jsonList.map((json) {
  //     if (json is Map<String, dynamic>) {
  //       return ActivityModel.fromJson(json);
  //     } else {
  //       throw Exception('Expected a map but got: ${json.runtimeType}');
  //     }
  //   }).toList();
  // }



  Future<void> shiftMood() async {
    try {
      MoodModel currentMood = MoodModel(
        mood: humanState.value.toString(),
        aspect: aspectString,
        description: reasons.text,
        happenedAt: happenedAtString,
        shift: true,
        id: '',  // Ensure you have a valid ID if necessary
        entryDate: DateTime.now(),
      );

      print('Current mood: $currentMood');

      // Use the repository to recommend activities based on the current mood
      List<String> userActivities = await _moodRepo.recommendActivity(currentMood, moodIndex, selectAspect.value, selectHappenedAt.value, 0);
      List<String> activityTitles = [];
      for (var activity in userActivities) {
        activityTitles.add(separateTitle(activity));
      }

      activitiesTitle.assignAll(activityTitles);
      // print('Recommended activities: $userActivities');
      // print(activitiesTitle);

      // Optionally, you can handle the navigation or any follow-up actions here
      if (userActivities.isNotEmpty) {
        // Navigate or display activities
        Get.toNamed(KRoutes.getActivitiesRoute());
      } else {
        Get.snackbar('No Activities Found', 'No recommended activities based on your current mood.');
      }
    } catch (e) {
      // Handle any errors that might occur during the process
      print('Error in shifting mood: $e');
      Get.snackbar('Error', 'Failed to shift mood due to an error.');
    }
  }

  String separateTitle(String activity) {
    return activity.split("title:").last.split(",").first;
  }

  String separateDescription(String activity) {
    return activity.split("instructions:").last.split(",").first;
  }

  String separateLink(String activity) {
    return activity.split("link:").last.split(",").first;
  }



  deFocusKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  Future<void> deleteMoodEntry(String entryId) async {
    await _moodRepo.deleteMoodEntry(entryId);
    moodEntries.removeWhere((entry) => entry.id == entryId);
    // KHelper.showSnackBar("Deleted", "Successfully deleted the entry of yours.");
    moodEntries.refresh();
  }

}
