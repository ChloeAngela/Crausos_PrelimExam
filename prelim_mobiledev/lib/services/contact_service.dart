import 'package:riverpod/riverpod.dart';
import 'package:prelim_mobiledev/models/contact.dart';

class ContactService {
  final Ref container;

  final List<Contact> _contacts = [];

  ContactService(this.container);

  //add a contact
  void addContact(String name, String number) {
    final newContact = Contact(name, number);
    _contacts.add(newContact);
    print('$name(Number: $number) has been added.');
  }

  //show existing contact/s
  void viewContacts() {
    if (_contacts.isEmpty) {
      print('Contact does not exist.');
    } else {
      print('\nContacts: ');
      for (var contact in _contacts) {
        print(contact.toString());
      }
    }
  }

 void updateContact(String oldName, String newName, String newNumber) {
    final index = findContactIndex(oldName);
    if (index != null) {
      _contacts[index] = Contact(newName, newNumber);
      print('Contact updated: ${_contacts[index]}');
    } else {
      print('Contact with name "$oldName" not found.');
    }
  }
  int? findContactIndex(String name) {
    return _contacts.indexWhere(
        (contact) => contact.name.toLowerCase() == name.toLowerCase());
  }
  

  void deleteContact(String name) {
    _contacts.removeWhere((contact) => contact.name == name);
    print('$name is successsfuly deleted');
  }
}
