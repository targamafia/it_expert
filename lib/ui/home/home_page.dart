import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/home/home_controller.dart';
import 'package:it_expert/ui/home/profile/profile_page.dart';
import 'package:it_expert/ui/home/search/search_page.dart';

import 'main/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
            child: [
          const MainPage(),
          const SearchPage(),
          const Text("4"),
              const ProfilePage(),
        ][currentPageIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,  color: Colors.black,),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,  color: Colors.black,),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_sharp, color: Colors.black,),
            label: 'Historial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black,),
            label: 'Perfil',
          )
        ],
        backgroundColor: Theme.of(context).canvasColor,
      ),
    );
  }
}
