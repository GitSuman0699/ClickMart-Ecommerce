import 'package:firebase_project/cart/cart.dart';
import 'package:firebase_project/catalogue/catalogue.dart';
import 'package:firebase_project/CheckOut/check_out.dart';
import 'package:firebase_project/Favorite/favorite.dart';
import 'package:firebase_project/Filter/filter.dart';
import 'package:firebase_project/Items/items.dart';
import 'package:firebase_project/Main/main.dart';
import 'package:firebase_project/Notifications/notifications.dart';
import 'package:firebase_project/Orders/order.dart';
import 'package:firebase_project/PrivacyPolicy/privacy_policy.dart';
import 'package:firebase_project/Product/product.dart';
import 'package:firebase_project/Profile/profile.dart';
import 'package:firebase_project/Settings/settings.dart';
import 'package:firebase_project/ShippingAddress/shipping_address.dart';
import 'package:firebase_project/SignUp/sign_up.dart';
import 'package:firebase_project/home/home_screen.dart';
import 'package:firebase_project/login/phone_screen.dart';
import 'package:firebase_project/login/verification_screen.dart';
import 'package:firebase_project/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppRoutes {
  static Map<String, Widget Function(dynamic)> appRoutes = {
    '/': (_) => const OnBoarding(),
    Login.routeName: (_) => const Login(),
    Verification.routeName: (_) => const Verification(),
    HomeScreen.routeName: (_) => const HomeScreen(),
    Main.routeName: (_) => const Main(),
    Catalogue.routeName: (_) => const Catalogue(),
    Items.routeName: (_) => const Items(),
    Filter.routeName: (_) => const Filter(),
    Product.routeName: (_) => Product(),
    Favorite.routeName: (_) => const Favorite(),
    Profile.routeName: (_) => const Profile(),
    Cart.routeName: (_) => const Cart(),
    CheckOut.routeName: (_) => const CheckOut(),
    SignUp.routeName: (_) => const SignUp(),
    Settings.routeName: (_) => const Settings(),
    Orders.routeName: (_) => const Orders(),
    PrivacyPolicy.routeName: (_) => const PrivacyPolicy(),
    OnBoarding.routeName: (_) => const OnBoarding(),
    NotificationScreen.routeName: (_) => const NotificationScreen(),
    ShippingAddress.routeName: (_) => const ShippingAddress(),
  };

  static setSystemStyling() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light,
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }

  static const privacyPolicyTxt =
      'Give your E-Commerce app an outstanding look.It\'s a small but attractive and beautiful design template for your E-Commerce App.Contact us for more amazing and outstanding designs for your apps.Do share this app with your Friends and rate us if you like this.Also check your other apps';
}
