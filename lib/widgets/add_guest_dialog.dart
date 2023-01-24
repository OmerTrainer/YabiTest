import 'package:flutter/material.dart';
import 'package:yabi_test/services/contacts_service.dart';
import 'package:yabi_test/ui/primary_button.dart';
import 'package:yabi_test/utils/device_utils.dart';

import '../ui/input_text_field.dart';

class AddGuestDialog extends StatefulWidget {
  final Function(String, String, String) onSavedContact;
  const AddGuestDialog({Key? key, required this.onSavedContact})
      : super(key: key);

  @override
  State<AddGuestDialog> createState() => _AddGuestDialogState();
}

class _AddGuestDialogState extends State<AddGuestDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: DeviceUtils.getScaledHeight(context, 0.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      'Invite Guest',
                      style: TextStyle(
                          fontSize: DeviceUtils.getScaledFontSize(context, 18)),
                    ),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    minWidth: DeviceUtils.getScaledWidth(context, 0.15),
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    buttonText: 'Cancel',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PrimaryButton(
                      minWidth: DeviceUtils.getScaledWidth(context, 0.15),
                      onPress: () {
                        widget.onSavedContact(nameController.text,
                            emailController.text, phoneController.text);
                      },
                      buttonText: 'Invite',
                    ),
                  )
                ],
              ),
              const Text('Guest Name'),
              SizedBox(
                height: DeviceUtils.getScaledHeight(context, 0.01),
              ),
              InputTextField(
                textFieldController: nameController,
                hintText: 'Guest Name',
              ),
              const Text('Phone Number'),
              SizedBox(
                height: DeviceUtils.getScaledHeight(context, 0.01),
              ),
              InputTextField(
                textFieldController: phoneController,
                hintText: 'Phone Number',
              ),
              const Text('Email Address'),
              SizedBox(
                height: DeviceUtils.getScaledHeight(context, 0.01),
              ),
              InputTextField(
                textFieldController: emailController,
                hintText: 'Email Address',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
