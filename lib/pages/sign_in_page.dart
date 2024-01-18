import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController surnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final firebaseAuthInstance = FirebaseAuth.instance;
    Future<void> signUpWithEmail(String email, password) async {
      try {
        UserCredential userCredential =
            await firebaseAuthInstance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        User? user = userCredential.user;

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .set({
          'name': nameController.text,
          'surname': surnameController.text,
          'email': emailController.text,
        });

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Name'),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Surname'),
            TextFormField(
              controller: surnameController,
              decoration: const InputDecoration(
                hintText: 'Enter your surname',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Email'),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Password'),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                signUpWithEmail(emailController.text, passwordController.text);
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
