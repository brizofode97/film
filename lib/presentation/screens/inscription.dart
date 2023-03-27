import 'package:flutter/material.dart';

import '../widgets/form_connexion.dart';

class IncrireScreen extends StatefulWidget {
  const IncrireScreen({super.key});

  @override
  State<IncrireScreen> createState() => _IncrireScreenState();
}

class _IncrireScreenState extends State<IncrireScreen> {
  String imgUser =
      "https://image.freepik.com/vecteurs-libre/silhouette-internaute_23-2147497532.jpg";
  String imgActor =
      "https://th.bing.com/th/id/OIP.Fzh6x71BmEwvlVbj0silkgHaJA?pid=ImgDet&rs=1";
  String imgHomeProduction =
      "https://i.pinimg.com/originals/13/93/ce/1393ceba326d58ab678abca62d8f4e53.jpg";

  bool b_imgUser = true;
  bool b_imgActor = false;
  bool b_imgHomeProduction = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Page Login"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          width: MediaQuery.of(context).size.width / 3.3,
                          height: MediaQuery.of(context).size.height / 8,
                          margin: EdgeInsets.fromLTRB(
                            0,
                            MediaQuery.of(context).size.height / 70,
                            0,
                            MediaQuery.of(context).size.height / 70,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:
                                b_imgUser ? BorderRadius.circular(12) : null,
                            border: b_imgUser
                                ? Border.all(color: Colors.green)
                                : null,
                          ),
                          child: GestureDetector(
                            child: Stack(
                              children: [
                                Image.network(
                                  imgUser,
                                  width: MediaQuery.of(context).size.width / 5,
                                ),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    bottom: 70,
                                    left: 100,
                                    child: Checkbox(
                                        value: b_imgUser,
                                        fillColor: const MaterialStatePropertyAll(
                                            Colors.green),
                                        onChanged: ((value) {
                                          setState(() {
                                            b_imgUser = true;
                                            b_imgActor = false;
                                            b_imgHomeProduction = false;
                                          });
                                        })))
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                b_imgUser = true;
                                b_imgActor = false;
                                b_imgHomeProduction = false;
                              });
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          width: MediaQuery.of(context).size.width / 3.3,
                          height: MediaQuery.of(context).size.height / 8,
                          margin: EdgeInsets.fromLTRB(
                            0,
                            MediaQuery.of(context).size.height / 70,
                            0,
                            MediaQuery.of(context).size.height / 70,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:
                                b_imgActor ? BorderRadius.circular(12) : null,
                            border: b_imgActor
                                ? Border.all(color: Colors.green)
                                : null,
                          ),
                          child: GestureDetector(
                            child: Stack(
                              children: [
                                Image.network(
                                  imgActor,
                                  width: MediaQuery.of(context).size.width / 5,
                                ),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    bottom: 70,
                                    left: 100,
                                    child: Checkbox(
                                        value: b_imgActor,
                                        fillColor: const MaterialStatePropertyAll(
                                            Colors.green),
                                        onChanged: ((value) {
                                          setState(() {
                                            b_imgUser = false;
                                            b_imgActor = true;
                                            b_imgHomeProduction = false;
                                          });
                                        })))
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                b_imgUser = false;
                                b_imgActor = true;
                                b_imgHomeProduction = false;
                              });
                            },
                          ),
                        )
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        width: MediaQuery.of(context).size.width / 3.3,
                        height: MediaQuery.of(context).size.height / 8,
                        margin: EdgeInsets.fromLTRB(
                          0,
                          MediaQuery.of(context).size.height / 70,
                          0,
                          MediaQuery.of(context).size.height / 70,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius:
                              b_imgHomeProduction ? BorderRadius.circular(12) : null,
                          border:
                              b_imgHomeProduction ? Border.all(color: Colors.green) : null,
                        ),
                        child: GestureDetector(
                          child: Stack(
                            children: [
                              Image.network(
                                imgHomeProduction,
                                width: MediaQuery.of(context).size.width / 5,
                              ),
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  bottom: 70,
                                  left: 100,
                                  child: Checkbox(
                                      value: b_imgHomeProduction,
                                      fillColor: const MaterialStatePropertyAll(
                                          Colors.green),
                                      onChanged: ((value) {
                                        setState(() {
                                          b_imgUser = false;
                                          b_imgActor = false;
                                          b_imgHomeProduction = true;
                                        });
                                      })))
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              b_imgUser = false;
                              b_imgActor = false;
                              b_imgHomeProduction = true;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: b_imgUser
                ? const MyFormulaire(
                    role: 'cinephile',
                    fieldPrenom: 'first name user',
                    fieldNom: 'last name user',
                    fieldNomUtilisateur: 'name user user',
                    fieldEmail: 'elSedy@gmail.com',
                  )
                : b_imgActor
                    ? const MyFormulaire(
                        role: 'acteur',
                        fieldPrenom: 'first name actor',
                        fieldNom: 'last name actor',
                        fieldNomUtilisateur: 'name user actor',
                        fieldEmail: 'actor@gmail.com',
                      )
                    : const MyFormulaire(
                        role: 'Maison de production',
                        fieldPrenom: 'name home production',
                        fieldNom: 'name director',
                        fieldNomUtilisateur: 'name ',
                        fieldEmail: 'film@gmail.com',
                      ),
          ))
        ],
      ),
    );
  }
}
