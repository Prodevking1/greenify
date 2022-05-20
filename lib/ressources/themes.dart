import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

/* Colors */
Color bgColor = HexColor("#F5F5F5");
Color darkOrange = const Color.fromRGBO(183, 65, 14, 1);
Color blackText = Colors.black;
Color whiteText = Colors.white;
Color greyText = const Color.fromRGBO(82, 82, 82, 1);
Color grey = const Color.fromRGBO(194, 194, 194, 1);
Color cardColor = const Color.fromRGBO(240, 240, 240, 1);

/* Fonts */

TextStyle heading2 = const TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
  fontFamily: 'Lato',
  color: Colors.black,
);

/* Icons */

Icon chevronLeft = const Icon(
  Icons.chevron_left,
  size: 20.0,
);
Icon phone = Icon(
  Icons.phone_outlined,
  size: 20.0,
  color: grey,
);
Icon lock = Icon(
  Icons.lock_clock_outlined,
  size: 20.0,
  color: grey,
);

Icon person = Icon(Icons.person_outlined, size: 20.0, color: grey);
Icon map = Icon(
  Icons.location_on_outlined,
  size: 20.0,
  color: grey,
);
Icon immatriculation = Icon(
  Icons.drive_eta_outlined,
  size: 20.0,
  color: grey,
);
Icon permis = Icon(
  Icons.assignment_ind_outlined,
  size: 20.0,
  color: grey,
);
Icon camera = Icon(
  Icons.camera_alt_outlined,
  size: 20.0,
  color: grey,
);
Icon mail = Icon(
  Icons.mail_outline,
  size: 20.0,
  color: grey,
);
Icon id = Icon(
  Icons.assignment_ind_outlined,
  size: 35.0,
  color: blackText,
);
Icon settings = Icon(
  Icons.settings_outlined,
  size: 32.0,
  color: blackText,
);
Icon x = Icon(
  Icons.close_outlined,
  size: 36.0,
  color: blackText,
);
Icon infos = Icon(
  Icons.help_outline_outlined,
  size: 36.0,
  color: blackText,
);
Icon chevonRight = Icon(
  Icons.chevron_right_outlined,
  size: 23.0,
  color: blackText,
);
Icon details = Icon(
  Icons.notes_outlined,
  size: 36.0,
  color: blackText,
);
Icon abonnement = Icon(
  Icons.description_outlined,
  size: 36.0,
  color: blackText,
);
Icon logout = Icon(
  Icons.logout,
  size: 36.0,
  color: blackText,
);
/* Widgets */

SizedBox space(height) {
  return SizedBox(height: height);
}

Column inputField(String text, Icon icon, [int? passwordField]) {
  return Column(
    children: <Widget>[
      Container(
        width: 325.0,
        height: 49.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(color: grey),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            hintText: text,
            hintStyle: heading2.copyWith(
                color: grey, fontSize: 15.0, fontWeight: FontWeight.w400),
            prefixIcon: icon,
          ),
          obscureText: passwordField == 1 ? true : false,
        ),
      ),
      space(10.0),
    ],
  );
}

Container button(context, String text, Color txtcolor, Color bgcolor,
    double size, routeName) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 53.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      border: Border.all(
        // ignore: unrelated_type_equality_checks
        color: bgcolor == 'whiteText' ? whiteText : darkOrange,
      ),
    ),
    child: Material(
      borderRadius: BorderRadius.circular(6.0),
      color: bgcolor,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => routeName)));
        },
        child: Center(
          child: Text(
            text,
            style: heading2.copyWith(color: txtcolor),
          ),
        ),
      ),
    ),
  );
}

//row card pour les settings
Column rowSetting(context, Widget prefixICon, String title, Widget routeNAme) {
  return Column(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.only(
          left: 30.0,
        ),
        width: 350.0,
        height: 59.0,
        child: Card(
          color: cardColor,
          child: Stack(
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => routeNAme)));
                  },
                  icon: prefixICon),
              Container(
                margin: const EdgeInsets.only(left: 50.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => routeNAme)));
                  },
                  child: Text(
                    title,
                    style: heading2.copyWith(
                        fontSize: 18.0,
                        color: blackText,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 310.0, top: 15.0),
                child: chevonRight,
              ),
            ],
          ),
        ),
      ),
      space(10.0),
    ],
  );
}
