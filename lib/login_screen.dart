import 'package:flutter/material.dart';
import 'package:project_pertama/home_screen.dart';
import 'package:project_pertama/main.dart';
import 'package:project_pertama/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _globalKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login Screen"),
                TextFormField(
                  controller: _namaController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama tidak boleh kosong";
                    } else if (value ==
                        RegExp(r'^[^@]+@[^@]+\.[^@]+$').toString()) {
                      return "Nama tidak valid";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Nama"),
                    hintText: "Masukan nama, ex: Budi",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password tidak boleh kosong.";
                    } else if (value.length < 7) {
                      return "Password minimal 8 karakter.";
                    }
                    return null;
                  },
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    label: Text("Password"),
                    hintText: "Masukan password.",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen(nama: _namaController.text),
                        ),
                      );
                    }
                  },
                  child: Text("Login"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Logout"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
