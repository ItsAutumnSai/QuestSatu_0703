import 'package:flutter/material.dart';
import 'package:project_pertama/main.dart';
import 'package:project_pertama/register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: Text("Persib App", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        backgroundColor: Colors.blue[500],
        leading: Padding(padding: const EdgeInsets.only(left:8), child: Image.asset('assets/images/Logo_Persib_Bandung.png')),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white,),
            onPressed: () {
              print("Settings");
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jadwal Pertandingan Persib Bandung", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
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
