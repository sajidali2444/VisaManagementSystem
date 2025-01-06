import 'package:figma_design1/view/login_mobile.dart';
import 'package:figma_design1/view/transactions_mobile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'clients_mobile.dart';

class SignupMobile extends StatelessWidget {
  const SignupMobile({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller=TextEditingController();
    TextEditingController passwordcontroller=TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            height: 450,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image.png'), // Replace with your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Image.asset(
          //   'assets/image.png',
          //   fit: BoxFit.fill,
          //   width: double.infinity,
          //   height:double.infinity,
          // ),
          Column(
            children: [
              const Expanded(
                flex: 3,
                child: SizedBox(
                  height: 10,
                ),
              ),
              Expanded(
                flex: 12,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Welcome Text
                          Text(
                            "Create Account",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontFamily: "Poppins"),
                          ),
                          SizedBox(height: 24,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Google Button
                                buildSocialButton(
                                  // icon: FontAwesomeIcons.google,
                                  iconimage: "assets/images/devicon_google.png",
                                  onPressed: () {
                                    print("Google login pressed");
                                  },
                                ),
                                const SizedBox(width: 16), // Spacing between buttons

                                // Facebook Button
                                buildSocialButton(
                                  // icon: FontAwesomeIcons.facebookF,
                                  iconimage: "assets/images/logos_facebook.png",
                                  onPressed: () {
                                    print("Facebook login pressed");
                                  },
                                ),
                                const SizedBox(width: 16), // Spacing between buttons

                                // GitHub Button
                                buildSocialButton(
                                  // icon: FontAwesomeIcons.github,
                                  iconimage: "assets/images/akar-icons_github-fill.png",
                                  onPressed: () {
                                    print("GitHub login pressed");
                                  },
                                ),
                              ]),
                          SizedBox(height: 24,),
                          // OR Divider
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 1.5,
                                  color: Color(0xffC6CAD6),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text("OR",
                                  style: TextStyle(
                                    color: Color(0xffC6CAD6),),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 1.5,
                                  color: Color(0xffC6CAD6),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24,),
                          _buildTextField("First name", "First name",
                          ),
                          SizedBox(height: 8,),
                          _buildTextField("Last name", "Last name"),
                          _buildTextField("Email/Phone number", "Email/Phone number"),
                          SizedBox(height: 8,),
                          _buildPasswordTextField("Password", "password"),
                          SizedBox(height: 24,),
                          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                            TextButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginMobile()),
                              );
                            },
                                child: Text("Login",
                                    style: TextStyle(
                                      // fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.red,
                                      decorationStyle: TextDecorationStyle.solid,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                    ))),
                            const SizedBox(
                              width: 24,
                            ),
                            Container(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffC60000),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10), // Rounded corners
                                  ),
                                ),
                                onPressed: () {
                                  // Signup functionality
                                  if (_formKey.currentState!.validate()) {
                                    // Handle create action
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => TransactionsMobile()),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                  ),
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
            ],
          ),
        ],
      ),
    );
  }
}
// Widget for social login button
Widget buildSocialButton({
  // required IconData icon,
  required VoidCallback onPressed,
  required String iconimage,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color:Color(0xffC6CAD6),width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      // child: Icon(icon, color: Colors.black, size: 24),
      child: Image.asset(iconimage,fit: BoxFit.fill,height: 40,width: 40,),
    ),
  );
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
Widget _buildPasswordTextField(String label, String hint) {
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
        obscureText: true,
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