import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/Black_Wallpaper.jpg"),
            fit: BoxFit.cover,
            )),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/ar.png'),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Renu Saini",
                          style: TextStyle(color:Colors.white, fontSize:30),
                        ),
                        Text(
                          "Designation",
                          style: TextStyle(color:Colors.white,fontSize: 18),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.school,
                        color:Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Master of computer application",
                        style: TextStyle(color:Colors.white,fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.computer_rounded,
                        color:Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Portfolio App",
                        style: TextStyle(color:Colors.white,fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_pin,
                        color:Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Mansarover , Jaipur",
                        style: TextStyle(color:Colors.white,fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        color:Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "renukasaini3881@gmail.com",
                        style: TextStyle(color:Colors.white,fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color:Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "91-9352933881",
                        style: TextStyle(color:Colors.white,fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "I am a coder and currenty I am a student in collage.",
                  style: TextStyle(color:Colors.white,fontSize: 22),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text("Created by Renu", style: TextStyle(color:Colors.white,))
            ],
          ),
        ),
      ),
    );
  }
}
