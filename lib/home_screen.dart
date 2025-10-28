import 'package:flutter/material.dart';
import 'package:project_pertama/main.dart';
import 'package:project_pertama/register_screen.dart';

class HomeScreen extends StatefulWidget {
  final String nama;
  const HomeScreen({super.key, this.nama = "Default"});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _nomorTelpController = TextEditingController();
  final List<String> daftarNomorTelp = [];
  final _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Halo, ${widget.nama}"),
                Form(
                  key: _globalKey,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _nomorTelpController,
                          decoration: InputDecoration(
                            label: Text("Nama: "),
                            hintText: "Masukan nama",
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (_globalKey.currentState!.validate()) {
                            setState(() {
                              daftarNomorTelp.add(_nomorTelpController.text);
                              _nomorTelpController.clear();
                            });
                          }
                        },
                        child: Text("Submit"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: daftarNomorTelp.length,
                    itemBuilder: (context, index) {
                      return Text(daftarNomorTelp[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
