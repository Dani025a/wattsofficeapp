// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';
import 'package:wattsofficeapp/models/seatingAndFoodPlanModel.dart';


class ListItemCard extends StatefulWidget {
  final List<SeatingAndFoodPlanModel> data;
  const ListItemCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<ListItemCard> createState() => _ListItemCardState();
}

class _ListItemCardState extends State<ListItemCard> {
  late List<SeatingAndFoodPlanModel> users = widget.data;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: LocaleKeys.search.tr(),
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
            onChanged: searchUser,
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: users.length,
          itemBuilder: ((context, index) {
            final item = users[index];
            return Card(
              color: Color(0xFFF5F5F5),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                              child: SelectionArea(
                                  child: Text(
                                '${LocaleKeys.name.tr()}: ${item.firstName} ${item.lastName}',
                              )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (item.whereAreYou == 0) ...[
                              Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Text(LocaleKeys.atOffice.tr(),
                                      style: TextStyle(color: Colors.green)))
                            ] else if (item.whereAreYou == 1) ...[
                              Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 20, 0),
                                  child: Text(LocaleKeys.atHome.tr(),
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 230, 208, 1)))),
                            ] else if (item.whereAreYou == 2) ...[
                              Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Text(LocaleKeys.sickOrVacation.tr(),
                                      style: TextStyle(color: Colors.red)))
                            ]
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ))
      ],
    );
  }

  void searchUser(String query) {
    final suggestions = widget.data.where((item) {
      final firstName =
          "${item.firstName!.toLowerCase()} ${item.lastName!.toLowerCase()}";
      final input = query.toLowerCase();
      return firstName.contains(input);
    }).toList();

    setState(() => users = suggestions);
  }
}
