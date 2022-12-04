import 'dart:convert';

import 'package:client/pages/tabpage/pay.dart';
import 'package:client/pages/tabpage/home.dart';
import 'package:client/pages/tabpage/reservation.dart';
import 'package:client/pages/tabpage/search_trip.dart';
import 'package:flutter/material.dart';


import '../service/auth_service.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  //const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{

  TabController? tabController;
  int selectIndex=0;
  onItemClicked(int index){
    setState(() {
      selectIndex=index;
      tabController!.index=selectIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController= TabController(length: 4, vsync: this);

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          HomePage(),
          SearchTrip(),
          ReservPage(),
          EarningPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const  [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_off_rounded),
              label: "search"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Reservation"
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: "earning"
          ),

        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
