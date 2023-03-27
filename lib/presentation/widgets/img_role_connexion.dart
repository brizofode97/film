import 'package:flutter/material.dart';

class MyImgRole extends StatefulWidget {
  final String image;
  bool boolImgUser;
  bool boolImgActor;
  bool boolImgHomeProduction;

  MyImgRole(
      {required this.image,
      required this.boolImgUser,
      required this.boolImgActor,
      required this.boolImgHomeProduction,
      super.key});

  @override
  State<MyImgRole> createState() => _MyImgRoleState();
}

class _MyImgRoleState extends State<MyImgRole> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        borderRadius: widget.boolImgUser ? BorderRadius.circular(12) : null,
        border: widget.boolImgUser ? Border.all(color: Colors.green) : null,
      ),
      child: GestureDetector(
        child: Stack(
          children: [
            Image.network(
              widget.image,
              width: MediaQuery.of(context).size.width / 5,
            ),
            Positioned(
                top: 0,
                right: 0,
                bottom: 70,
                left: 100,
                child: Checkbox(
                    value: widget.boolImgUser,
                    fillColor: const MaterialStatePropertyAll(Colors.green),
                    onChanged: ((value) {
                      setState(() {
                        widget.boolImgUser = true;
                        widget.boolImgActor = false;
                        widget.boolImgHomeProduction = false;
                      });
                    })))
          ],
        ),
        onTap: () {
          setState(() {
            widget.boolImgUser = true;
            widget.boolImgActor = false;
            widget.boolImgHomeProduction = false;
          });
        },
      ),
    );
  }
}
