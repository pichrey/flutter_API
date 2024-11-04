import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'detail.dart';
import 'product_list.dart';
import 'user_profile.dart';
import 'carousel_slider.dart';

void main() {
  runApp(const HomeScreen());
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  final int userId = 1;
  final List<Map<String, dynamic>> cartItems = [];
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      ProductList(),
      CarouselSlider(),
      CVScreen(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Text("SHOPPING",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
        ),
        backgroundColor: Colors.indigo,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10,),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_2,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5, left: 3),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_active,
              color: Colors.white,
              size: 30,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("PICH RIY"),
              accountEmail: Text("pichriy72@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/logo.jpg'),
                ),
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.line_style, size: 50, color: Colors.indigo),
              title: const Text("Product List", style: TextStyle(fontSize: 18)),
              subtitle: const Text("Display all product items..."),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductList()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.manage_accounts, size: 50, color: Colors.indigo),
              title: const Text("Profile", style: TextStyle(fontSize: 18)),
              subtitle: const Text("View or edit your profile"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CVScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page, size: 50, color: Colors.indigo),
              title: const Text("Contact Us", style: TextStyle(fontSize: 18)),
              subtitle: const Text("Contact our team for assistance"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailScreen(data: 1)));
              },
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Version 1.0",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: const <Widget>[
          Icon(Icons.home,
          size: 30,
          color: Colors.white,),
          Icon(
              Icons.landslide_rounded,
              size: 30,
              color: Colors.white,
          ),
          Icon(
            Icons.person,
              size: 30,
            color: Colors.white,
          ),
        ],
        color: Colors.indigo,
        buttonBackgroundColor: Colors.indigo,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
