// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:string_ext/string_ext.dart';
import 'package:wattsofficeapp/Controllers/sharedController.dart';
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';
import 'package:wattsofficeapp/models/dateModel.dart';
import 'package:get/get.dart' hide Trans;

import '../../utils/utils.dart';
import '../Wigdets/listCard.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  DateTime currentime = DateTime.now();

  late final Stream<List<DateModel>> streamData;
  int currentdateindex = 0;
  late int index = currentdateindex;
  late DateTime choosendate = currentime;
  @override
  void initState() {
    super.initState();
    streamData = SharedController.getDates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text(
            LocaleKeys.seatingList.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          elevation: 2,
        ),
        body: Column(children: <Widget>[
          StreamBuilder<List<DateModel>>(
              stream: streamData,
              builder: (context, snapshot1) {
                switch (snapshot1.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot1.hasError) {
                      return buildText('Something Went Wrong Try later');
                    } else {
                      final datemodel = snapshot1.data;
                      currentdateindex =
                          Utils().getCurrentDate(datemodel!, currentime, false);
                      if (datemodel.isEmpty) {
                        return buildText('No Data Found');
                      } else {
                        return Column(children: <Widget>[
                          Column(children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                setState(() {
                                                  if (index !=
                                                      datemodel.length - 1) {
                                                    index = index + 1;
                                                    choosendate =
                                                        datemodel[index].date!;
                                                  }
                                                });
                                              });
                                            },
                                            child: Icon(Icons.arrow_back_ios),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 5, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "${Utils.dayFormat.format(datemodel[index].date!).firstToUpper()} ",
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ]),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      Utils.dateFormat.format(
                                                          datemodel[index]
                                                              .date!),
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .only(top: 5),
                                                        child: Text(
                                                          LocaleKeys
                                                              .whereareyourcoworkers
                                                              .tr(),
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                if (index != 0) {
                                                  index = index - 1;
                                                  choosendate =
                                                      datemodel[index].date!;
                                                }
                                              });
                                            },
                                            child:
                                                Icon(Icons.arrow_forward_ios),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Search',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                              ),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              keyboardType: TextInputType.name,
                            ),
                          ),
                        ]);
                      }
                    }
                }
              }),
          ListItemCard(
              currentime: Utils.dateFormat.format(choosendate).toString())
        ]));
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}
