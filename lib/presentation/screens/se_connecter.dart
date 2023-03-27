import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'inscription.dart';

class MyPageAccueil extends StatefulWidget {
  const MyPageAccueil({super.key});

  @override
  State<MyPageAccueil> createState() => _MyPageAccueilState();
}

class _MyPageAccueilState extends State<MyPageAccueil> {

  late TextEditingController nameUser;
  late TextEditingController password;
  late bool passwordIsVisible;

  @override
  void initState() {
    nameUser = TextEditingController();
    password = TextEditingController();
    passwordIsVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Account"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 20),
          child: Column(
            children: [
              const Text('Entrer vos identifiant',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: nameUser,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              TextField(
                controller: password,
                obscureText: passwordIsVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: (passwordIsVisible == true) 
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility), 
                    onPressed: () {
                      setState(() {
                        passwordIsVisible = !passwordIsVisible;
                      });
                    },),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),   
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Text.rich(
                TextSpan(
                  style:  const TextStyle(color: Colors.grey, fontSize: 15),
                  children: [
                    const TextSpan(text: "Cliquez sur le lien "),
                    TextSpan(text: "s'inscrire", 
                    style:  const TextStyle(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const IncrireScreen()));
                }
                    ),
                    const TextSpan(text: " si vous n'avez pas de compte"),
                  ] 
                )),
            ]),
        ),
      ),
    );
  }
}