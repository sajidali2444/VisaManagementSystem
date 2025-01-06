import 'package:figma_design1/view/sidebar_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CreateExpenseMobile extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  CreateExpenseMobile({super.key});
  String _selectedOption = 'Company';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense",
          style: TextStyle(
              fontSize: 20, fontFamily: "Poppins", fontWeight: FontWeight.w700),
        ),
        // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            height: 1190,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFC6CAD6), width: 2),
                borderRadius: BorderRadius.circular(15)),

            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create New Expense type',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildTextField("Expense Tile", "Expense Tile",
                          (value) {
                        if (value == null || value.isEmpty) {
                          return 'Client name is required';
                        }
                        if (!RegExp(r'^[a-zA-Z0-9\s\-]{3,50}$').hasMatch(value)) {
                          return 'Expense title must be 3-50 characters and contain only letters, numbers, spaces, or hyphens';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16,),
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
                    Expanded(
                      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField(String label, String hint,final String? Function(String?)? validator) {
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
        validator: (value) =>
        value == null || value.isEmpty ? "Please enter $hint" : null,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 12,
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
      ),
      const SizedBox(height: 16),
    ],
  );
}


