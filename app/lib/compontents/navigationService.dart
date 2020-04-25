import 'package:flutter/cupertino.dart';

NavigationService navigationService = NavigationService();

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey;
  NavigationService(){
    navigatorKey = GlobalKey<NavigatorState>();
  }
  Future<T> navigaTo<T>(Route<T> route){
    return navigatorKey.currentState.push<T>(route);
  }
  void goBack(){
    return navigatorKey.currentState.pop();
  }
  Future cNavigaTo(Widget controll){
    return navigationService.navigaTo(CupertinoPageRoute(builder: (context) => controll));
  }
}