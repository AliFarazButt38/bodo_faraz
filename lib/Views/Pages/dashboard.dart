// ignore_for_file: must_be_immutable

import 'package:bodoo_flutter/Views/Pages/community_screen.dart';

import 'package:bodoo_flutter/Views/Pages/profile_screen.dart';
import 'package:bodoo_flutter/Views/Pages/task_screen.dart';
import 'package:bodoo_flutter/Views/Pages/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Theme/palette.dart';
import 'home.dart';


class Dashboard extends StatefulWidget {
  int? index;
   Dashboard({Key? key,  this.index}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  late int _selectedIndex;

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Task(),
    const Community(),
    const Wallet(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = widget.index ?? 0;

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //selectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,

        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              semanticsLabel: 'Acme Logo',
              width: 20,
              height: 20,
              color: _selectedIndex == 0 ? Palette.blue : Palette.grey74,
              //fit: BoxFit.scaleDown,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon:  SvgPicture.asset(
              'assets/icons/task.svg',
              semanticsLabel: 'Acme Logo',
              width: 17,
              height: 20,
              color: _selectedIndex == 1 ? Palette.blue : Palette.grey74,
             // fit: BoxFit.scaleDown,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon:  SvgPicture.asset(
              'assets/icons/users.svg',
              semanticsLabel: 'Acme Logo',
              width: 22,
              height: 16,
              color: _selectedIndex == 2 ? Palette.blue : Palette.grey74,
              // fit: BoxFit.scaleDown,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon:  SvgPicture.asset(
              'assets/icons/wallet.svg',
              semanticsLabel: 'Acme Logo',
              width: 20,
              height: 18,
              color: _selectedIndex == 3 ? Palette.blue : Palette.grey74,
              //fit: BoxFit.scaleDown,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon:  SvgPicture.asset(
              'assets/icons/user.svg',
              semanticsLabel: 'Acme Logo',
              width: 18,
              height: 20,
              color: _selectedIndex == 4 ? Palette.blue : Palette.grey74,
              //fit: BoxFit.scaleDown,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Palette.baseElementLight,
        // unselectedItemColor: Palette.purple2,
        onTap: _onItemTapped,
      ),
    );
  }
}
