import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:patico_dev/src/screen/components/custom_navigation_bar.dart';
import 'package:patico_dev/src/screen/start/start_screen.dart';

class RouterSystem {
  static Route<dynamic> generateRoute(RouteSettings settings, [User? user,]) {
    switch (settings.name) {
      case startScreen:
        return CupertinoPageRoute(builder: (_) => const StartScreen());
      case navigationBar:
        return CupertinoPageRoute(builder: (_) =>  const CustomNavigationBar());
    /*  case chatInteriorPage:
        return CupertinoPageRoute(builder: (_) => const ChatInteriorPage());
        case chaosChatInteriorPage:
        return CupertinoPageRoute(builder: (_) => const ChaosChatInteriorPage());
      case groupSettingsPage:
        return CupertinoPageRoute(builder: (_) => const GroupSettingsPage());
      case settingsPage:
        return CupertinoPageRoute(builder: (_) => const SettingsPage());
     
      case splashPage:
        return CupertinoPageRoute(builder: (_) => const SplashPage());
*/
      default:
        return CupertinoPageRoute(
            builder: (_) => const CupertinoPageScaffold(
                backgroundColor: CupertinoColors.systemRed,
                child: Text("Error")));
    }
  }
}

const String startScreen = '/StartScreen';
const String navigationBar = '/NavigationBar';
