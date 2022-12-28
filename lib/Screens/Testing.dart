// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// class Testing extends StatefulWidget {
//   const Testing({Key? key}) : super(key: key);
//
//   @override
//   State<Testing> createState() => _TestingState();
// }
//
// class _TestingState extends State<Testing> {
//
//   final ImagePicker imgpicker = ImagePicker();
//   List<PickedFile> imageList = [];
//
//   addImage(PickedFile _image){
//     setState(() {
//       imageList.add(_image);
//     });
//   }
//
//   List<String> selectedImageList = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//       ),
//       body: Column(
//         children: <Widget>[
//           MaterialButton(
//             child: Text("Add Image:  ${imageList.length}"),
//             onPressed: () async {
//               var _image =
//               await ImagePicker.platform.pickImage(source: ImageSource.camera);
//               print(_image!.path);
//               addImage(_image);
//             },
//           ),
//           Expanded(
//             child: ListView.builder(
//                 itemCount: imageList.length,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                       onTap: () {
//                         //return null;
//                         if(selectedImageList.contains(imageList[index].path)){
//                           setState((){
//                             selectedImageList.remove(imageList[index].path);
//                           });
//                           print("selected removed ${selectedImageList.length}");
//                         }else{
//                           setState(() {
//                             selectedImageList.add(imageList[index].path);
//                           });
//                           print("selected add ${selectedImageList.length}");
//                         }
//                       },
//                       child: Padding(
//                         padding:  EdgeInsets.only(left: 14,right: 14),
//                         child: Row(
//                           children: [
//                             Container(
//                               height:50,
//                               width: 20,
//                               alignment: Alignment.center,
//                               padding: EdgeInsets.all(5),
//                               decoration:BoxDecoration(
//                                border: Border.all(
//                                  color: Colors.black
//                                ),
//                                 borderRadius: BorderRadius.circular(3)
//                               ),
//                               child: Center(child: Icon(Icons.check))
//                             ),
//                             Card(
//                               child: Container(
//                                 height: 150,
//                                 width: 200,
//                                 child: Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                   child: Image.file(File(imageList[index].path),fit: BoxFit.fill,)
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ));
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {

  final ImagePicker imgpicker = ImagePicker();
  List<PickedFile> imageList = [];

  addImage(PickedFile _image){
    setState(() {
      imageList.add(_image);
    });
  }

  List<String> selectedImageList = [];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: <Widget>[
          MaterialButton(
            child: Text("Add Image:  ${imageList.length}"),
            onPressed: () async {
              var _image =
              await ImagePicker.platform.pickImage(source: ImageSource.camera);
              print(_image!.path);
              addImage(_image);
            },
          ),
          Expanded(
            child: ListView.builder(
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        //return null;
                        if(selectedImageList.contains(imageList[index].path)){
                          setState((){
                            selectedImageList.remove(imageList[index].path);
                          });
                          print("selected removed ${selectedImageList.length}");
                        }else{
                          setState(() {
                            selectedImageList.add(imageList[index].path);
                          });
                          print("selected add ${selectedImageList.length}");
                        }
                      },
                      child: Padding(
                        padding:  EdgeInsets.only(left: 14,right: 14),
                        child: Row(
                          children: [
                            Container(
                                height:25,
                                width: 25,
                                alignment: Alignment.center,
                                //padding: EdgeInsets.all(5),
                                decoration:BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black
                                    ),
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child:  selectedImageList.contains(imageList[index].path) ? Center(child: Icon(Icons.check)) : Container()
                            ),
                            Card(
                              child: Container(
                                height: 150,
                                width: 200,
                                child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.file(File(imageList[index].path),fit: BoxFit.fill,)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}

