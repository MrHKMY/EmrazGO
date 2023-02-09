import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/activity_screen.dart';
import 'package:flutter_application_1/screens/dashboard.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/packages_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_application_1/screens/waktuSolat_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProvidedStylesExample extends StatefulWidget {
  ProvidedStylesExample({Key? key, required this.menuScreenContext})
      : super(key: key);
  BuildContext menuScreenContext;

  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  PersistentTabController _controller = PersistentTabController();
  bool _hideNavBar = true;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() => [
        DashboardScreen(
            // menuScreenContext: widget.menuScreenContext,
            // hideStatus: _hideNavBar,
            // onScreenHideButtonPressed: () {
            //   setState(() {
            //     _hideNavBar = !_hideNavBar;
            //   });
            // },
            ),
        WaktuSolatScreen(),
        ActivityScreen(),
        LoginScreen(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: "Home",
            activeColorPrimary: Colors.white,
            activeColorSecondary: Colors.black,
            inactiveColorPrimary: Colors.white,
            inactiveColorSecondary: Colors.purple),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.book),
          title: "Prayer",
          activeColorPrimary: Colors.white,
          activeColorSecondary: Colors.black,
          inactiveColorPrimary: Colors.white,
          inactiveColorSecondary: Colors.purple,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              //"/first": (final context) => const MainScreen2(),
              //"/second": (final context) => const MainScreen3(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.list),
          title: "Activity",
          activeColorPrimary: Colors.white,
          activeColorSecondary: Colors.black,
          inactiveColorPrimary: Colors.white,
          inactiveColorSecondary: Colors.purple,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              //"/first": (final context) => const MainScreen2(),
              //"/second": (final context) => const MainScreen3(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          title: "Settings",
          activeColorPrimary: Colors.white,
          activeColorSecondary: Colors.black,
          inactiveColorPrimary: Colors.white,
          inactiveColorSecondary: Colors.purple,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              //"/first": (final context) => const MainScreen2(),
              //"/second": (final context) => const MainScreen3(),
            },
          ),
        ),
        // PersistentBottomNavBarItem(
        //   icon: const Icon(Icons.message),
        //   title: "Messages",
        //   activeColorPrimary: Colors.deepOrange,
        //   inactiveColorPrimary: Colors.grey,
        //   routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //     initialRoute: "/",
        //     routes: {
        //       //"/first": (final context) => const MainScreen2(),
        //       //"/second": (final context) => const MainScreen3(),
        //     },
        //   ),
        // ),
        // PersistentBottomNavBarItem(
        //   icon: const Icon(Icons.settings),
        //   title: "Settings",
        //   activeColorPrimary: Colors.indigo,
        //   inactiveColorPrimary: Colors.grey,
        //   routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //     initialRoute: "/",
        //     routes: {
        //       //"/first": (final context) => const MainScreen2(),
        //       //"/second": (final context) => const MainScreen3(),
        //     },
        //   ),
        // ),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
          // onWillPop: (final context) async {
          //   await showDialog(
          //     context: this,
          //     useSafeArea: true,
          //     builder: (final context) => Container(
          //       height: 50,
          //       width: 50,
          //       color: Colors.white,
          //       child: ElevatedButton(
          //         child: const Text("Close"),
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //       ),
          //     ),
          //   );
          //   return false;
          // },
          selectedTabScreenContext: (context) {
            context = context;
          },
          backgroundColor: Colors.blue,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle: NavBarStyle
              .style10, // Choose the nav bar style with this property
        ),
      );
}
