import 'package:alura/screens/contacts_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dash"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(
                "images/bytebank_logo.png",
              ),
            ),
            Row(
              children: [
                _FeatureItem(
                  name: "Transfer",
                  icon: Icons.monetization_on,
                  onClick: () => _showContactList(),
                  // onClick: () => Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return ContactsList();
                  //     },
                  //   ),
                  // ),
                ),
                _FeatureItem(
                  name: "Transaction Feed",
                  icon: Icons.description,
                  onClick: () => debugPrint('bacon'),
                  // onClick: () => Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return ContactsList();
                  //     },
                  //   ),
                  // ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showContactList() {
    debugPrint('ads');
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final Function onClick;

  const _FeatureItem({this.icon, this.name = "", @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: this.onClick,
          // onTap: () => Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return ContactsList();
          //     },
          //   ),
          // ),
          child: Container(
            height: 100,
            width: 150,
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  this.icon ?? Icons.people,
                  color: Colors.white,
                  size: 32,
                ),
                Text(
                  this.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
