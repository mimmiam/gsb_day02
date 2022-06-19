import 'package:flutter/material.dart';

class EditInfoScreen extends StatefulWidget {
  const EditInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditInfoScreen> createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {
  var _keyform = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Info'),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Form(
          key: _keyform,
          child: Column(
            children: [
              ListTile(
                title: TextFormField(
                  validator: _validateString,
                  decoration: InputDecoration(
                    labelText: 'Name'
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  validator: _validateString,
                  decoration: InputDecoration(
                      labelText: 'Position'
                  ),
                ),
              ),
              ListTile(
                leading: Text('Birthdate'),
                title: TextButton(child: Text('choose date'),
                onPressed: () {},
                )
              ),
              ListTile(
                  title: ElevatedButton(
                    child: Text('Submit'),
                    onPressed: _submit,
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
  String ? _validateString(String ? value){
    if(value == null || value.isEmpty){
      return 'Please fill data';
    }
    return null;
  }

  _submit(){
    if(_keyform.currentState!.validate()){
      print(true);
    }
  }
}
