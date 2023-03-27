import 'package:film/modele/data/remote/modeles/se_connecter_modele.dart';
import 'package:film/modele/data/remote/repositories/inscription_repositorie.dart';
import 'package:film/shared/global_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'inscription.dart';

class MyPageAccueil extends StatefulWidget {
  const MyPageAccueil({super.key});

  @override
  State<MyPageAccueil> createState() => _MyPageAccueilState();
}

class _MyPageAccueilState extends State<MyPageAccueil> {
  final _formKey = GlobalKey<FormState>();

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
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 20),
          child: Column(children: [
            const Text(
              'Entrer vos identifiant',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Form(
              key: _formKey,
              child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: nameUser,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill your username';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                TextFormField(
                  controller: password,
                  obscureText: passwordIsVisible,
                  decoration: InputDecoration(
                    hintText: 'passwords',
                    suffixIcon: IconButton(
                      icon: (passwordIsVisible == true)
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          passwordIsVisible = !passwordIsVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill your password';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(
                            'valeur de identifiant : ${nameUser.text} - ${password.text}');
                        ConnecterModele modele = ConnecterModele(
                            username: nameUser.text, password: password.text);
                        InscriptionRepositorie connexion =
                            InscriptionRepositorie();
                        connexion.logger(
                            endpoint: urlLogger,
                            queryBody: modele.toMap(),
                            headerContentType: "application/json",
                            headerAccept: "*/*");
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('Sumit')),
              ],
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Text.rich(TextSpan(
                style: const TextStyle(color: Colors.grey, fontSize: 15),
                children: [
                  const TextSpan(text: "Cliquez sur le lien "),
                  TextSpan(
                      text: "s'inscrire",
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const IncrireScreen()));
                        }),
                  const TextSpan(text: " si vous n'avez pas de compte"),
                ])),
          ]),
        ),
      ),
    );
  }
}
