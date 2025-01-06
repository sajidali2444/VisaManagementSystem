import 'package:figma_design1/view/sidebar_mobile.dart';
import 'package:figma_design1/view/widgets/delete_transactions_dialog.dart';
import 'package:flutter/material.dart';
import '../Model/transactions_models.dart';
import 'create_transctions_mobile.dart';

class TransactionsMobile extends StatelessWidget {
  // List of transactions using the model
  final List<TransactionsModels> transactions = [
    TransactionsModels(
        name: "Abdul",
        date: "12/25/24",
        fathername: "Furqan",
        passportNo: "224455",
        paymentdate: "12/25/24",
        totalDeal: "\$5004",
        receivedamount: "\$404",
        paidamount: "\$223",
        status: "Pending"),
    TransactionsModels(
        name: "Goku Black",
        date: "12/25/24",
        fathername: "Furqan",
        passportNo: "224455",
        paymentdate: "12/25/24",
        totalDeal: "\$5004",
        receivedamount: "\$404",
        paidamount: "\$223",
        status: "Pending"),
    TransactionsModels(
        name: "Goku Black",
        date: "12/25/24",
        fathername: "Furqan",
        passportNo: "224455",
        paymentdate: "12/25/24",
        totalDeal: "\$5004",
        receivedamount: "\$404",
        paidamount: "\$223",
        status: "Pending"),
    TransactionsModels(
        name: "Goku Black",
        date: "12/25/24",
        fathername: "Furqan",
        passportNo: "224455",
        paymentdate: "12/25/24",
        totalDeal: "\$5004",
        receivedamount: "\$404",
        paidamount: "\$223",
        status: "Pending"),
    TransactionsModels(
        name: "Goku Black",
        date: "12/25/24",
        fathername: "Furqan",
        passportNo: "224455",
        paymentdate: "12/25/24",
        totalDeal: "\$5004",
        receivedamount: "\$404",
        paidamount: "\$223",
        status: "Pending"),
    TransactionsModels(
        name: "Goku Black",
        date: "12/25/24",
        fathername: "Furqan",
        passportNo: "224455",
        paymentdate: "12/25/24",
        totalDeal: "\$5004",
        receivedamount: "\$404",
        paidamount: "\$223",
        status: "Pending"),
    TransactionsModels(
        name: "Goku Black",
        date: "12/25/24",
        fathername: "Furqan",
        passportNo: "224455",
        paymentdate: "12/25/24",
        totalDeal: "\$5004",
        receivedamount: "\$404",
        paidamount: "\$223",
        status: "Pending"),



    // Add more Transactions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transactions",
          style: TextStyle(
              fontSize: 20, fontFamily: "Poppins", fontWeight: FontWeight.w700),
        ),
        // leading: IconButton(onPressed: () {
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => SidebarMobile()));
        // }, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                // CupertinoIcons.search,
                Icons.search,
                color: Color(0xffC60000),
              ))
        ],
      ),
      drawer: SidebarMobile(),
      body: Column(
        children: [
          // Create New Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  // Create new action
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateTransactionPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffC60000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16,horizontal: 85),
                ),
                child: Text(
                  "Create New",
                  style: TextStyle(fontSize:20,fontFamily: "Poppins", color: Colors.white),
                ),
              ),
            ),
          ),

          // List of Clients
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final client = transactions[index];
                return Container(
                  // height: 10,
                  margin: EdgeInsets.only(top: 16),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFC6CAD6), width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  child: ExpansionTile(
                    title: Row(
                      children: [
                        Text(
                          "Name:   ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontFamily: "Poppins"
                          ),
                        ),
                        Text(
                          client.name,
                          style: TextStyle(fontSize: 16,fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.red,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDetailRow("Date", client.date),
                            _buildDetailRow("Father name", client.fathername),
                            _buildDetailRow("Passport No", client.passportNo),
                            _buildDetailRow("Payment Date", client.paymentdate),
                            _buildDetailRow("Total Deal", client.totalDeal),
                            _buildDetailRow("Received amount", client.receivedamount),
                            _buildDetailRow("Paid amount", client.paidamount),
                            _buildStatusRow(client.status),
                            SizedBox(height: 8),
                            _buildActionRow(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0,top: 8.0),
      child: Row(
        children: [
          Text(
            "$label:   ",
            style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,fontFamily: "Poppins"),
          ),
          Text(value,style: TextStyle(fontFamily: "Poppins"),),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String status) {
    Color statusColor = status == "Pending" ? Colors.green : Colors.grey;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0,top: 8.0),
      child: Row(
        children: [
          Text(
            "Status:   ",
            style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),
          ),
          Icon(Icons.circle, color: statusColor, size: 16),
          SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(fontSize:16, color: statusColor,fontFamily: "Poppins"),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow(BuildContext context) {
    return Row(
      children: [
        Text(
          "Action: ",
          style: TextStyle(fontSize:16, fontWeight: FontWeight.bold,fontFamily: "Poppins"),
        ),
        IconButton(
          icon: Icon(Icons.delete, color: Colors.red,),
          onPressed: () {
            showDeleteDialog(context);
          },
        ),
        IconButton(
          icon: Icon(Icons.edit, color: Colors.black),
          onPressed: () {
            // Edit action
          },
        ),
      ],
    );
  }
}
void showDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete Transaction',style: TextStyle(fontFamily: "Poppins"),),
        content: const Text(
            'Are you sure that you want to delete this Transaction permanently?',
        // style: TextStyle(fontFamily: "Poppins"),
        ),
        actions: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(10), // Rounded corners
                ),
                backgroundColor: Colors.grey.shade200
                // side: BorderSide(color: Colors.black,width: 2),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                // Cancel functionality
              },
              child:  Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(10), // Rounded corners
                ),
              ),
              onPressed: () {
                // Create functionality
              },
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: Color(0xffC60000),
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ]),
        ],
      );
    },
  );
}
