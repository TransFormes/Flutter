import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StringUtil{
  isChinese(String str){
    RegExp reg = RegExp(r'[\u4e00-\u9fa5]');
    return reg.allMatches(str);
  }
  bool isMaxLength(String str, int maxNumber){
    return str.length > maxNumber;
  }
}

void toast(String str){
  Fluttertoast.showToast(
    msg: str,
    timeInSecForIosWeb: 3,
    gravity: ToastGravity.CENTER
  );
}
// 
void showModal(context, String content, Function confirmCallback){
  showDialog(
    context: context,
    builder:(context){
      return AlertDialog(
        title: Text('温馨提示'),
        content: Text(content),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              confirmCallback();
              Navigator.of(context).pop();
            }, 
            child: Text('确定')
          ),
          FlatButton(
            onPressed: (){
              Navigator.of(context).pop();
            }, 
            child: Text('取消')
          )
        ],
      );
    }
  );
}

String formTime(int second){
  double day = second / 86400;
  double hour = (second % 86400) / 3600;
  double minute = ((second % 86400) / 3600) / 60;
  double seconds = ((second % 86400) / 3600) % 60;
  final days = day.floor();
  final hours = hour.floor();
  final minutes = minute.floor();
  final secondss = seconds.floor();
  String duration = '';
  if(days > 0){
    duration = '${days}天${hours}:${minutes}:${secondss}';
  } else if(hours > 0){
    duration = '${hours}:${minutes}:${secondss}';
  } else if(minutes > 0){
    duration = '0:${minutes}:${secondss}';
  }else{
    duration = '0: 0:${secondss}';
  }
  return duration;
}