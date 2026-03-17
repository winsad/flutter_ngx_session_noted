import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/screens/books/book_details.dart';
import 'package:flutter_event_navigation/screens/books/book_listing.dart';
import 'package:flutter_event_navigation/screens/books/book_model.dart';
import 'package:flutter_event_navigation/screens/counter/counter_page.dart';
import 'package:flutter_event_navigation/screens/details/detail_screen.dart';
import 'package:flutter_event_navigation/screens/home/home_screen.dart';
import 'package:flutter_event_navigation/screens/layout/layout_page.dart';
import 'package:flutter_event_navigation/screens/settings/setting_screen.dart';
import 'package:flutter_event_navigation/screens/user_model.dart';

Map<String, WidgetBuilder> appRoutes = {
  RouteName.home: (context) => HomeScreen(),
  RouteName.detail: (context) {
    final user = ModalRoute.of(context)?.settings.arguments as UserModel?;
    return DetailScreen(user: user!);
  },
  RouteName.setting: (context) => SettingScreen(
    user: UserModel(age: 30, name: 'John', sex: 'M'),
  ),
  RouteName.bookListing: (context) => BookListing(),
  RouteName.bookDetails: (context) {
    final book = ModalRoute.of(context)?.settings.arguments as Book?;
    return BookDetails(book: book!);
  },
  RouteName.layoutPage: (context) => LayoutPage(),
  RouteName.counter: (context) => CounterPage(),
};

class RouteName {
  static const String home = '/';
  static const String detail = 'detail-screen';
  static const String setting = 'setting-screen';
  static const String bookListing = 'book-listing';
  static const String bookDetails = 'book-details';
  static const String layoutPage = 'layout-page';

  static const String counter = '/counter-page';
}
