import 'package:flutter/material.dart';
import 'package:healthcare_app/screens/appointment_page.dart';
import 'package:healthcare_app/screens/chat_screen.dart';
import 'package:healthcare_app/screens/chatting_page.dart';
import 'package:healthcare_app/screens/fav_page.dart';
import 'package:healthcare_app/screens/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthcare_app/screens/message_page/message_page.dart';
import 'package:healthcare_app/screens/profile_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // variable declaration
  int currentPage = 0;
  final PageController _page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: ((value) {
          // upload page index when tab pressed/switch page
          setState(() {
            currentPage = value;
          });
        }),
        children: <Widget>[
          const HomePage(),
          const AppointmentPage(),
          // const ChatPage(),
          MessagePage(),
          FavPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page) {
          setState(() {
            currentPage = page;
            _page.jumpToPage(
              page,
              // duration: const Duration(milliseconds: 500),
              // curve: Curves.easeInOut,
            );
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.message),
            label: 'Chatting',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heart),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidUser),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
