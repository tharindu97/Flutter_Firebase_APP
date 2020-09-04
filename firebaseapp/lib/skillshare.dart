import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseapp/bio.dart';
import 'package:flutter/material.dart';

String q1 = '1. Full Name';
String q2 = '2. Date of Birth';
String q3 = '3. Country';
String q4 = '4. City';

final FirebaseDatabase database = FirebaseDatabase.instance;

class SkillShare extends StatefulWidget {

  @override
  _SkillShareState createState() => _SkillShareState();
}

class _SkillShareState extends State<SkillShare> {

  final TextStyle _textStyle = TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Bio bio;
  DatabaseReference databaseReference;
  List<Bio> bioList;

  @override
  void initState() {
    super.initState();
    bioList = List();
    bio = Bio('','','','');
    databaseReference = database.reference().child('employee_bio');
    databaseReference.onChildAdded.listen(_onEntryAdded);
    databaseReference.onChildAdded.listen(_onEntryChanged);
  }

  void _onEntryAdded(Event event) async{
    setState(() {
      bioList.add(Bio.fromSnapshot((event.snapshot)));
    });
  }

  void _onEntryChanged(Event event) async{
    var oldEntry = bioList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      bioList[bioList.indexOf(oldEntry)] = Bio.fromSnapshot((event.snapshot));
    });
  }

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
                                            key: formKey,
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
                                                  onSaved: (newValue) => bio.dob = newValue,
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
                                                  onSaved: (newValue) => bio.country = newValue,
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
                                                  onSaved: (newValue) => bio.city = newValue,
                                                ),

                                                SizedBox(
                                                  height: 30,
                                                ),

                                                RaisedButton(
                                                  color: Colors.pink,
                                                  onPressed: () {
                                                    _formConfirmation();
                                                   }, 
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

  void _formConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Confirm Submission'),
          content: Text('Do You want to submit this form?'),
          actions: [
            FlatButton(
              onPressed:() {
                Navigator.of(context).pop();
                submit();
              }, 
              child: Text('Yes')
            ),
            FlatButton(
              onPressed:() => Navigator.of(context).pop(),
              child: Text('No')
            )
          ],
        );
      }
    );
  }

  void submit(){
    final FormState form = formKey.currentState;
    if(form.validate()){
      form.save();
      form.reset();
      databaseReference.push().set(bio.toJoson());
    }
  }

}