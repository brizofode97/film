import 'package:film/modele/data/remote/modeles/inscription_modele.dart';
import 'package:film/modele/data/remote/repositories/inscription_repositorie.dart';
import 'package:film/shared/global_endpoint.dart';
import 'package:flutter/material.dart';

class MyFormulaire extends StatefulWidget {

  final String role;
  final String fieldPrenom;
  final String fieldNom;
  final String fieldNomUtilisateur;
  final String fieldEmail;

  const MyFormulaire({
    required this.role,
    required this.fieldPrenom, 
    required this.fieldNom,
    required this.fieldNomUtilisateur,
    required this.fieldEmail,
    super.key});

  @override
  State<MyFormulaire> createState() => _MyFormulaireState();
}

class _MyFormulaireState extends State<MyFormulaire> {

  final _formKey = GlobalKey<FormState>();

  late TextEditingController valPrenom;
  late TextEditingController valNom;
  late TextEditingController valNomUtilisateur;
  late TextEditingController valEmail;

  @override
  void initState() {
    valPrenom = TextEditingController();
    valNom = TextEditingController();
    valNomUtilisateur = TextEditingController();
    valEmail = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            TextFormField(
              controller: valPrenom,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: widget.fieldPrenom,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                errorBorder: const OutlineInputBorder(borderSide: BorderSide.none)
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please fill your fist name';
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            TextFormField(
              controller: valNom,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: widget.fieldNom,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                errorBorder: const OutlineInputBorder(borderSide: BorderSide.none)
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please fill your last name';
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            TextFormField(
              controller: valNomUtilisateur,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: widget.fieldNomUtilisateur,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                errorBorder: const OutlineInputBorder(borderSide: BorderSide.none)
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please fill your name user';
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            TextFormField(
              controller:  valEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: widget.fieldEmail,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), ),
                errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please fill your mail';
                }
                if(!value.contains('@') || !value.contains('.')){
                  return 'Check the text typed if it is a real gmail';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  InscriptionModele modele = InscriptionModele( 
                    firstName: valPrenom.text, 
                    lastName: valPrenom.text, 
                    username: valNomUtilisateur.text, 
                    email: valEmail.text,
                    role: widget.role,);
                    InscriptionRepositorie inscription = InscriptionRepositorie();
                    inscription.registrer(
                      endpoint: urlregistrer, 
                      queryBody: modele.toMap(), 
                      headerContentType: "application/json", 
                      headerAccept: "*/*");
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
                }
             },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
      
    );
  }
}