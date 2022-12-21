import 'dart:developer';

import 'package:azooz_diver/provider/home_provider/contact_proider.dart';

import 'bottom_sheet/bottom_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import '../../data/sqflite_data/sqflite_client.dart';
import '../base/custom_app_bar.dart';
import 'bottom_navigation_bar_units/archived_tasks.dart';
import 'bottom_navigation_bar_units/done_tasks.dart';
import 'bottom_navigation_bar_units/new_tasks.dart';
import 'bottom_navigation_bar_units/settings.dart';
import 'package:provider/provider.dart';



class HomeView extends StatefulWidget {
   const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  PageController pageController = PageController();
  List<String>titles =['New Tasks','Done Tasks','Archived Tasks','Settings'];
  int currentIndex = 0;
  IconData floatIcon=Icons.add;
  final GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
  SqfLiteClient client = SqfLiteClient() ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:scaffoldKey,
       appBar:  CustomAppBar(title:  titles[currentIndex],),
      backgroundColor: Colors.white.withOpacity(0.9),
      bottomNavigationBar: SafeArea(
        child: MoltenBottomNavigationBar(
          barColor: Colors.white,
          selectedIndex: currentIndex,
          domeCircleColor: Colors.grey.withOpacity(0.5),
          duration:const Duration(milliseconds: 250),
          domeHeight: 20,
          barHeight: 70,
          curve: Curves.elasticOut,
          borderRaduis:  const BorderRadius.only(
              topRight:Radius.circular(35) ,
              topLeft:Radius.circular(35) ),
          onTabChange: (index){
            setState(() {
              currentIndex=index;
              pageController.animateToPage(index,
                  curve: Curves.elasticOut,
                  duration: const Duration(milliseconds: 250));

              if (kDebugMode) {
                print(currentIndex);
              }
            });

          },
          tabs: [
            MoltenTab(
                unselectedColor: Colors.grey.withOpacity(0.8),
              selectedColor: Colors.black,
              icon: const Icon(Icons.menu),
              title: const Text('New Tasks')),
            MoltenTab(
              unselectedColor: Colors.grey.withOpacity(0.8),
                selectedColor: Colors.black,
                icon: const Icon(Icons.check_circle_outline,),
                title: const Text('Done Tasks')),
            MoltenTab(
                unselectedColor: Colors.grey.withOpacity(0.8),
                selectedColor: Colors.black,
                icon: const Icon(Icons.archive,),
                title: const Text('Archive Tasks')),
            MoltenTab(
                unselectedColor: Colors.grey.withOpacity(0.8),
                selectedColor: Colors.black,
                icon: const Icon(Icons.settings,),
                title: const Text('Settings')),

        ],
        ),
      ),
      body: PageView(
        controller: pageController,
        children:
        const [
          NewTasks(),
          DoneTasks(),
          ArchivedTasks(),
          Settings()
        ]
      ),
      floatingActionButton:currentIndex == 0 && Provider.of<ContactProvider>(context).isBottomSheet==false?
          Consumer<ContactProvider>(builder:((context, contactProvider, child )
            {
              return FloatingActionButton(
            backgroundColor: Colors.white,
            child: const Icon(Icons.add, color: Colors.black,),
            onPressed: () async {
              await contactProvider.bottomSheetMode();
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return  const AddBottomSheet();
                  },
              ).then((value) async {
              log('bottom Sheet ended');
              await contactProvider.nonBottomSheetMode();});

            // scaffoldKey.currentState!.showBottomSheet((context) =>  const AddBottomSheet());
            });}))
      : const SizedBox()
    );
  }

}
