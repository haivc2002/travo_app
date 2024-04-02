import 'package:flutter/cupertino.dart';
import 'package:travo_app/ui/home_screen/home_screen.dart';
import 'package:travo_app/ui/hotel_booking/hotel_booking.dart';
import 'package:travo_app/ui/hotel_booking/select_date_screen.dart';
import 'package:travo_app/ui/hotels_screen/hotels_screen.dart';

import 'auth/register_screen.dart';
import 'hotel_booking/guest_and_room.dart';
import 'hotel_booking/search_destination.dart';

  class AppRouter {
    // static final Map<String, WidgetBuilder> routes = {
    //   RegisterScreen.routeName: (context) => const RegisterScreen(),
    //   HomeScreen.routeName: (context) => const HomeScreen(),
    // };

    static Route<dynamic>? generateRoute(RouteSettings settings) {
      switch (settings.name) {
        case RegisterScreen.routeName:
          return CupertinoPageRoute(
            settings: settings,
            builder: (_) => const RegisterScreen()
          );

        case HomeScreen.routeName:
          return CupertinoPageRoute(builder: (_) => const HomeScreen());

        case GuestAndRoom.routeName:
          return CupertinoPageRoute(builder: (_) => const GuestAndRoom());

        case SelectDateScreen.routeName:
          return CupertinoPageRoute(builder: (_) => const SelectDateScreen());

        case SearchDestination.routeName:
          return CupertinoPageRoute(builder: (_) => const SearchDestination());

        case HotelsScreen.routeName:
          return CupertinoPageRoute(builder: (_) => const HotelsScreen());

        case HotelBooking.routeName:
          return CupertinoPageRoute(builder: (_) => const HotelBooking());
        default:
          return null;
      }
    }
  }