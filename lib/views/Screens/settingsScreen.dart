// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wattsofficeapp/Controllers/sharedController.dart';
import 'package:wattsofficeapp/models/userModel.dart';
import 'package:wattsofficeapp/utils/utils.dart' as dateUtils;
import 'package:get/get.dart' hide Trans;
import 'package:wattsofficeapp/Controllers/authController.dart';
import 'package:wattsofficeapp/views/Screens/PermanentFloorPlanScreen.dart';
import '../../l10n/locale_keys.g.dart';
import '../../utils/utils.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final Stream<List<UserModel>> streamData;
  @override
  void initState() {
    super.initState();
    streamData = SharedController.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          toolbarHeight: height * 0.07,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text(
            LocaleKeys.settings.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.06,
            ),
          ),
          centerTitle: true,
          elevation: 2,
        ),
        body: Column(children: <Widget>[
          StreamBuilder<List<UserModel>>(
              stream: streamData,
              builder: (context, snapshot1) {
                switch (snapshot1.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot1.hasError) {
                      return buildText(LocaleKeys.somethingWentWrong.tr());
                    } else {
                      final data = snapshot1.data;

                      if (data!.isEmpty) {
                        return buildText(LocaleKeys.noData.tr());
                      } else {
                        int index = Utils().getCurrentUser(data);
                        int permenantSeatNumber =
                            data[index].permanentSeatNumber;
                        bool notificationOff = data[index].notificationOff;
                        bool fridayNotification =
                            data[index].notificationFridayMorning;
                        bool thursdayNotification =
                            data[index].notificationThursdayEvening;
                        bool alwaysAtOffice = data[index].permanentWhereAreYou;
                        return Expanded(
                            child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            SingleChildScrollView(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 40, 16, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    LocaleKeys.notificationSettings.tr(),
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SwitchListTile(
                                    activeColor: Colors.blue,
                                    contentPadding: const EdgeInsets.all(0),
                                    value: notificationOff,
                                    title: Text(
                                        LocaleKeys.turnNotificationOff.tr()),
                                    secondary: Icon(Icons.notifications_off),
                                    onChanged: (bool val) {
                                      setState(() {
                                        notificationOff = val;
                                        SharedController().changeNotification(
                                            true, false, false);
                                      });
                                    },
                                  ),
                                  SwitchListTile(
                                    activeColor: Colors.blue,
                                    contentPadding: const EdgeInsets.all(0),
                                    value: fridayNotification,
                                    title: Text(
                                        LocaleKeys.fridayNotification.tr()),
                                    secondary:
                                        Icon(Icons.notification_add_sharp),
                                    onChanged: (bool val) {
                                      setState(() {
                                        fridayNotification = val;
                                        SharedController().changeNotification(
                                            false, true, false);
                                      });
                                    },
                                  ),
                                  SwitchListTile(
                                    activeColor: Colors.blue,
                                    contentPadding: const EdgeInsets.all(0),
                                    value: thursdayNotification,
                                    title: Text(
                                        LocaleKeys.thursdayNotification.tr()),
                                    secondary:
                                        Icon(Icons.notification_add_sharp),
                                    onChanged: (bool val) {
                                      setState(() {
                                        thursdayNotification = val;
                                        SharedController().changeNotification(
                                            false, false, true);
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 20.0),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          LocaleKeys.general.tr(),
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        SwitchListTile(
                                          activeColor: Colors.blue,
                                          contentPadding:
                                              const EdgeInsets.all(0),
                                          value: alwaysAtOffice,
                                          title: Text(
                                              LocaleKeys.alwaysAtOffice.tr()),
                                          secondary: Icon(Icons.business),
                                          onChanged: (bool val) {
                                            setState(() {
                                              alwaysAtOffice = val;
                                              if (alwaysAtOffice == false) {
                                                SharedController()
                                                    .removeAlwaysAtOffice();
                                              } else {
                                                SharedController()
                                                    .alwaysAtOffice();
                                              }
                                            });
                                          },
                                        ),
                                        if (permenantSeatNumber != 0) ...[
                                          ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            leading: Icon(
                                              Icons.desk,
                                            ),
                                            title: Text(LocaleKeys
                                                .editPermanentSeat
                                                .tr()),
                                            subtitle: Text(
                                                '${LocaleKeys.seatNumber.tr()}: $permenantSeatNumber'),
                                            trailing: Icon(
                                                Icons.keyboard_arrow_right),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PermanentFloorPlanScreen()));
                                            },
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    SharedController()
                                                        .removePermanentSeat();
                                                  },
                                                  child: Text(
                                                    LocaleKeys
                                                        .deletePermanentSeat
                                                        .tr(),
                                                    style: TextStyle(
                                                      fontSize: width * 0.04,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ] else ...[
                                          ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            leading: Icon(
                                              Icons.desk,
                                            ),
                                            title: Text(LocaleKeys
                                                .addPermanentSeat
                                                .tr()),
                                            trailing: Icon(
                                                Icons.keyboard_arrow_right),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PermanentFloorPlanScreen()));
                                            },
                                          ),
                                        ],
                                        Padding(
                                            padding: EdgeInsets.only(top: 130),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 0),
                                                    child: MaterialButton(
                                                        height: 40,
                                                        minWidth: 110,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8)),
                                                        color: Colors.black,
                                                        child: Text(
                                                          LocaleKeys.signOut
                                                              .tr(),
                                                          style: TextStyle(
                                                              fontSize: 14.0,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        onPressed: () {
                                                          AuthController
                                                              .instance
                                                              .signOut();
                                                        })),
                                              ],
                                            ))
                                      ]),
                                ],
                              ),
                            ),
                          ],
                        ));
                      }
                    }
                }
              })
        ]));
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}
