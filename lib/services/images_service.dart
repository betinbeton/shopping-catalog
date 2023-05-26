import 'dart:collection';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ImageService extends ChangeNotifier {
  // final List<Map<String, dynamic>> imgs = [];
  String urlDefaultImg = '';
  bool isLoading = false;
  HashMap mapImgs = HashMap<String, List<Map<String, dynamic>>>();

  ImageService() {
    loadImages();
  }

// This function is called when the app launches for the first time or when an image is uploaded or deleted
  Future<List<Map<String, dynamic>>> loadImages() async {
    _cleanImgs();
    this.isLoading = true;
    notifyListeners();
    FirebaseStorage storage = FirebaseStorage.instance;
    final List<Map<String, dynamic>> imgs = [];
    //*Get all the folders names
    List<String> folders = await listFolders();
    //*Iterate all the folders to get the imgs and put that in a hash table
    for (var folder in folders) {
      // final ListResult result = await storage.ref('catalogoVerano2023/').list();
      //*Get the result of the storage
      final ListResult result = await storage.ref().child('catalogoVerano2023/$folder').list();
      final List<Reference> allFiles = result.items;

      await Future.forEach<Reference>(allFiles, (file) async {
        final String fileUrl = await file.getDownloadURL();
        //*Add the img to a list
        imgs.add(
          {
            "url": fileUrl,
            "path": file.fullPath,
            "name": file.name,
          },
        );
      });
      if (imgs.isNotEmpty) {
        mapImgs[folder] = List<Map<String, dynamic>>.from(imgs);
        imgs.clear();
      }
      //Add to the Hasttable imgs

    }

    // Loading default img
    final urlImg = await FirebaseStorage.instance.ref().child('default/Image_not_available.png').getDownloadURL();
    urlDefaultImg = urlImg.toString();
    urlDefaultImg = urlImg;

    this.isLoading = false;
    notifyListeners();
    return imgs;
  }

  //O n to get the listname of the folders
  Future<List<String>> listFolders() async {
    List<String> folders = [];

    FirebaseStorage storage = FirebaseStorage.instance;
    final ListResult result = await storage.ref().child('catalogoVerano2023/').listAll();

    final List<Reference> allFolders = result.prefixes;

    await Future.forEach<Reference>(allFolders, (folder) async {
      final String folderName = folder.name;
      folders.add(folderName);
    });
    return folders;
  }

  // Future<String> loadDefaultImg() async {
  //   // FirebaseStorage storage = FirebaseStorage.instance;
  //   final urlImg = await FirebaseStorage.instance.ref().child('default/logoDorado.png').getDownloadURL();
  //   print(urlImg);
  //   return 'storageRef.';
  // }

  //TODO hacer un metodo para obtener una imagen por default

  List<String> filterImage(String filtro) {
    final List<String> imgFiltered = [];
    if (mapImgs.containsKey(filtro)) {
      for (var img in mapImgs[filtro]) {
        imgFiltered.add(img['url']);
      }
      // imgFiltered.sort();
    } else {
      imgFiltered.add(urlDefaultImg);
    }

    // for (var img in imgs) {
    //   //Aqui estoy tomando el nombre, si es 2.png, tomo 2 y esto lo tendria que agrear
    //   final temp = img['name'].toString().split('-')[0];
    //   final firstCharacter = temp[0];
    //   //TODO validar que el numero empieze igual que el que nos pasan en el filtro
    //   if (firstCharacter == filtro) {
    //     imgFiltered.add(img['url']);
    //   }
    // }
    //If there is no im in the list
    // if (imgFiltered.isEmpty) {
    //   imgFiltered.add(urlDefaultImg);
    // }

    return imgFiltered;
  }

  void _cleanImgs() {
    this.mapImgs.clear();
  }

  // void _cleanImgFiltered() {
  //   this.imgFiltered.clear();
  // }
}
