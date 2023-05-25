import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Screens/Dashboard_Screen.dart';
import '../Screens/Dramas_Screen.dart';
import '../Screens/Search_Screen.dart';
import '../Screens/TalkShow_Screen.dart';
class BottunNavBar extends StatefulWidget {
  const BottunNavBar({Key? key}) : super(key: key);

  @override
  State<BottunNavBar> createState() => _BottunNavBarState();
}
int _selectedIndex=0;
class _BottunNavBarState extends State<BottunNavBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.white,
            backgroundColor: Colors.grey.shade800,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey.shade600,
            color: Colors.green,
            tabs: [
               GButton(
                icon: Icons.menu,
                text: 'Menu',
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) {
                      return const DashboardScreen();
                    }),
                  );
                },
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) {
                      return const SearchScreen();
                    }),
                  );
                },
              ),
              GButton(
                icon: Icons.live_tv,
                text: 'Dramas',
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) {
                      return const DramaScreen();
                    }),
                  );
                },
              ),
              GButton(
                icon: Icons.speaker_phone_outlined,
                text: 'Talk Show',
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) {
                      return const TalkShowScreen();
                    }),
                  );
                },
              ),
            ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
