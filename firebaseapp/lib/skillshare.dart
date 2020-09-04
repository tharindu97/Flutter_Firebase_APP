import 'package:firebaseapp/bio.dart';
import 'package:flutter/material.dart';

String q1 = '1. Full Name';
String q2 = '2. Date of Birth';
String q3 = '3. Country';
String q4 = '4. City';

class SkillShare extends StatefulWidget {

  @override
  _SkillShareState createState() => _SkillShareState();
}

class _SkillShareState extends State<SkillShare> {

  final TextStyle _textStyle = TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold);
  Bio bio;

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
                    onPressed: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) {
                        return MaterialApp(
                          debugShowCheckedModeBanner: false,
                          home: Scaffold(
                            appBar: AppBar(
                              backgroundColor: Colors.pink,
                              leading: IconButton(
                                icon: Icon(Icons.arrow_back_ios), 
                                onPressed: () => Navigator.of(context).pop()
                              ),
                              title: Text(
                                'New Data',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              centerTitle: true,
                            ),

                            body: Padding(
                              padding: const EdgeInsets.all(10),
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
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20,),
                                      Flexible(
                                        flex: 0,
                                        child: Center(
                                          child: Form(
                                            child: Flex(
                                              direction: Axis.vertical,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      q1,
                                                      style: _textStyle,
                                                    )
                                                  ],
                                                ),
                                                TextFormField(
                                                  initialValue: '',
                                                  validator: (value) => value.isEmpty ? 'This field can\t be empty' : null,
                                                  onSaved: (newValue) => bio.name = newValue,
                                                ),

                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      q2,
                                                      style: _textStyle,
                                                    )
                                                  ],
                                                ),
                                                TextFormField(
                                                  initialValue: '',
                                                  validator: (value) => value.isEmpty ? 'This field can\t be empty' : null,
                                                  onSaved: (newValue) => bio.name = newValue,
                                                ),

                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      q3,
                                                      style: _textStyle,
                                                    )
                                                  ],
                                                ),
                                                TextFormField(
                                                  initialValue: '',
                                                  validator: (value) => value.isEmpty ? 'This field can\t be empty' : null,
                                                  onSaved: (newValue) => bio.name = newValue,
                                                ),

                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      q4,
                                                      style: _textStyle,
                                                    )
                                                  ],
                                                ),
                                                TextFormField(
                                                  initialValue: '',
                                                  validator: (value) => value.isEmpty ? 'This field can\t be empty' : null,
                                                  onSaved: (newValue) => bio.name = newValue,
                                                ),

                                                SizedBox(
                                                  height: 30,
                                                ),

                                                RaisedButton(
                                                  color: Colors.pink,
                                                  onPressed: () { }, 
                                                  child: Text(
                                                    'Submit',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  )
                                                )

                                              ],
                                          )),
                                        )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }));
                    },
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