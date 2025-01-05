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
    return navigatiorKey.currentState!.pushReplacementNamed(_routeName, );
  }
}