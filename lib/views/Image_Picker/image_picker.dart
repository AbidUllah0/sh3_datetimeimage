import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerClass extends StatefulWidget {
  @override
  State<ImagePickerClass> createState() => _ImagePickerClassState();
}

class _ImagePickerClassState extends State<ImagePickerClass> {
  File? _image;

  Future<void> chooseImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    } else {
      final tempImage = File(image.path);
      setState(() {
        _image = tempImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 300,
              child: _image != null
                  ? Image.file(
                      _image!,
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/my.png'),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  chooseImage(ImageSource.gallery);
                },
                child: Text('Image From Gallery'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.yellowAccent,
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  chooseImage(ImageSource.camera);
                },
                child: Text('Image From Camera'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.yellowAccent,
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
