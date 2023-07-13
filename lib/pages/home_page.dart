import 'package:flutter/material.dart';
import 'package:sneaker_shop/components/bottom_nav_bar.dart';
import 'package:sneaker_shop/pages/shop_page.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this is selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  // this method will update our selected index
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  // page tp display
  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavBar(onTabChange: (index) => navigateBottomBar(index),),
      appBar: AppBar(
        leading: Builder(builder: (context)=> IconButton(
          icon: const Icon(Icons.menu, color: Colors.black,),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset('assets/images/nike.png',),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white,),
                    title: Text('Home', style: TextStyle(color: Colors.white),),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.info, color: Colors.white,),
                    title: Text('Info', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
              
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white,),
                title: Text('Logout', style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}