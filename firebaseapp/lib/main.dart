import 'package:firebaseapp/skillshare.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    HomePage()
  );
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SkillShare(),
    );
  }
}