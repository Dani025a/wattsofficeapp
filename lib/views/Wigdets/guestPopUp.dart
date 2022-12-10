// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final guestsController = TextEditingController();

Future<void> GuestPopUp(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Antal gæster'),
          content: TextFormField(
            textInputAction: TextInputAction.done,
            autofocus: true,
            obscureText: false,
            maxLength: 3,
            controller: guestsController,
            decoration: InputDecoration(
              labelText: "Antal gæster",
              alignLabelWithHint: true,
              counterStyle: TextStyle(
                height: double.minPositive,
              ),
              counterText: "",
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
            keyboardType: TextInputType.number,
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
                    "Tilføj",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ])
          ],
        );
      });
}
