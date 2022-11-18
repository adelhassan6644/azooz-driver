import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import '../../../app/core/location/location.dart';
import '../../base/custom_text_form_field.dart';

class AddBottomSheet extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  TextEditingController nameController;
  TextEditingController addressController ;
  TextEditingController phoneController ;

   AddBottomSheet({Key? key, required this.formKey, required this.nameController, required this.addressController
  , required this.phoneController}) : super(key: key);

  @override
  _AddBottomSheetState createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Form(
          key:widget.formKey ,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:  [
              CustomTextFormField(
                controller:widget.nameController ,
                hint: 'Name',
                label: true,
                fieldColor: Colors.grey.shade300,
                icon: Icons.person,
                valid: (value){
                  if(value!.isEmpty)
                  {
                    return ' Name is Invalid';
                  }
                  else{
                    return null;
                  }
                },
                type: TextInputType.name,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller:widget.phoneController ,
                hint: 'Phone',
                label: true,
                fieldColor: Colors.grey.shade300,
                icon: Icons.phone,
                valid: (value){
                  if(value!.isEmpty)
                  {
                    return ' Phone is Invalid';
                  }
                  else{
                    return null;
                  }
                },
                type: TextInputType.phone,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller:widget.addressController ,
                hint: 'Address',
                label: true,
                fieldColor: Colors.grey.shade300,
                icon: Icons.location_on,
                onTap: () async {
                  await determinePosition().then((value) async {
                    List<Placemark> placeMark = await placemarkFromCoordinates(
                        value.latitude.toDouble(),
                        value.longitude.toDouble());
                    widget.addressController.text= placeMark.first.street.toString();
                    log(placeMark.first.street.toString());

                  });
                },
                valid: (value){
                  if(value!.isEmpty)
                  {
                    return ' Address is Invalid';
                  }
                  else{
                    return null;
                  }
                },
                type: TextInputType.streetAddress,
              ),
            ],
          ),
        )

    );
  }
}
