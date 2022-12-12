// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wattsofficeapp/Controllers/sharedController.dart';
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

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: width * 0.1,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text(
            LocaleKeys.settings.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.06,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: Stack(children: <Widget>[
          Column(
            children: [
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 45),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: MaterialButton(
                              height: 40,
                              minWidth: 110,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8)),
                              color: Colors.black,
                              child: Text(
                                LocaleKeys.signUp.tr(),
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              onPressed: () {
                                AuthController.instance.signOut();
                              })),
                      Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: MaterialButton(
                              height: 40,
                              minWidth: 110,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8)),
                              color: Colors.black,
                              child: Text(
                                LocaleKeys.signUp.tr(),
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              onPressed: () {})),
                    ],
                  ))
            ],
          )
        ]));
  }
}
