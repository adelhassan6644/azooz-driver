import 'package:azooz_diver/provider/home_provider/contact_proider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app/utill/app_string.dart';
import '../../adaptive/adaptive_indicator.dart';



class NewTasks extends StatefulWidget {
  const NewTasks({Key? key}) : super(key: key);

  @override
  _NewTasksState createState() => _NewTasksState();

}

class _NewTasksState extends State<NewTasks> {

  @override
  void initState() {
    Future.delayed(Duration.zero,() async {
      await Provider.of<ContactProvider>(context,listen: false).initContactTable();
      await Provider.of<ContactProvider>(context,listen: false).getContactData();

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
        builder:(context, contactProvider, child){
          if(contactProvider.isGettingData)
          {
            return Center(
                child: SizedBox(
                    child: AdaptiveIndicator(os:getOs(),)
            )
            );
          }
          else{
            return RefreshIndicator(
            onRefresh: () async {
              await contactProvider.getContactData();
              },
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: contactProvider.contactLocalData.length,
              itemBuilder:(context,index)=>
                Dismissible(
                  key: Key(contactProvider.contactLocalData[index].id.toString()),
                  direction:DismissDirection.horizontal,
                  onDismissed: (direction) async {
                    await contactProvider.deleteContact(
                        id: contactProvider.contactLocalData[index].id ,
                        index: index);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                      decoration:  BoxDecoration(
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 7,
                          offset:const Offset(0, 3)
                        )
                      ],
                      color: Colors.white),
                    child: Column(
                      children: [
                        Text(contactProvider.contactLocalData[index].name,
                            style: const TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 16, color: Colors.black)
                        ),
                        const SizedBox(height: 5,),
                        Text(contactProvider.contactLocalData[index].phone,
                            style: const TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 16, color: Colors.black)
                        ),
                        const SizedBox(height: 5,),
                        Text(contactProvider.contactLocalData[index].mail,
                            style: const TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 16, color: Colors.black)
                        ),
                        const SizedBox(height: 5,),
                      ],
                    ),
                  ),
                ),
            ),
          );}}
    );
  }
}
