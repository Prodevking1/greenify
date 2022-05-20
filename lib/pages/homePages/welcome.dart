import 'package:flutter/material.dart';
import 'package:greenify_app/constants/colors.dart';
import 'package:greenify_app/pages/homePages/detection.dart';
import 'package:greenify_app/ressources/reuseableWidgets.dart';
import 'package:greenify_app/ressources/themes.dart';
import 'package:hexcolor/hexcolor.dart';

class Welcome extends StatefulWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: [
            space(size.height / 3.0),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetectionHome(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 137, 209, 139),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                      leading: Icon(Icons.person),
                      title: Center(
                        child: Text(
                          'Agriculteur',
                          style: heading2.copyWith(color: Colors.white),
                        ),
                      )),
                ),
              ),
            ),
            space(20.0),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetectionHome(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 137, 209, 139),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                      leading: Icon(Icons.person),
                      title: Center(
                        child: Text(
                          'Jardinier',
                          style: heading2.copyWith(color: Colors.white),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ));
  }
}
