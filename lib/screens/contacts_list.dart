import 'package:alura/database/contact_dao.dart';
import 'package:alura/model/contact_model.dart';
import 'package:alura/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: FutureBuilder<List<ContactModel>>(
          initialData: List(),
          future: ContactDao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
                break;
              case ConnectionState.waiting:
                Center(child: CircularProgressIndicator());
                break;
              case ConnectionState.done:
                final List<ContactModel> contacts = snapshot.data;
                return ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final ContactModel contact = contacts[index];
                    return _ContactItem(contact);
                  },
                );
                break;
            }
            return Text('Erro no carregamento');
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ContactForm()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final ContactModel contact;
  _ContactItem(this.contact);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
