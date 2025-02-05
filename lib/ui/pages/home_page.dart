import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reboottalent/ui/pages/candidates_page.dart';
import 'package:reboottalent/ui/pages/vacancies_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _selectedIndex = 0;
  late PageController _pageController;
  bool _isExtended = false;

  static const List<NavigationRailDestination> _destinations = [
    NavigationRailDestination(
      icon: Icon(Icons.home),
      label: Text('Candidatos'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.business),
      label: Text('Vagas'),
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
              destinations: _destinations, 
              selectedIndex: _selectedIndex,
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              extended: _isExtended,
              leading: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 210),
                    reverseDuration: const Duration(milliseconds: 195),
                    firstChild: Image.asset('assets/images/reboot_talent_2.png', height: 60, width: 60),
                    secondChild: Container(
                      width: 240,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/reboot_talent_2.png', height: 60, width: 60),
                          SizedBox(width: 15,),
                          Text('Reboot Talent'),
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
                CandidatesPage(),
                VacanciesPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}