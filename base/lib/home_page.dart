import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:sears_test_cognito/home_controller.dart';
import 'package:sears_test_cognito/service_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  final authentication = getIt.get<AuthUserApp>();

  @override
  void initState() {
    super.initState();
    //controller.configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () async {
                await authentication.signout();
                setState(() {});
              },
              child: const Text('Signout')),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () async {
                await authentication.signIn(
                    user: 'felipeassis97@gmail.com', password: 'Kjgd@485');
                setState(() {});
              },
              child: const Text('Signin')),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () async {
                await authentication.getCurrentUser();
                setState(() {});
              },
              child: const Text('Current User')),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () async {
                await authentication.getToken();
                setState(() {});
              },
              child: const Text('Token User')),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () async {
                await authentication.createUser(
                  user: 'felipe.assis@wahalla.com',
                  password: 'Kjgd@485',
                );
                setState(() {});
              },
              child: const Text('Create User')),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () async {
                await controller.code();
                setState(() {});
              },
              child: const Text('Confirm User')),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () async {
                await controller.resendCode();
                setState(() {});
              },
              child: const Text('Resend User')),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () async {
                await controller.updatePassword();
                setState(() {});
              },
              child: const Text('Update Password')),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () async {
                await controller.resetPassword();
                setState(() {});
              },
              child: const Text('Reset Password')),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () async {
                await controller.confirmResetPassword();
                setState(() {});
              },
              child: const Text('Confirm Reset Password')),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
