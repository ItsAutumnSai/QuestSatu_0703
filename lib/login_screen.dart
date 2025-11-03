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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    //get screen size
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Logo_Persib_Bandung.png', width:200, fit:BoxFit.fitWidth),
                Text("Selamat Datang Bobotoh!", style: TextStyle(fontSize: screenWidth/20, color: Colors.blue[800], fontWeight: FontWeight.bold),),
                SizedBox(height: 10),
                Text("Silahkan login untuk melanjutkan ke aplikasi Persib Bandung Official.", style: TextStyle(fontSize: screenWidth/30), textAlign: TextAlign.center,),
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
                    label: Text("Email", style: TextStyle(fontSize: screenWidth/30),),
                    hintText: "Only enter email with @gmail.com postfix.",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password tidak boleh kosong.";
                    } else if (value.length < 6) {
                      return "Masukan minimal 6 karakter.";
                    }
                    return null;
                  },
                  obscureText: _isObscure,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: Text("Password", style: TextStyle(fontSize: screenWidth/30),),
                    hintText: "Minimum of 6 characters.",
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen()),);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set the background color to blue
                  foregroundColor: Colors.white, // Set the text/icon color to white for contrast
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Optional: Add padding
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                  minimumSize: const Size.fromHeight(50),
                ),
                  child: Text("Login", style: TextStyle(fontSize: screenWidth/30),),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Apakah belum punya akun? "),
                    GestureDetector(
                      onTap: () {
                        // navigate to your register page
                        Navigator.push(context, MaterialPageRoute(builder:  (context) => RegisterScreen()));
                      },
                      child: Text(
                        "Daftar disini!",
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
