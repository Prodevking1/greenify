import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greenify_app/constants/colors.dart';
import 'package:greenify_app/ressources/themes.dart';
import 'package:greenify_app/services/detector.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class DetectionHome extends StatefulWidget {
  DetectionHome({Key? key}) : super(key: key);

  @override
  State<DetectionHome> createState() => _DetectionHomeState();
}

XFile? image;
File? _image;

class _DetectionHomeState extends State<DetectionHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              space(size.height / 1.3),
              InkWell(
                  child: Container(
                margin: EdgeInsets.only(left: size.width / 3.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: HexColor(primaryColor),
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2.0,
                    color: Colors.black,
                  ),
                ),
                child: IconButton(
                    onPressed: handlePhoto,
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 40.0,
                    )),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> handlePhoto() async {
    try {
      image = await ImagePicker()
          .pickImage(source: ImageSource.camera, maxHeight: 675, maxWidth: 960);
      if (image != null) {
        setState(() {
          _image = File(image!.path);
        });
        List<int> imageByte = _image!.readAsBytesSync();
        String base64Image = base64Encode(imageByte);
        print("this is the base64 image: " + base64Image.toString());
        var response =
            await getDiseases(img64: "data:image/png;base64" + base64Image);
        if (response["error"] == false) {
          print("this is the response ${json.decode(response["data"])["url"]}");
        }
      }
    } catch (err) {
      return;
    }
  }
}
