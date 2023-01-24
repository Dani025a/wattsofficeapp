import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:wattsofficeapp/utils/notifications.dart';
import 'package:wattsofficeapp/views/Screens/seatingAndFoodScreen.dart';
import 'package:wattsofficeapp/views/Screens/floorPlanScreen.dart';
import 'package:wattsofficeapp/views/Screens/listScreen.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wattsofficeapp/views/Screens/settingsScreen.dart';

import '../../l10n/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;

  final List<Widget> screens = [
    const SeatingAndFoodScreen(),
    const FloorPlanScreen(
      popup: false,
    ),
    const ListScreen(),
    const SettingsScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  String notificationMsg = "Waiting for notifications";
  @override
  void initState() {
    super.initState();

    Notifications.initilize();

    FirebaseMessaging.instance.getInitialMessage().then((event) {});

    FirebaseMessaging.onMessage.listen((event) {
      Notifications.showNotificationOnForeground(event);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {});
  }

  Widget currentScreen = SeatingAndFoodScreen();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.black,
          height: width * 0.16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = SeatingAndFoodScreen();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.desk,
                            color: currentTab == 0 ? Colors.blue : Colors.white,
                            size: width * 0.06,
                          ),
                          Text(
                            LocaleKeys.seating.tr(),
                            style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.white,
                              fontSize: width * 0.025,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = FloorPlanScreen(
                            popup: false,
                          );
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.house,
                            color: currentTab == 1 ? Colors.blue : Colors.white,
                            size: width * 0.06,
                          ),
                          Text(
                            LocaleKeys.floorPlan.tr(),
                            style: TextStyle(
                              color:
                                  currentTab == 1 ? Colors.blue : Colors.white,
                              fontSize: width * 0.025,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = ListScreen();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.list,
                            color: currentTab == 2 ? Colors.blue : Colors.white,
                            size: width * 0.06,
                          ),
                          Text(
                            LocaleKeys.seatingList.tr(),
                            style: TextStyle(
                              color:
                                  currentTab == 2 ? Colors.blue : Colors.white,
                              fontSize: width * 0.025,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = SettingsScreen();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings,
                            color: currentTab == 3 ? Colors.blue : Colors.white,
                            size: width * 0.06,
                          ),
                          Text(
                            LocaleKeys.settings.tr(),
                            style: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.blue : Colors.white,
                              fontSize: width * 0.025,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
