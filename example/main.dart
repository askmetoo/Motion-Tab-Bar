import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motion Tab Bar Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Motion Tab Bar Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  MotionTabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new MotionTabController(initialIndex:1,vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: MotionTabBar(
        tabOneName: "Home",
        tabTwoName: "Search",
        tabThreeName: "Account",
        tabOneIcon: Icons.home,
        tabTwoIcon: Icons.search,
        tabThreeIcon: Icons.account_box,
        tabIconColor: Colors.green,
        tabSelectedColor: Colors.red,
        initialSelectedTab: 1,
        textStyle: TextStyle(color: Colors.red),
        onTabItemSelected: (int value){
          print(value);
          setState(() {
            _tabController.index = value;
          });
        },
    ),
      body: MotionTabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            child: Center(
              child: Text("Home"),
            ),
          ),
          Container(
            child: Center(
              child: Text("Search"),
            ),
          ),
          Container(
            child: Center(
              child: Text("Account"),
            ),
          ),
        ],
      )
    );
  }
}
