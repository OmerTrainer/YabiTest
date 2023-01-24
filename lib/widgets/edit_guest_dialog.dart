import 'package:flutter/material.dart';
import 'package:yabi_test/ui/primary_button.dart';
import 'package:yabi_test/utils/device_utils.dart';

import '../ui/input_text_field.dart';

class EditGuestDialog extends StatefulWidget {
  final String id;
  final String name;
  final String email;
  final String phone;
  final Function(String, String, String, String) onDataSaved;

  const EditGuestDialog({
    Key? key,
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.onDataSaved,
  }) : super(key: key);

  @override
  State<EditGuestDialog> createState() => _EditGuestDialogState();
}

class _EditGuestDialogState extends State<EditGuestDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    phoneController.text = widget.phone;
    emailController.text = widget.email;
  }

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
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: DeviceUtils.getScaledHeight(context, 0.05),
                  width: DeviceUtils.getScaledWidth(context, 0.2),
                  child: PrimaryButton(
                    onPress: () {
                      widget.onDataSaved(widget.id, nameController.text,
                          emailController.text, phoneController.text);
                    },
                    buttonText: 'Save',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
