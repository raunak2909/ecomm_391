

import 'package:ecomm_391/ui/dashboard/nav_pages/home/home_nav_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedNavIndex=0;
  List<Widget> mNavPages=[
    HomeNavPage(),
    HomeNavPage(),
    HomeNavPage(),
    HomeNavPage(),
    HomeNavPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mNavPages[selectedNavIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 11,
          iconSize: 25,
          showSelectedLabels: false,
          currentIndex: selectedNavIndex,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            selectedNavIndex=index;
            setState(() {

            });
            //provider.updatePageIndex(index: index);
          },


          items: [
            BottomNavigationBarItem(activeIcon: Icon(Icons.category_outlined),label: "Category",icon: Icon(Icons.category),),
            BottomNavigationBarItem(activeIcon: Icon(Icons.favorite_border_outlined),label: "Favorite",icon: Icon(Icons.favorite_border),),
            BottomNavigationBarItem(activeIcon: Icon(Icons.home),label: "Home",icon: Icon(Icons.home_outlined),),
            BottomNavigationBarItem(activeIcon: Icon(Icons.shopping_cart_rounded),label: "Home",icon: Icon(Icons.shopping_cart),),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),

          ]

      ),

    );

  }
}
/* BottomNavigationBarItem(icon: Container(
                      width: 50,height: 50,
                      decoration:BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(5)) ,
                      child: Icon(Icons.add)),label: "Add"),*/
