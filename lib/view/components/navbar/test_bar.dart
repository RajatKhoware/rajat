import 'package:flutter/material.dart';
import 'package:tambola_frontend/view/screens/AccountScreen/account_screen.dart';
import 'package:tambola_frontend/view/screens/PlayRoom/select_room_screen.dart';

import '../../screens/AddMoney/add_money_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    SelectRoomScreen(),
    // AddMoneyScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.yellow,
            ),
            // title: Text('HOME'),
            activeIcon: Icon(
              Icons.home,
              color: Colors.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.verified_user,
              color: Colors.yellow,
            ),
            // title: Text('CALENDAR'),
            activeIcon: Icon(
              Icons.calendar_month,
              color: Colors.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.verified_user,
              color: Colors.yellow,
              size: 36,
            ),
            // title: Text('PROFILE'),
            activeIcon: Icon(
              Icons.verified_user,
              color: Colors.green,
              size: 36,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Stack(
        children: [
          _buildOffstageNavigator(0),
          _buildOffstageNavigator(1),
          _buildOffstageNavigator(2),
        ],
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          SelectRoomScreen(),
          // AddMoneyScreen(),
          AccountScreen(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
//class PageCTRLWidget extends State<> with AutomaticKeepAliveClientMixin{
//   @override
//  bool get wantKeepAlive => true;
//  int currentIndex=0;
//  final screens=[
//  AccountScreen(),
//  Center(child: Text('Categories',style: TextStyle(fontSize: 45),),),
//  Center(child: Text('Assistant',style: TextStyle(fontSize: 45),),),
//  SelectRoomScreen()
// ];
// @override
// Widget build(BuildContext context) {
// return Scaffold(

//   body: IndexedStack(
//     index: currentIndex,
//     children: screens,
//   ),

//   bottomNavigationBar: BottomNavigationBar(
//     type: BottomNavigationBarType.fixed,
//     selectedItemColor: Colors.orange,
//     currentIndex: currentIndex,
//     onTap:(tappedIndex)=>setState(()=>currentIndex=tappedIndex),
//     items: [
//       BottomNavigationBarItem(
//         icon: Icon(Icons.home),
//         label: 'Home',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.menu_book_rounded),
//         label: 'Categories',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.add_location_alt_rounded),
//         label: 'Assistant',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.account_box_rounded),
//         label: 'Member',
//       )
//     ],
//   ),
// );
// }
// }
// import '../../screens/AccountScreen/account_screen.dart';

// // enum TabItem { red, green, blue }

// // class App extends StatefulWidget {
// //   @override
// //   State<StatefulWidget> createState() => AppState();
// // }

// // class AppState extends State<App> {

// //   TabItem currentTab = TabItem.red;

// //   void _selectTab(TabItem tabItem) {
// //     setState(() {
// //       currentTab = tabItem;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: _buildBody(),
// //       bottomNavigationBar: BottomNavigationBar(
// //         currentTab: currentTab,
// //         onSelectTab: _selectTab,
// //       ),
// //     );
// //   }
  
// //   Widget _buildBody() {
// //     return Container(
// //     color: TabHelper.color(TabItem.red),
// //     alignment: Alignment.center,
// //     child: FlatButton(
// //       child: Text(
// //         'PUSH',
// //         style: TextStyle(fontSize: 32.0, color: Colors.white),
// //       ),
// //       onPressed: _push,
// //     )
// //   );
// // }

// // void _push() {
// //   Navigator.of(context).push(MaterialPageRoute(
 
// //     builder: (context) => ColorDetailPage(
// //       color: TabHelper.color(TabItem.red),
// //       title: TabHelper.description(TabItem.red),
// //     ),
// //   ));
  
// //   }
// // }

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int activeIndex = 0;
//   void changeActivePage(int index) {
//     setState(() {
//       activeIndex = index;
//     });
//   }

//   List<Widget> pages = [];

//   @override
//   void initState() {
//     pages = [
//       Page1(() => changeActivePage(2)),
//       Page2(),
//      AccountScreen(),
//     ];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(onPressed: () => changeActivePage(0), icon: Icon(Icons.call)),
//               IconButton(onPressed: () => changeActivePage(1), icon: Icon(Icons.message)),
//             ],
//           ),
//         ),
//         body: pages[activeIndex]);
//   }
// }

// // 1st Page:

// class Page1 extends StatelessWidget {
//   final Function callback;

//   const Page1(this.callback);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Page1')),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () => callback(),
//           child: Text('Go to Page3'),
//         ),
//       ),
//     );
//   }
// }

// // 2nd Page:

// class Page2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) =>
//       Scaffold(appBar: AppBar(title: Text('Page2')));
// }

// // 3rd Page:

// class Page3 extends StatelessWidget {
//   const Page3();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Page3')),
//       body: Center(child: Text('Page3')),
//     );
//   }
// }