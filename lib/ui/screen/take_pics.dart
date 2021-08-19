// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';

// class TakePictures extends StatefulWidget {
//   const TakePictures({Key key}) : super(key: key);

//   @override
//   _TakePicturesState createState() => _TakePicturesState();
// }

// class _TakePicturesState extends State<TakePictures> {
//   File _storedImage;
//   File tmpFile = File(pickedFile.path);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }

//   void _takePicture(ImageSource source) async {
   

//     // 2. Use the new method.
//     //
//     // getImage now returns a PickedFile instead of a File (form dart:io)
//     final File pickedImage = await ImagePicker().getImage(source: source);

//     // 3. Check if an image has been picked or take with the camera.
//     if (pickedImage == null) {
//       return;
//     }

//     // 4. Create a File from PickedFile so you can save the file locally
//     // This is a new/additional step.

//     // 5. Get the path to the apps directory so we can save the file to it.
//     final path = await getApplicationDocumentsDirectory();
//     final File newImage = await pickedImage.copy('$path/image1.png');

//     // 6. Save the file by copying it to the new location on the device.
//     tmpFile = await tmpFile.copy('$path/$fileName$fileExtension');

//     // 7. Optionally, if you want to display the taken picture we need to update the state
//     // Note: Copying and awaiting the file needs to be done outside the setState function.
//     setState(() => _storedImage = tmpFile);
//   }
// }
