import 'dart:io';

import 'package:riverpod/riverpod.dart';
import 'package:prelim_mobiledev/global_providers.dart';

Future<void> main() async {
  final container = ProviderContainer();
  final contactService = container.read(contactServiceProvider);

  while (true) {
    print('\nContacts');
    print('1. Add Contact.');
    print('2. View Contacts');
    print('3. Edit Contact');
    print('4. Delete Contact');
    print('5. Exit');
    print('Enter choice: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1': //add new contact
        print('Enter Number: ');
        String number = stdin.readLineSync()!;
        if (number.length == 11 && int.tryParse(number) != null) {
          int inpnumber = int.parse(number);
          print('Number: $inpnumber');

          print('Enter Name: ');
          String? name = stdin.readLineSync();
          if (name != null) {
            contactService.addContact(name, number);
          } else {
            print("Please enter a valid name.");
          }
        } else {
          print("Please enter a valid number");
        }

        break;

      case '2': //view contacts
        contactService.viewContacts();
        break;

      case '3': //edit existing contact information
        print('Enter the name of the contact to update: ');
        String oldName = stdin.readLineSync()!;

        print('Enter the new name: ');
        String newName = stdin.readLineSync()!;

        print('Enter the new number: ');
        String newNumber = stdin.readLineSync()!;

        if (newNumber.length == 11 && int.tryParse(newNumber) != null) {
          contactService.updateContact(oldName, newName, newNumber);
        } else {
          print("Please enter a valid number.");
        }
        break;

      case '4': //delete contact
        print('\nEnter the contact name to delete: ');
        String name = stdin.readLineSync()!;
        contactService.deleteContact(name);
        break;

      case '5':
       print('Exiting...');
        exit(0);

      default:
        print('Invalid option. Please try again.');
        break;
    }
  }
}
