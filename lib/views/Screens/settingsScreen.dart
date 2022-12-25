// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wattsofficeapp/utils/utils.dart' as dateUtils;
import 'package:get/get.dart' hide Trans;
import 'package:wattsofficeapp/Controllers/authController.dart';
import '../../l10n/locale_keys.g.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  DateTime currentime = DateTime.now();
  int permenantSeatNumber = 25;
  bool notificationOff = false;
  bool fridayNotification = false;
  bool thursdayNotification = false;
  bool alwaysAtOffice = false;
  @override
  Widget build(BuildContext context) {
    bool atOffice = false;
    AuthController authController = Get.put(AuthController());
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
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
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
                  title: Text(LocaleKeys.turnNotificationOff.tr()),
                  secondary: Icon(Icons.notifications_off),
                  onChanged: (bool val) {
                    setState(() {
                      notificationOff = val;
                    });
                  },
                ),
                SwitchListTile(
                  activeColor: Colors.blue,
                  contentPadding: const EdgeInsets.all(0),
                  value: fridayNotification,
                  title: Text(LocaleKeys.fridayNotification.tr()),
                  secondary: Icon(Icons.notification_add_sharp),
                  onChanged: (bool val) {
                    setState(() {
                      fridayNotification = val;
                    });
                  },
                ),
                SwitchListTile(
                  activeColor: Colors.blue,
                  contentPadding: const EdgeInsets.all(0),
                  value: thursdayNotification,
                  title: Text(LocaleKeys.thursdayNotification.tr()),
                  secondary: Icon(Icons.notification_add_sharp),
                  onChanged: (bool val) {
                    setState(() {
                      thursdayNotification = val;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        contentPadding: const EdgeInsets.all(0),
                        value: alwaysAtOffice,
                        title: Text(LocaleKeys.alwaysAtOffice.tr()),
                        secondary: Icon(Icons.business),
                        onChanged: (bool val) {
                          setState(() {
                            alwaysAtOffice = val;
                          });
                        },
                      ),
                      if (permenantSeatNumber != 0) ...[
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: Icon(
                            Icons.desk,
                          ),
                          title: Text(LocaleKeys.editPermanentSeat.tr()),
                          subtitle: Text(
                              '${LocaleKeys.seatNumber.tr()}: $permenantSeatNumber'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {},
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  LocaleKeys.deletePermanentSeat.tr(),
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ))
                          ],
                        ),
                      ] else ...[
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: Icon(
                            Icons.desk,
                          ),
                          title: Text(LocaleKeys.addPermanentSeat.tr()),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {},
                        ),
                      ],
                      Padding(
                          padding: EdgeInsets.only(top: 130),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: MaterialButton(
                                      height: 40,
                                      minWidth: 110,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      color: Colors.black,
                                      child: Text(
                                        LocaleKeys.signOut.tr(),
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white),
                                      ),
                                      onPressed: () {
                                        AuthController.instance.signOut();
                                      })),
                            ],
                          ))
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
