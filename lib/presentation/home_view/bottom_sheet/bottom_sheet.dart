import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import '../../../app/core/location/location.dart';
import '../../../app/utill/app_string.dart';
import '../../../provider/home_provider/contact_proider.dart';
import '../../adaptive/adaptive_indicator.dart';
import '../../base/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../base/dialog_mode.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  _AddBottomSheetState createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mailAddressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ListView(
              shrinkWrap: true,
              children: [
                CustomTextFormField(
                  controller: nameController,
                  hint: 'Name',
                  label: true,
                  fieldColor: Colors.grey.shade300,
                  icon: Icons.person,
                  valid: (value) {
                    if (value!.isEmpty) {
                      return ' Name is Invalid';
                    } else {
                      return null;
                    }
                  },
                  type: TextInputType.name,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  controller: phoneController,
                  hint: 'Phone',
                  label: true,
                  fieldColor: Colors.grey.shade300,
                  icon: Icons.phone,
                  valid: (value) {
                    if (value!.isEmpty) {
                      return ' Phone is Invalid';
                    } else {
                      return null;
                    }
                  },
                  type: TextInputType.phone,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  controller: mailAddressController,
                  hint: 'Mail',
                  label: true,
                  fieldColor: Colors.grey.shade300,
                  icon: Icons.mail,
                  valid: (value) {
                    if (value!.isEmpty) {
                      return ' Phone is Invalid';
                    } else {
                      return null;
                    }
                  },
                  type: TextInputType.emailAddress,
                ),
                // CustomTextFormField(
                //   controller:widget.addressController ,
                //   hint: 'Address',
                //   label: true,
                //   fieldColor: Colors.grey.shade300,
                //   icon: Icons.location_on,
                //   onTap: () async {
                //     await determinePosition().then((value) async {
                //       List<Placemark> placeMark = await placemarkFromCoordinates(
                //           value.latitude.toDouble(),
                //           value.longitude.toDouble());
                //       widget.addressController.text= placeMark.first.street.toString();
                //       log(placeMark.first.street.toString());
                //
                //     });
                //   },
                //   valid: (value){
                //     if(value!.isEmpty)
                //     {
                //       return ' Address is Invalid';
                //     }
                //     else{
                //       return null;
                //     }
                //   },
                //   type: TextInputType.streetAddress,
                // ),
                const SizedBox(
                  height: 15,
                ),
                Consumer<ContactProvider>(
                    builder: (context, contactProvider, child) {
                  if (contactProvider.isInserting) {
                    return Center(
                        child: SizedBox(
                            child: AdaptiveIndicator(
                      os: getOs(),
                    )));
                  } else {
                    return InkWell(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await contactProvider.insertContactToTable(
                              name: nameController.text.trim(),
                              phone: phoneController.text.trim(),
                              mail: mailAddressController.text.trim());
                          await contactProvider.nonBottomSheetMode();
                          Future.delayed(const Duration(seconds: 1),
                                  () async { Navigator.of(context)..pop()..pop();
                                 });
                          await guestModeDialog(context, "تم الاضافة بنجاح");
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 7,
                                  offset: const Offset(0, 3))
                            ],
                            shape: BoxShape.rectangle),
                        child: const Center(
                          child: Text(
                            'Add Contact',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ));
  }
}
