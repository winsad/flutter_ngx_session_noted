import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/model/user.dart';
import 'package:flutter_event_navigation/screens/user_detail/user_detail_page.dart';
import 'package:flutter_event_navigation/screens/user_listing/user_listing_page.dart';

Map<String, WidgetBuilder> appRoutes = {
  RouteName.home: (context) => UserListingPage(),
  RouteName.details: (context) {
    final user = ModalRoute.of(context)?.settings.arguments as User?;
    return UserDetailPage(user: user);
  },
};

class RouteName {
  static const String home = '/';
  static const String details = 'details';
}
