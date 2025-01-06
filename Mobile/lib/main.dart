import 'package:figma_design1/view/clients_mobile.dart';
import 'package:figma_design1/view/create_clients_mobile.dart';
import 'package:figma_design1/view/create_expense_mobile.dart';
import 'package:figma_design1/view/create_transctions_mobile.dart';
import 'package:figma_design1/view/login_mobile.dart';
import 'package:figma_design1/view/sidebar_mobile.dart';
import 'package:figma_design1/view/signup_mobile.dart';
import 'package:figma_design1/view/transactions_mobile.dart';
import 'package:figma_design1/view/expense_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),

      // home: CreateClientsMobile(),
      // home: Clients(),
      // home: SignupMobile(),
      home: LoginMobile(),
      // home: TransactionsMobile(),
      // home:CreateExpenseMobile(),
      // home:ExpenseMobile(),
      // home:CreateTransactionPage(),
    );
  }
}
