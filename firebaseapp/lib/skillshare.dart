import 'package:flutter/material.dart';

class SkillShare extends StatefulWidget {

  @override
  _SkillShareState createState() => _SkillShareState();
}

class _SkillShareState extends State<SkillShare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Text('Skill Share App',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),
       ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pink[20],
            image: DecorationImage(
              image: AssetImage("img/skill.jpg"),
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.07), BlendMode.dstATop),
                fit: BoxFit.cover
              ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Add New Data',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.pink,
                    ), 
                    onPressed: (){},
                    iconSize: 30,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}