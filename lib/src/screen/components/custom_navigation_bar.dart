// ignore_for_file: implementation_imports, prefer_typing_uninitialized_variables, unused_field, avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:patico_dev/src/screen/navigation_screens/explore/explore_screen.dart';
import 'package:patico_dev/src/screen/navigation_screens/friends/friends_screen.dart';
import 'package:patico_dev/src/screen/navigation_screens/home/home_screen.dart';
import 'package:patico_dev/src/screen/navigation_screens/profile/profile_screen.dart';
import 'package:provider/src/provider.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    Key? key,
    this.currentState,
  }) : super(key: key);

  final int? currentState;

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with WidgetsBindingObserver {
  bool page0Active = false;
  bool page1Active = false;
  bool page2Active = true;
  bool page3Active = false;
  bool page4Active = false;
  int backValuePage = 2;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        onTap: (crntValue) {
          print(crntValue);
          if (backValuePage == crntValue) {
            switch (crntValue) {
              case 0:
                break;
              case 1:
                break;
              case 2:
                break;
              case 3:
                break;
              case 4:
                break;
              default:
            }
          } else {
            switch (crntValue) {
              case 0:
                backValuePage = crntValue;
                page0Active = true;
                page1Active = false;
                page2Active = false;
                page3Active = false;
                page4Active = false;
                break;
              case 1:
                backValuePage = crntValue;
                page0Active = false;
                page1Active = true;
                page2Active = false;
                page3Active = false;
                page4Active = false;
                break;
              case 2:
                backValuePage = crntValue;
                page0Active = false;
                page1Active = false;
                page2Active = true;
                page3Active = false;
                page4Active = false;
                break;
              case 3:
                backValuePage = crntValue;
                page0Active = false;
                page1Active = false;
                page2Active = false;
                page3Active = true;
                page4Active = false;
                break;
              case 4:
                backValuePage = crntValue;
                page0Active = false;
                page1Active = false;
                page2Active = false;
                page3Active = false;
                page4Active = true;
                break;
              default:
            }
          }

         
          if (crntValue == widget.currentState) {
            print('uy aha');
          }
        },
       // backgroundColor: ColorConstant.milkColor,
        currentIndex: widget.currentState ?? 0,
        items: [
       
            BottomNavigationBarItem(
            icon: Image.asset("assets/images/bottom_homebutton.png"),
            activeIcon: Image.asset("assets/images/bottom_homebutton_act.png"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/bottom_search.png"),
            activeIcon: Image.asset("assets/images/bottom_search_act.png"),
          ),
           BottomNavigationBarItem(
            icon: Image.asset("assets/images/bottom_timeline.png"),
            activeIcon: Image.asset("assets/images/bottom_timeline_act.png"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/bottom_chat.png"),
            activeIcon: Image.asset("assets/images/bottom_chat_act.png"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/bottom_profile.png"),
            activeIcon: Image.asset("assets/images/bottom_profile_act.png"),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (BuildContext context) {
              return FutureBuilder(
                //    future: getDisplayData(user.uid),

                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                        return const CupertinoActivityIndicator();
                 

                    default:
                      if (snapshot.hasError) {
                        return const Text("Error");
                      } else {
                    
                        return HomeScreen();
                      }
                  }
                },
              );
            });

          case 1:
            return CupertinoTabView(builder: (BuildContext context) {
              return FutureBuilder(
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      //  return const CupertinoActivityIndicator();
                      return ExploreScreen();

                    default:
                      if (snapshot.hasError) {
                        return const Text("Error");
                      } else {
                        return ExploreScreen();
                      }
                  }
                },
              );
            });
          case 2:
            return CupertinoTabView(builder: (BuildContext context) {
              return Container();
            });

          case 3:
            return CupertinoTabView(builder: (BuildContext context) {
              return FutureBuilder(
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CupertinoActivityIndicator();

                    default:
                      if (snapshot.hasError) {
                        return const Text("Error");
                      } else {
                        return FriendsScreen();
                      }
                  }
                },
              );
            });

          case 4:
            return CupertinoTabView(builder: (BuildContext context) {
              return FutureBuilder(
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      // return const CupertinoActivityIndicator();
                      return ProfileScreen();

                    default:
                      if (snapshot.hasError) {
                        return const Text("Error");
                      } else {
                        return ProfileScreen();
                      }
                  }
                },
              );
            });
        }

        return CupertinoTabView(builder: (BuildContext context) {
          return FutureBuilder(
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const CupertinoActivityIndicator();
                // return HomePage(
                //   userAll: userAll,
                //   );

                default:
                  if (snapshot.hasError) {
                    return const Text("Error");
                  } else {
                    return HomeScreen();
                  }
              }
            },
          );
        });
      },
    );
  }
}
