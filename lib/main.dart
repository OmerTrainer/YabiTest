import 'package:flutter/material.dart';
import 'package:yabi_test/entities/contact_entitiy.dart';
import 'package:yabi_test/services/contacts_service.dart';
import 'package:yabi_test/utils/device_utils.dart';
import 'package:yabi_test/widgets/add_guest_dialog.dart';
import 'package:yabi_test/widgets/contact_tile.dart';
import 'package:yabi_test/widgets/edit_guest_dialog.dart';
import 'package:yabi_test/widgets/no_guests_found.dart';

import 'ui/primary_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(((_) {
      fetchContactsData();
    }));
  }

  void fetchContactsData() async {
    contacts = await ContactsService.getAllContacts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEFF1FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E2F45),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(
            'assets/YabiLogo.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        leadingWidth: DeviceUtils.getScaledWidth(context, 0.2),
        title: Text(
          widget.title,
          style:
              TextStyle(fontSize: DeviceUtils.getScaledFontSize(context, 22)),
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  'GuestList',
                  style: TextStyle(
                      fontSize: DeviceUtils.getScaledFontSize(context, 18)),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: PrimaryButton(
                  buttonText: 'Invite A Guest',
                  shouldShowIcon: true,
                  minWidth: DeviceUtils.getScaledWidth(context, 0.25),
                  onPress: () {
                    showDialog(
                        context: context,
                        builder: ((context) => AddGuestDialog(
                              onSavedContact: (name, email, phone) async {
                                await ContactsService.createContact(
                                    name, email, phone);
                                //i have to do this because the create contact function doesn't return a contact in the API....
                                fetchContactsData();
                                Navigator.of(context).pop();
                              },
                            )));
                  },
                ),
              ),
            ],
          ),
          contacts.isNotEmpty
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: ((context, index) => ContactTile(
                            contact: contacts[index],
                            onPressedDelete: (contactId) async {
                              await ContactsService.deleteContact(contactId);
                              //again i have to do this beacuse delete contact doesn't give me the deletedContact
                              fetchContactsData();
                            },
                            onPressedEdit: ((id, name, email, phone) async {
                              showDialog(
                                context: context,
                                builder: ((context) => EditGuestDialog(
                                      id: id,
                                      name: name,
                                      email: email,
                                      phone: phone,
                                      onDataSaved: (id, newName, newEmail,
                                          newPhone) async {
                                        await ContactsService.updateContact(
                                            id, newName, newEmail, newPhone);
                                        fetchContactsData();
                                        Navigator.of(context).pop();
                                      },
                                    )),
                              );
                            }),
                          )),
                      itemCount: contacts.length,
                    ),
                  ),
                )
              : const NoGuestsFound()
        ],
      ),
    );
  }
}
