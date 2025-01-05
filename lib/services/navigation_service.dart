import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationService {

  late GlobalKey<NavigatorState> navigatiorKey;

  static NavigationService instance = NavigationService();

  NavigationService(){
    navigatiorKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateToReplacement(String _routeName) {
    return navigatiorKey.currentState!.pushReplacementNamed(_routeName, );
  }

  Future<dynamic> navigateTo(String _routeName) {
    return navigatiorKey.currentState!.pushNamed(_routeName, );
  }

  Future<dynamic> navigateToRoute(MaterialPageRoute _route) {
    return navigatiorKey.currentState!.push(_route, );
  }

  // bool goBack() {
  //   return navigatiorKey.currentState!.pop();
  // }

  bool goBack() {
  if (navigatiorKey.currentState!.canPop()) {
    navigatiorKey.currentState!.pop();
    return true;  // Successfully popped
  }
  return false;  // No route to pop
}
}