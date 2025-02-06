import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reboottalent/ui/pages/candidates_page.dart';
import 'package:reboottalent/ui/pages/home_page.dart';
import 'package:reboottalent/ui/pages/settings_page.dart';
import 'package:reboottalent/ui/pages/talent_pool.dart';
import 'package:reboottalent/ui/pages/vacancies_page.dart';

class CustomControllerPage extends StatefulWidget {
  const CustomControllerPage({super.key});

  @override
  State<CustomControllerPage> createState() => _CustomControllerPageState();
}

class _CustomControllerPageState extends State<CustomControllerPage> {
  
  int _selectedIndex = 0;
  late PageController _pageController;
  bool _isExtended = false;

  static const List<NavigationRailDestination> _destinations = [
    NavigationRailDestination(
      icon: Icon(Icons.home, color: Colors.white,),
      label: Text('Home', style: TextStyle(fontSize: 20, color: Colors.white),),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.group_sharp, color: Colors.white,),
      label: Text('Candidatos', style: TextStyle(fontSize: 20, color: Colors.white),),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.bookmark, color: Colors.white,),
      label: Text('Vagas Abertas', style: TextStyle(fontSize: 20, color: Colors.white),),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.view_list_rounded, color: Colors.white,),
      label: Text('Banco de Talentos', style: TextStyle(fontSize: 20, color: Colors.white),),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.settings, color: Colors.white,),
      label: Text('Configurações', style: TextStyle(fontSize: 20, color: Colors.white),),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  setCurrentPage(index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          MouseRegion(
            onEnter: (PointerEnterEvent event) {
              setState(() {
                _isExtended = true;
                // _animationController.forward();
              });
            },
            onExit: (PointerExitEvent event) {
              setState(() {
                _isExtended = false;
                // _animationController.reverse();
              });
            },
            child: NavigationRail(
              extended: _isExtended,
              destinations: _destinations,
              selectedIndex: _selectedIndex,
              backgroundColor: Theme.of(context).colorScheme.tertiary.withOpacity(1.0),
              indicatorColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              indicatorShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              leading: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 210),
                    reverseDuration: const Duration(milliseconds: 195),
                    firstChild: SizedBox(
                      height: 100,
                      width: 60,
                      child: Image.asset('assets/images/reboot_talent_2.png', height: 60, width: 60)
                    ),
                    secondChild: SizedBox(
                      width: 240,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/reboot_talent_2.png', height: 60, width: 60),
                          const SizedBox(width: 15,),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Reboot', style: TextStyle(fontSize: 25, color: Colors.white),),
                              Text('Talent', style: TextStyle(fontSize: 25, color: Colors.white),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    crossFadeState: _isExtended ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              ),
              onDestinationSelected: (int index){
                setState(() {
                  _selectedIndex = index;
                  _pageController.animateToPage(
                    index, 
                    duration: const Duration(milliseconds: 400), 
                    curve: Curves.easeInOut,
                  );
                });
              },
              ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: setCurrentPage,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                HomePage(),
                CandidatesPage(),
                VacanciesPage(),
                TalentPool(),
                SettingsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}