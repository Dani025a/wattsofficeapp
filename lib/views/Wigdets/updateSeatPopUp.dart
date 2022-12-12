// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:wattsofficeapp/Controllers/sharedController.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> UpdateSeatPopUp(
    BuildContext context, String date, int seatNumber) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Vil du ændre siddeplads?'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //position
            mainAxisSize: MainAxisSize.min,
            // wrap content in flutter
            children: <Widget>[
              Column(
                children: [
                  Text(
                    "Du er i gang med at ændre din siddeplads, er du sikker på at du vil ændre?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              )
            ],
          ),
          actions: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              MaterialButton(
                  height: 40,
                  minWidth: 100,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8)),
                  color: Colors.red,
                  child: Text(
                    "Annuller",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              MaterialButton(
                  height: 40,
                  minWidth: 100,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8)),
                  color: Colors.green,
                  child: Text(
                    "Ændre",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  onPressed: () {
                    SharedController().addSeat(
                      date,
                      seatNumber,
                    );
                    Navigator.pop(context);
                  })
            ])
          ],
        );
      });
}
