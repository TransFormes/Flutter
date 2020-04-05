import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileProviderPage extends StatefulWidget {
  // final InfoStorage storage;
  @override
  _FileProviderPageState createState() => _FileProviderPageState();
}

class _FileProviderPageState extends State<FileProviderPage> {
  final TextEditingController textEditingController = TextEditingController();
  String _info;
  @override
  void initState() { 
    super.initState();
    
  }
  Future<File> _saveInfo() async{
    setState(() {
      _info = textEditingController.text;
    });
    // return widget.storage.w
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
      ],
    );
  }
}