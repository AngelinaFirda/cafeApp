import 'package:flutter/material.dart';
import 'package:wikusama_cafe/screens/admin/admin_home_page.dart';
import 'package:wikusama_cafe/screens/customer/customer_home_page.dart';
import 'package:wikusama_cafe/screens/manager/manager_home_page.dart';

class Routes {
  static const String customerHome = '/customerHome';
  static const String managerHome = '/managerHome';
  static const String adminHome = '/adminHome';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case customerHome:
        return MaterialPageRoute(builder: (_) => CustomerHomePage());
      case managerHome:
        return MaterialPageRoute(builder: (_) => ManagerHomePage());
      case adminHome:
        return MaterialPageRoute(builder: (_) => const AdminHomePage());
      default:
        return MaterialPageRoute(builder: (_) => CustomerHomePage());
    }
  }
}
