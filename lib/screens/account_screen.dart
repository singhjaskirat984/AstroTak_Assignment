import 'package:astrotak_assignment/screens/friends_and_family_profile_screen.dart';
import 'package:astrotak_assignment/screens/order_history_screen.dart';
import 'package:astrotak_assignment/utilities/colored_safe_area.dart';
import 'package:astrotak_assignment/utilities/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountScreen extends StatefulWidget {
  static const String id = 'account_screen';
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> with TickerProviderStateMixin  {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    // _tabController.addListener(_handleTabSelection);
  }

  // void _handleTabSelection() {
  //   setState(() {
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              bottom: TabBar(
                controller: _tabController,
                physics: const BouncingScrollPhysics(),
                indicatorColor: Colors.orangeAccent,
                labelColor: Colors.orangeAccent,
                unselectedLabelColor: Colors.black,
                onTap: (index){
                  _tabController.animateTo(index);
                },
                tabs: const [
                  Tab(text: "My Profile",),
                  Tab(text: "Order History",),
                ],
              ),
              title: Tab(icon: Image.asset("assets/icons/icon.png"), height: 60.0),
              leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Tab(
                  icon: SizedBox(
                    child: Icon(Icons.arrow_back_ios_new_rounded),
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
              actions:const [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Tab(
                    icon: SizedBox(
                      child: Icon(Icons.logout_rounded),
                      height: 50,
                    ),
                  ),
                ),
              ],
              centerTitle: true,
            ),
            body: TabBarView(
              controller: _tabController,
              children: const [
                FriendsAndFamilyProfileScreen(),
                OrderHistory(),
              ],
            ),
          ),
        )
    );
  }
}
