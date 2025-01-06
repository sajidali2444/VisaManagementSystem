import 'package:figma_design1/view/sidebar_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CreateClientsMobile extends StatelessWidget {
  CreateClientsMobile({super.key});
  String _selectedOption = 'Company';
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
            height: 1450,
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
                      'Create New Transaction',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Type',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Radio<String>(
                        value: 'Company',
                        activeColor: Colors.red,
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          _selectedOption = value!;
                        },
                      ),
                      const Text(
                        'Company',
                        style: TextStyle(
                          color: Color(0xffB6B6B6),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Radio<String>(
                        value: 'One Person',
                        activeColor: Colors.red,
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          _selectedOption = value!;
                        },
                      ),
                      const Text(
                        'One Person',
                        style: TextStyle(
                          color: Color(0xffB6B6B6),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ]),

                    const SizedBox(height: 16),
                    _buildDatePickerField(context,"Apply Date"),
                    _buildTextField("Company name", "Full name",),
                    _buildDatePickerField(context,"Payment Date"),
                    const SizedBox(height: 16),
                    const Text(
                      'Visa Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(
                      thickness: 1, // Line thickness
                      color: Color(0xFFC6CAD6), // Line color
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // _buildVisaDetails(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Visa 1 details',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.black),
                            onPressed: () {
                              // Delete visa details
                            },
                          ),
                        ]),
                    const SizedBox(height: 16),
                    _buildTextField("Client name", "Full name",),
                    _buildTextField("Passport no", "Passport number",),
                    _buildTextField("Nationality", "Nationality",),
                    _buildDatePickerField(context,"Expiry Date"),
                    const SizedBox(height: 16),
                    const Divider(
                      thickness: 1, // Line thickness
                      color: Color(0xFFC6CAD6), // Line color
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle, // Makes the container round
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
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
}

Widget _buildTextField(String label, String hint) {
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

Widget _buildDateField(String label,final String? Function(String?)? validator) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "Poppins",
          )),
      const SizedBox(height: 8),
      TextFormField(
        validator: validator,
        decoration: InputDecoration(
          hintText: 'mm/dd/yy',
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
          suffixIcon: const Icon(Icons.calendar_today_outlined,
              color: Color(0xffC6CAD6)),
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}

// Date Picker Field
Widget _buildDatePickerField(BuildContext context,String label) {
  TextEditingController dateController = TextEditingController();
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(label,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
      )),
  const SizedBox(height: 8),
      GestureDetector(
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
              hintText: 'mm/dd/yy',
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xffC6CAD6),
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
              ),
              suffixIcon: const Icon(Icons.calendar_today_outlined,
                  color: Color(0xffC6CAD6)),
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
      ),
        SizedBox(height: 16,)
    ],
  );
}
Widget _buildVisaDetails() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFC6CAD6), width: 1),
        borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Visa 1 details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.black),
              onPressed: () {
                // Delete visa details
              },
            ),
          ],
        ),
        _buildTextField('Client name', 'Client name',),
        _buildTextField('Passport no', 'Passport number',),
        _buildTextField('Nationality', 'Nationality',),
        _buildDateField('Expiry Date',(String? value) {
          if (value == null || value.isEmpty) {
            return 'Date is required';
          }

          // Basic format validation
          if (!RegExp(r'^(0[1-9]|1[0-2])/(0[1-9]|[12]\d|3[01])/\d{2}$').hasMatch(value)) {
            return 'Enter a valid date in mm/dd/yy format';
          }

          // Extract month, day, and year
          try {
            final parts = value.split('/');
            final int month = int.parse(parts[0]);
            final int day = int.parse(parts[1]);
            final int year = int.parse(parts[2]) + 2000; // Convert `yy` to `yyyy`

            // Check if the date is valid
            final date = DateTime(year, month, day);
            if (date.month != month || date.day != day || date.year != year) {
              return 'Invalid date';
            }
          } catch (e) {
            return 'Invalid date';
          }

          return null; // Valid date
        }),
      ],
    ),
  );
}