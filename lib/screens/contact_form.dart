import 'package:alura/database/contact_dao.dart';
import 'package:alura/model/contact_model.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Contact"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Full Name:"),
              controller: this._nameController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Acccount Number:"),
              controller: this._accountController,
            ),
            ElevatedButton(
              onPressed: () {
                final String name = _nameController.text;
                final String accountNumber = _accountController.text;

                final ContactModel newContact =
                    ContactModel(0, name, int.tryParse(accountNumber));
                ContactDao()
                    .save(newContact)
                    .then((id) => Navigator.pop(context));
              },
              child: Text("Create"),
            )
          ],
        ),
      ),
    );
  }
}
