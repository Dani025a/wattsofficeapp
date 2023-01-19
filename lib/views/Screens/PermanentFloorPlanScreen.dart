// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:string_ext/string_ext.dart';
import 'package:wattsofficeapp/Controllers/sharedController.dart';
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wattsofficeapp/models/userModel.dart';
import 'package:wattsofficeapp/views/Wigdets/PermanentFloorPlanOne.dart';
import 'package:wattsofficeapp/views/Wigdets/PermanentFloorPlanTwo.dart';
import 'package:wattsofficeapp/views/Wigdets/floorPlanOne.dart';
import 'package:wattsofficeapp/views/Wigdets/floorPlanTwo.dart';

import '../../models/dateModel.dart';
import '../../utils/utils.dart';

class PermanentFloorPlanScreen extends StatefulWidget {
  const PermanentFloorPlanScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PermanentFloorPlanScreen> createState() =>
      _PermanentFloorPlanScreenState();
}

class _PermanentFloorPlanScreenState extends State<PermanentFloorPlanScreen> {
  List<bool> isSelected = [true, false];
  bool vertical = false;

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
        appBar: AppBar(
          toolbarHeight: height * 0.07,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text(
            LocaleKeys.floorPlan.tr(),
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
                      var data = snapshot1.data;
                      if (data!.isEmpty) {
                        return buildText(LocaleKeys.noData.tr());
                      } else {
                        return Expanded(
                            child: Column(children: <Widget>[
                          ToggleButtons(
                            isSelected: isSelected,
                            selectedColor: Colors.white,
                            color: Colors.black,
                            fillColor: Colors.black,
                            splashColor: Colors.black,
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            borderRadius: BorderRadius.circular(5),
                            selectedBorderColor: Colors.black,
                            constraints: const BoxConstraints(
                              minHeight: 40.0,
                              minWidth: 120.0,
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.15,
                                    vertical: width * 0.03),
                                child: Text(LocaleKeys.roomOne.tr(),
                                    style: TextStyle(fontSize: width * 0.055)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.15,
                                    vertical: width * 0.03),
                                child: Text(LocaleKeys.roomTwo.tr(),
                                    style: TextStyle(fontSize: width * 0.055)),
                              ),
                            ],
                            onPressed: (int newIndex) {
                              setState(() {
                                for (int index = 0;
                                    index < isSelected.length;
                                    index++) {
                                  if (index == newIndex) {
                                    isSelected[index] = true;
                                  } else {
                                    isSelected[index] = false;
                                  }
                                }
                              });
                            },
                          ),
                          Expanded(
                            child: ListView(shrinkWrap: true, children: [
                              Column(
                                children: [
                                  if (isSelected[0] == true)
                                    PermanentFloorPlanOne(
                                      data: data,
                                    )
                                  else if (isSelected[1] == true)
                                    PermanentFloorPlanTwo(data: data)
                                ],
                              ),
                            ]),
                          )
                        ]));
                      }
                    }
                }
              }),
        ]));
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}
