import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:knowyourself/provider/App%20State/app_state_provider.dart';
import 'package:knowyourself/provider/Extras/user_data_provider.dart';
import 'package:knowyourself/screens/Home/widgets/journal_entry_text_widget.dart';
import 'package:knowyourself/screens/Home/widgets/quote_widget.dart';
import 'package:knowyourself/screens/Home/widgets/to_do_radial_widget.dart';
import 'package:knowyourself/screens/Journals/Account%20Screen/account_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12 && hour > 5) {
      return 'Good Morning';
    } else if (hour < 17 && hour > 12) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 270.w,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Consumer<UserDataProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Text.rich(
                        overflow: TextOverflow.ellipsis,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${greeting()},\n',
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2),
                            ),
                            TextSpan(
                              text: value.userName,
                              style: TextStyle(
                                  fontSize: 35.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const AccountScreen();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Consumer<UserDataProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return CircleAvatar(
                        radius: 30.r,
                        backgroundColor: const Color(0xFFD9D9D9),
                        backgroundImage: AssetImage(
                          "assets/avatars/${value.avatar}.png",
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Quote of the day",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: QuoteWidget()),
          SizedBox(
            height: 10.h,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TodoRadialWidget(),
          ),
          SizedBox(
            height: 12.h,
          ),

          GestureDetector(
            onTap: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (BuildContext context) {
              //   return const ChatbotScreen();
              // }));
              Provider.of<AppStateProvider>(context, listen: false)
                  .updatePage(2);
            },
            child: const JournalEntryTextWidget(),
          ),

          // Consumer<JournalProvider>(
          //   builder: (BuildContext context, value, Widget? child) {
          //     List<JournalModel> journals = value.journals;
          //     if (journals.isEmpty) {
          //       return const Text("data");
          //     } else {
          //       return JournalWidget(journalModel: journals.last);
          //     }
          //   },
          // )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
