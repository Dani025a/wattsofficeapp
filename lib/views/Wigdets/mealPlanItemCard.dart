// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';

class MealPlanItemCard extends StatefulWidget {
  const MealPlanItemCard({Key? key}) : super(key: key);
  @override
  State<MealPlanItemCard> createState() => _MealPlanItemCardState();
}

class _MealPlanItemCardState extends State<MealPlanItemCard> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    int guest = 0;
    return Column(children: [
      Card(
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Color(0xFFF5F5F5),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                        Text("",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )
                    ],
                  ),
                  Text(
                    ' - ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    "01.01.2023",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          FlutterSwitch(
                            activeColor: Colors.black,
                            inactiveColor: Colors.red,
                            value: isSwitched,
                            onToggle: (val) {
                              setState(() {
                                isSwitched = val;
                              });
                            },
                          )
                        ],
                      ),
                      Column(
                        children: [
                          if (guest == 0)
                            MaterialButton(
                              height: 40,
                              minWidth: 110,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8)),
                              color: Colors.black,
                              child: Text(
                                'Add guests',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              onPressed: () {},
                            )
                          else
                            MaterialButton(
                              height: 40,
                              minWidth: 110,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8)),
                              color: Colors.black,
                              child: Text(
                                'Edit guests',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              onPressed: () {},
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            LocaleKeys.guests.tr(),
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ': ',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
