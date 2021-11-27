import 'package:flutter/material.dart';
import 'package:sushi_throne/models/certificate_degree.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({ Key? key }) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formkey = GlobalKey<FormState>();

  final myController = TextEditingController();
  final myController_Age = TextEditingController();

  certificate_degree _certificateDegree = certificate_degree.Male;

  @override
  void dispose(){
    myController.dispose();
    myController_Age.dispose();
    super.dispose();
  }

  void _printLatestValue(){
    print(' text field: ${myController.text}');
  }

  void _printLatestAge(){
    print(' text field: ${myController_Age.text}');
  }

  @override
  void initState(){
    super.initState();
    myController.addListener(_printLatestValue);
    myController_Age.addListener(_printLatestAge);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Text('Name', textAlign: TextAlign.left),
          TextFormField(
            controller: myController,
            validator: (value){
              if (value == null || value.isEmpty){
                return 'please enter some text';
              }
              return null;
            }
            ),
          Text('age', textAlign: TextAlign.left),
          TextFormField(
              controller: myController_Age,
              validator: (value){
              if (value == null || value.isEmpty){
                return 'please enter age';
              }
              if (int.parse(value!)>100 || int.parse(value!)<10 ){
                return 'your age must be more than 10 and less than 100';
              }
              return null;
            } 
            ),
          ElevatedButton(
              onPressed: (){
                if (_formkey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("processing")),
                  );
                }
              }, 
              child: const Text('submit'),
            ),
          ListTile(
            title: Text('Male'),
            leading: Radio(
              value: certificate_degree.Male,
              groupValue: _certificateDegree,
              onChanged: (value){
                setState(() {
                  _certificateDegree = value as certificate_degree;
                });
              }
            ),
          ),
          ListTile(
            title: Text('Female'),
            leading: Radio(
              value: certificate_degree.Female,
              groupValue: _certificateDegree,
              onChanged: (value){
                setState(() {
                  _certificateDegree = value as certificate_degree;
                });
              }
            ),
          )  
        ],
      ),
    );
  }
}