import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

void main() async{
  await AppUtil.createFolderInAppDocDir('DOSYA');
}
class AppUtil{

  static Future<String>? createFolderInAppDocDir(String folderName) async {

    //Get this App Document Directory
    Directory _appDocDir;
    _appDocDir = await getApplicationDocumentsDirectory();

    //App Document Directory + folder name

    final Directory _appDocDirFolder = Directory('${_appDocDir.path}/$folderName/');

    if(await _appDocDirFolder.exists()){ //if folder already exists return path
      return _appDocDirFolder.path;
    }else{//if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder=await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }

}
