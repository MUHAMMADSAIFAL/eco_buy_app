import 'dart:io';

import 'package:eco_buy_app/eco_buy_app/screens/home_screen.dart';
import 'package:eco_buy_app/eco_buy_app/utils/colors.dart';
import 'package:eco_buy_app/eco_buy_app/utils/styles.dart';
import 'package:eco_buy_app/eco_buy_app/widgets/App_container.dart';
import 'package:eco_buy_app/eco_buy_app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

class Add extends StatefulWidget {
  static const String id = "add"; // Route ID for navigation

  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  // Variables for form fields
  String? selectedvalue;
  List<XFile> images = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Add Productes",
                    style: Ecostyle.bold,
                  ),
                ),
                DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return "Catigories Must be Selected";
                      } else {
                        return null;
                      }
                    },
                    value: selectedvalue,
                    items: catigories
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.toString(),
                            child: Text(
                              e.toString(),
                              // TextStyle(fontSize: 20, color: Appcolor.Appbar),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        value = selectedvalue;
                      });
                    }),
                AppButton(
                  color: Colors.blueAccent,
                  title: "Pick Image",
                  // tcolor: Appcolor.amber,
                  onpress: () {
                    pickimage();
                  },
                ),
                AppButton(
                  // color: Appcolor.amber,
                  title: "Upload Imges",
                  onpress: () {},
                ),
                AppContainer(
                  color: Appcolor.grey,
                  radius: 10,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10),
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Image.network(
                            File(images[index].path).path,
                            height: 100,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickimage() async {
    final List<XFile> Imagepick =
        await ImagePicker.platform.getMultiImageWithOptions();
    if (Imagepick != null) {
      setState(() {
        images.addAll(Imagepick);
      });
    } else {
      return Get.snackbar("Plz Select Image",
          "Dear Sir Pleace Select Image to Show on Screen  ",
          backgroundColor: Appcolor.blue);
    }
  }
}
