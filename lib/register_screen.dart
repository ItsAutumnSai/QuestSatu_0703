import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_pertama/home_screen.dart';
import 'package:project_pertama/main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _telnoController = TextEditingController();
  String? _genderController;
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _pwdConfirmController = TextEditingController();
  bool _isObscureMainPwd = true;
  bool _isObscureSecondPwd = true;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Text("Selamat Datang Bobotoh!", style: TextStyle(fontSize: screenWidth/20, color: Colors.blue[800], fontWeight: FontWeight.bold),),
                SizedBox(height: 10),
                Text("Silahkan daftar untuk melanjutkan ke aplikasi Persib Bandung Official.", style: TextStyle(fontSize: screenWidth/30), textAlign: TextAlign.center,),
                SizedBox(height: 10),
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama tidak boleh kosong.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Nama", style: TextStyle(fontSize: screenWidth/30),),
                    hintText: "Masukan nama anda.",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  controller: _addressController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Alamat tidak boleh kosong.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Alamat", style: TextStyle(fontSize: screenWidth/30),),
                    hintText: "Masukan domisili alamat anda.",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  controller: _telnoController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nomor telepon tidak boleh kosong.";
                    } else if (RegExp(r'^[0-9]+$').hasMatch(value) == false) {
                      return "Hanya masukan angka.";
                    } else if (value.length < 10 || value.length > 15) {
                      return "Panjang nomor telepon 10 - 15 digit.";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    label: Text("Nomor Telepon", style: TextStyle(fontSize: screenWidth/30),),
                    hintText: "Masukan nomor telepon anda.",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jenis Kelamin",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: screenWidth/30, color: Colors.black54),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RadioMenuButton<String>(
                          value: "Laki-laki",
                          groupValue: _genderController,
                          onChanged: (value) => setState(() => _genderController = value),
                          child: const Text("Laki-laki"),
                        ),
                        SizedBox(width: screenWidth/6),
                        RadioMenuButton<String>(
                          value: "Perempuan",
                          groupValue: _genderController,
                          onChanged: (value) => setState(() => _genderController = value),
                          child: const Text("Perempuan"),
                        ),
                      ],
                    ),
                  ],
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email tidak boleh kosong.";
                    } else if (!RegExp(r'@gmail.com').hasMatch(value)) {
                      return "Email perlu berakhiran @gmail.com";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text("Email"),
                    hintText: "Masukan email, ex: @",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  controller: _pwdController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password tidak boleh kosong.";
                    } else if (value.length < 6) {
                      return "Masukan minimal 6 karakter.";
                    }
                    return null;
                  },
                  obscureText: _isObscureMainPwd,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: Text("Password", style: TextStyle(fontSize: screenWidth/30),),
                    hintText: "Masukan minimal 6 karakter.",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureMainPwd ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureMainPwd = !_isObscureMainPwd;
                        });
                      },
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  controller: _pwdConfirmController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password tidak boleh kosong.";
                    } else if (value.length < 6) {
                      return "Masukan minimal 6 karakter.";
                    } else if (value != _pwdController.text) {
                      return "Input tidak sama dengan password.";
                    }
                    return null;
                  },
                  obscureText: _isObscureSecondPwd,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: Text("Confirm Password", style: TextStyle(fontSize: screenWidth/30),),
                    hintText: "Masukan minimal 6 karakter.",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureSecondPwd ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureSecondPwd = !_isObscureSecondPwd;
                        });
                      },
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      log("message");
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set the background color to blue
                  foregroundColor: Colors.white, // Set the text/icon color to white for contrast
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Optional: Add padding
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                  minimumSize: const Size.fromHeight(50),
                ),
                  child: Text("Submit", style: TextStyle(fontSize: screenWidth/30),),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Apakah sudah punya akun? "),
                    GestureDetector(
                      onTap: () {
                        // navigate to your register page
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Masuk disini!",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
