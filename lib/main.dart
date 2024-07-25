import 'package:advjokeapp/provider/Favouriteprovider.dart';
import 'package:advjokeapp/views/Favourite_Page.dart';
import 'package:advjokeapp/views/HomePage.dart';
import 'package:advjokeapp/views/Splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplashScreen(),
          "homepage": (context) => HomePage(),
          "favouritePage": (context) => FavouritePage(),
        },
      ),
    ),
  );
}
