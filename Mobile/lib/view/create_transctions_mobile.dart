import 'package:figma_design1/view/sidebar_mobile.dart';
import 'package:flutter/material.dart';

class CreateTransactionPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transactions",
          style: TextStyle(
              fontSize: 20, fontFamily: "Poppins", fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Color(0xffC60000),
            ),
          ),
        ],
      ),
      drawer: SidebarMobile(), // Replace with your SidebarMobile if implemented
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFC6CAD6), width: 2),
                borderRadius: BorderRadius.circular(15)),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create New Transaction",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"),
                    ),
                    const SizedBox(height: 16),
                    // Select Client Dropdown
                    _buildDropdownField("Select Client","Select Client", ["Client 1", "Client 2"]),
                    const SizedBox(height: 16),
                    const Text(
                      "Finance Details",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"),
                    ),
                    const SizedBox(height: 16),
                    // Finance Details Fields
                    _buildTextField("Total deal","Total deal"),
                    _buildDropdownField("Select Currency","Select Currency", ["USD", "AED", "PKR"]),
                    _buildTextField("Current Dhiram Rate","Current Dhiram Rate"),
                    _buildTextField("Total Receiving Amount","Total Receiving Amount"),
                    _buildTextField("Received Amount","Received Amount"),
                    _buildTextField("Pending Amount","Pending Amount"),
                    const Text(
                      "Attach Payment Invoice",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"),
                    ),
                    const SizedBox(height: 8),
                    // Attach File Button
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Implement file picker logic
                        },
                        icon: const Icon(Icons.attach_file,color: Color(0xffC6CAD6)),
                        label: Align(
                          alignment: Alignment.centerLeft,
                          child: const Text("Click to Upload Files",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffC6CAD6),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                          ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: const BorderSide(color: Color(0xffC6CAD6),width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                          ),
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.black,width: 2),
                        ),
                        onPressed: () {
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
                          backgroundColor: Color(0xffC60000),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle create action
                          }
                          // Create functionality
                        },
                        child: const Text(
                          'Create',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Dropdown Field
  Widget _buildDropdownField(String hint,String label, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "Poppins",
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xffC6CAD6),
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
              borderSide: const BorderSide(
                  color: Color(0xffC6CAD6), width: 2), // Border color and width
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(10), // Rounded corners when focused
              borderSide: const BorderSide(
                  color: Color(0xffC6CAD6), width: 2), // Focused border color
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(10), // Rounded corners when enabled
              borderSide: const BorderSide(
                  color: Color(0xffC6CAD6), width: 2), // Enabled border color
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem(
            value: item,
            child: Text(item),
          ))
              .toList(),
          onChanged: (value) {
            // Handle selection
          },
          validator: (value) => value == null ? "Please $hint" : null,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // Text Field
  Widget _buildTextField(String label,String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "Poppins",
            )),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xffC6CAD6),
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
              borderSide: const BorderSide(
                  color: Color(0xffC6CAD6), width: 2), // Border color and width
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(10), // Rounded corners when focused
              borderSide: const BorderSide(
                  color: Color(0xffC6CAD6), width: 2), // Focused border color
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(10), // Rounded corners when enabled
              borderSide: const BorderSide(
                  color: Color(0xffC6CAD6), width: 2), // Enabled border color
            ),
          ),
          validator: (value) =>
          value == null || value.isEmpty ? "Please enter $hint" : null,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // Date Picker Field
  Widget _buildDatePickerField(BuildContext context, String hint) {
    TextEditingController dateController = TextEditingController();
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          dateController.text =
          "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: dateController,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xffC6CAD6),
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
              borderSide: const BorderSide(
                  color: Color(0xffC6CAD6), width: 2), // Border color and width
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(10), // Rounded corners when focused
              borderSide: const BorderSide(
                  color: Color(0xffC6CAD6), width: 2), // Focused border color
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(10), // Rounded corners when enabled
              borderSide: const BorderSide(
                  color: Color(0xffC6CAD6), width: 2), // Enabled border color
            ),
          ),
          validator: (value) =>
          value == null || value.isEmpty ? "Please select a date" : null,
        ),
      ),
    );
  }
}
