import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';

Widget largeButton(
    {BuildContext? context,
    String? text,
    onPressed,
    btnColor,
    btnTextColor,
    borderCol}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: 54.0,
      width: MediaQuery.of(context!).size.width * 0.9,
      decoration: BoxDecoration(
        color: HexColor(btnColor ?? bgCol),
        border:
            Border.all(color: HexColor(borderCol ?? primaryColor), width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          text!,
          style: TextStyle(
            fontFamily: latoBold,
            fontSize: 20.0,
            color: HexColor(btnTextColor ?? bgCol),
          ),
        ),
      ),
    ),
  );
}

Widget topContent({BuildContext? context, String? header}) {
  return Row(
    children: [
      IconButton(
          onPressed: () {
            Navigator.pop(context!);
          },
          iconSize: 25,
          icon: const Icon(Icons.close)),
      SizedBox(
        width: MediaQuery.of(context!).size.height * 0.145,
      ),
      Text(header!,
          style: TextStyle(
              color: HexColor(textColor), fontFamily: latoBold, fontSize: 25))
    ],
  );
}

Widget backButton({BuildContext? context}) {
  return GestureDetector(
    onTap: () => Navigator.pop(context!),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: HexColor("#C2C2C2"), width: 1),
          shape: BoxShape.rectangle),
      child: Icon(
        Icons.chevron_left,
        size: 45,
        color: HexColor(textColor),
      ),
    ),
  );
}

Widget taxiDetailCard(
    {BuildContext? context,
    String? position,
    String? destination,
    String? taxiNumber,
    String? date}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), shape: BoxShape.rectangle),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const Image(
                  image: AssetImage("assets/images/route.png"), height: 70),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "from",
                        style: TextStyle(
                            fontFamily: latoBolder,
                            fontWeight: FontWeight.w800,
                            fontSize: 16),
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        width: MediaQuery.of(context!).size.width * 0.45,
                        child: Text(
                          position!,
                          maxLines: 2,
                          style: TextStyle(fontFamily: latoReg, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 200,
                    child: Divider(
                      thickness: 2,
                      color: Colors.red,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "to",
                        style: TextStyle(
                            fontFamily: latoBolder,
                            fontWeight: FontWeight.w800,
                            fontSize: 16),
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          destination!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(fontFamily: latoReg, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 200,
                    child: Divider(
                      thickness: 2,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    taxiNumber!,
                    style: TextStyle(
                        height: 1.5,
                        color: HexColor(textColor),
                        fontFamily: latoReg,
                        fontSize: 16),
                  ),
                  Text(
                    date!,
                    style: TextStyle(
                        height: 1.5,
                        color: HexColor(textColor),
                        fontFamily: latoBold,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Divider(
            color: HexColor(inputBorderAndIcon),
            thickness: 1,
          ),
        ],
      ),
    ),
  );
}

Widget settingsCard(
    {BuildContext? context, String? name, IconData? icon, onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: HexColor(grayBg),
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 40, color: HexColor(textColor)),
                    const SizedBox(width: 26),
                    Text(name!,
                        style: TextStyle(
                            color: HexColor(textColor),
                            fontFamily: latoReg,
                            fontSize: 18)),
                  ],
                ),
                IconButton(
                    onPressed: onPressed,
                    icon: const Icon(Icons.chevron_right_outlined),
                    iconSize: 30,
                    color: HexColor(textColor))
              ],
            )),
      ),
    ),
  );
}

void customScaffoldMessenger({String? text, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
    content: Text(
      text!,
      style: TextStyle(
        fontSize: 16,
        fontFamily: "Sofiamedium",
        color: HexColor(primaryColor),
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: HexColor(bgCol),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    duration: const Duration(seconds: 2),
  ));
}

void warningCustomScaffoldMessenger({String? text, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
    content: Text(
      text!,
      style: const TextStyle(
        fontSize: 16,
        fontFamily: "Sofiamedium",
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    duration: const Duration(seconds: 2),
  ));
}

abonnementWidget({
  String? date,
  String? amount,
  String? text,
}) {
  return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text("$date",
                style: TextStyle(
                    color: HexColor(textColor),
                    fontFamily: latoReg,
                    fontSize: 16)),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "$text",
              style: TextStyle(
                  fontFamily: latoBold,
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                  color: HexColor("#4A4A4A")),
            ),
            Text("$amount F CFA",
                style: TextStyle(
                    color: HexColor(textColor),
                    fontFamily: latoReg,
                    fontSize: 16)),
          ]),
        ],
      ));
}
