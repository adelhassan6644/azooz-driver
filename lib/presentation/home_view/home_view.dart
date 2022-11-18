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
  bool isShowingBottomSheet= false;
  final GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  SqfLiteClient client = SqfLiteClient() ;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   client.createTable();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:scaffoldKey,
       appBar:  CustomAppBar(title:  titles[currentIndex],),
      backgroundColor: Colors.white.withOpacity(0.9),
      bottomNavigationBar: MoltenBottomNavigationBar(
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
          // MoltenTab(
          //     unselectedColor: Colors.grey.withOpacity(0.8),
          //     selectedColor: Colors.black,
          //     icon: const Icon(Icons.shopping_cart,),
          //     title: const Text('Cart')),
      ],
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          if(!isShowingBottomSheet) {
            client.createTable();
            scaffoldKey.currentState!.showBottomSheet((context) => AddBottomSheet(formKey:formKey,
              addressController: addressController, phoneController: phoneController, nameController: nameController ,)
            ).closed.then((value)  {
                  setState(() {
              floatIcon=Icons.add;
              isShowingBottomSheet=false;
            });
                });
            setState(() {
              floatIcon=Icons.edit;
              isShowingBottomSheet=true;
            });
          } else{
            if(formKey.currentState!.validate()){
              client.insertToTable(
                  name: nameController.text,
                  phone: phoneController.text,
                  address: addressController.text,);
              Navigator.pop(context);
              setState(() {
                floatIcon=Icons.add;
                isShowingBottomSheet=false;
              });
            }


          }
        },
        child:Icon(floatIcon,color: Colors.black,) ,


      ),
    );
  }

}
