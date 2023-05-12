import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tibbi_terminoloji/controller/termo_dashboard_controller.dart';

import 'about.dart';
import 'favorite.dart';
import 'home_page.dart';

class TermoDashBoard extends StatelessWidget {
  const TermoDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TermoDashBoardController>(
        init: TermoDashBoardController(),
        builder: (controller) {
          return Scaffold(
              body: SafeArea(
                  child: IndexedStack(
                index: controller.buttomIndex,
                children: const [
                  HomePage(),
                  Favorite(),
                  About(),
                ],
              )),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favorite',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.info),
                    label: 'About',
                  ),
                ],
                currentIndex: controller.buttomIndex,
                selectedItemColor: const Color(0xFFCD0916),
                onTap: controller.changeButtomIndex,
              ));
        });
  }
}
