import 'package:figma_design1/view/expense_mobile.dart';
import 'package:figma_design1/view/transactions_mobile.dart';
import 'package:flutter/material.dart';

import '../Model/clients_model.dart';
import 'clients_mobile.dart';
class SidebarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drawer Header
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/sidebar.png', // Replace with your logo asset
                    height: 50,
                  ),
                ],
              ),
            ),

            // Sidebar Options
            ListTile(
              leading: Icon(Icons.list_alt, color: Color(0xffC6CAD6)),
              title: Text(
                "Transactions",
                style: TextStyle(color: Color(0xffC6CAD6),fontFamily: "Poppins"),
              ),
              onTap: () {
                // Navigate to Transactions page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransactionsMobile()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_chart, color: Color(0xffC60000)),
              title: Text(
                "Expenses",
                style: TextStyle(color: Color(0xffC60000),fontFamily: "Poppins"),
              ),
              tileColor: Color(0xffC60000).withOpacity(0.1),
              onTap: () {
                // Navigate to Expenses page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExpenseMobile()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Color(0xffC6CAD6)),
              title: Text(
                "Clients",
                style: TextStyle(color: Color(0xffC6CAD6),fontFamily: "Poppins"),
              ),
              onTap: () {
                // Navigate to Clients page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Clients()),
                );
              },
            ),
          ],
        ),
      );
  }
}