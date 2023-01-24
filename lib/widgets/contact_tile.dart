import 'package:flutter/material.dart';
import 'package:yabi_test/ui/primary_button.dart';
import 'package:yabi_test/utils/device_utils.dart';
import 'package:yabi_test/widgets/add_guest_dialog.dart';

import '../entities/contact_entitiy.dart';
import 'edit_guest_dialog.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;
  final Function(String) onPressedDelete;
  final Function(String, String, String, String) onPressedEdit;
  const ContactTile({
    Key? key,
    required this.contact,
    required this.onPressedDelete,
    required this.onPressedEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: DeviceUtils.getScaledHeight(context, 0.24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 8.0,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/Vi.png',
                  ),
                  SizedBox(
                    width: DeviceUtils.getScaledWidth(context, 0.03),
                  ),
                  Text(
                    contact.name,
                    style: TextStyle(
                      fontSize: DeviceUtils.getScaledFontSize(context, 18),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: const Color(0xFFE5E7EB),
              thickness: 1,
              indent: DeviceUtils.getScaledWidth(context, 0.03),
              endIndent: DeviceUtils.getScaledWidth(context, 0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/phone.png',
                    color: const Color(0xFFA5B8F0),
                  ),
                  SizedBox(
                    width: DeviceUtils.getScaledWidth(context, 0.03),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: DeviceUtils.getScaledWidth(context, 0.25),
                        child: Text(
                          contact.phone,
                        ),
                      ),
                      SizedBox(
                        height: DeviceUtils.getScaledHeight(context, 0.01),
                      ),
                      const Text('Phone Number'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Container(
                      width: 1,
                      height: DeviceUtils.getScaledHeight(context, 0.05),
                      color: const Color(0xFFE5E7EB),
                    ),
                  ),
                  Image.asset(
                    'assets/email.png',
                    color: const Color(0xFFA5B8F0),
                  ),
                  SizedBox(
                    width: DeviceUtils.getScaledWidth(context, 0.03),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: DeviceUtils.getScaledWidth(context, 0.25),
                          child: Text(contact.email)),
                      SizedBox(
                        height: DeviceUtils.getScaledHeight(context, 0.01),
                      ),
                      const Text('Email Address'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PrimaryButton(
                    buttonText: 'Edit Guest',
                    onPress: () {
                      onPressedEdit(contact.id, contact.name, contact.email,
                          contact.phone);
                    },
                  ),
                  PrimaryButton(
                    buttonText: 'Delete',
                    isBorder: true,
                    backgroundColor: Colors.white,
                    textColor: const Color(0xFF6D41CB),
                    onPress: () {
                      onPressedDelete(contact.id);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
