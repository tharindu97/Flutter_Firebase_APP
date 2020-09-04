import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
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
                  ),
                ],
              ),
              SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Recently Added',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.refresh), 
                        onPressed: (){
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(
                              builder: (BuildContext context) => SkillShare()
                            )
                          );
                        },
                        iconSize: 30,
                        color: Colors.pink,
                      )
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Flexible(
                    child: FirebaseAnimatedList(
                      query: databaseReference, 
                      itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int indext){
                          return (
                            Column(
                              children: [
                                ListTile(
                                  leading: InkWell(
                                    onLongPress: () {
                                      delete(snapshot);
                                    }, 
                                    child: CircleAvatar(
                                      backgroundColor: Colors.pink,
                                    ),
                                  ),
                                  title: Text(bioList[indext].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue
                                    ),
                                  ),
                                  subtitle: Text(bioList[indext].dob,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.arrow_forward_ios,
                                      color: Colors.pink,
                                    ), 
                                    onPressed: (){
                                      Navigator.push(context, 
                                        MaterialPageRoute(builder: (context){
                                            return MaterialApp(
                                              debugShowCheckedModeBanner: false,
                                              home: Scaffold(
                                                appBar: AppBar(
                                                  backgroundColor: Colors.pink,
                                                  leading: IconButton(
                                                    icon: Icon(Icons.arrow_back_ios), 
                                                    onPressed: () => Navigator.of(context).pop(),
                                                  ),
                                                  centerTitle: true,
                                                  title: Text(bioList[indext].name + '-' + bioList[indext].country,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ),
                                                body: Padding(
                                                  padding: const EdgeInsets.all(8.0),
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
                                                                      initialValue: bioList[indext].name,
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
                                                                      initialValue: bioList[indext].dob,
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
                                                                      initialValue: bioList[indext].country,
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
                                                                      initialValue: bioList[indext].city,
                                                                      validator: (value) => value.isEmpty ? 'This field can\t be empty' : null,
                                                                      onSaved: (newValue) => bio.city = newValue,
                                                                    ),

                                                                    SizedBox(
                                                                      height: 30,
                                                                    ),

                                                                    RaisedButton(
                                                                      color: Colors.pink,
                                                                      onPressed: () {
                                                                        confirmUpdate(snapshot);
                                                                      }, 
                                                                      child: Text(
                                                                        'Update Form',
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
                                        })
                                      );
                                    }),
                                ),
                                Divider()
                              ],
                          ));
                        }
                    )
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
      submitSuccessful();
    }
  }

  void submitSuccessful(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Successfully Submitted'),
          actions: [
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              }, 
              child: Text('Dismiss')
            )
          ],
        );
      }
    );
  }

  void delete(DataSnapshot snapshot) async{
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Conform Delete'),
          content: Text('Do you want to delete this Form?'),
          actions: [
            FlatButton(
              onPressed: (){
                databaseReference.child(snapshot.key).remove();
                Navigator.of(context).pop();
              }, 
              child: Text('Yes')),
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text('No'))
          ],
        );
      }
    );
  }

  void confirmUpdate(DataSnapshot snapshot){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Conform Update'),
          content: Text('Do you want to update this form?'),
          actions: [
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();

              }, 
              child: Text('Yes')),
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
                handleUpdate(snapshot);
              }, 
              child: Text('No'))
          ],
        );
      }
    );
  }

  void handleUpdate(DataSnapshot snapshot){
    final FormState form = formKey.currentState;
    if(form.validate()){
      form.save();
      form.reset();
      databaseReference.push().set(bio.toJoson());
      updateSuccessfull(snapshot);
    }
  }

  void updateSuccessfull( DataSnapshot snapshot){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Successfully Update'),
          actions: [
            FlatButton(
              onPressed: (){
                databaseReference.child(snapshot.key).remove();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              }, 
              child: Text('Dismiss')
            )
          ],
        );
      }
    );
  }

}