import 'dart:convert';

import 'package:yabi_test/entities/contact_entitiy.dart';

import 'package:http/http.dart' as http;

class ContactsService {
  static const String baseUrl = 'http://tapi.yabi.cloud/api';

  static Future<void> createContact(
      String contactName, String contactEmail, String contactPhone) async {
    final contactData = {
      'name': contactName,
      'email': contactEmail,
      'phone': contactPhone
    };
    http.Response response = await http.post(
      Uri.parse('$baseUrl/create/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(contactData),
    );
  }

  static Future<void> deleteContact(String contactId) async {
    final contactData = {
      'id': contactId,
    };
    http.Response response = await http.post(
      Uri.parse('$baseUrl/delete/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(contactData),
    );
  }

  static Future<void> updateContact(String contactId, String contactName,
      String contactEmail, String contactPhone) async {
    final contactData = {
      'id': contactId,
      'name': contactName,
      'email': contactEmail,
      'phone': contactPhone
    };
    http.Response response = await http.post(
      Uri.parse('$baseUrl/update/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(contactData),
    );
  }

  static Future<List<Contact>> getAllContacts() async {
    List<Contact> contacts = [];
    http.Response response = await http.get(
      Uri.parse('$baseUrl/read/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> contactsData = jsonDecode(response.body);
      List<dynamic> data = contactsData["body"] ?? [];
      contacts.addAll(data.map((contact) => Contact.fromJson(contact)));
      return contacts;
    } else {
      throw Exception('Failed to get all Contacts.');
    }
  }
}
