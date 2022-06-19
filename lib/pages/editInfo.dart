import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gsb_day2/models/info.dart';
import 'package:gsb_day2/utills/localDate.dart';
import 'package:intl/intl.dart';


class EditInfoScreen extends StatefulWidget {
  const EditInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditInfoScreen> createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {
  var _keyform = GlobalKey<FormState>();
  Info info = Info();
  @override
  Widget build(BuildContext context) {
    info = ModalRoute.of(context)!.settings.arguments as Info;
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
                  initialValue: info.name,
                  onSaved: (String ? value){
                    info.name = value!;
                  },
                  validator: _validateString,
                  decoration: InputDecoration(
                    labelText: 'Name'
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  initialValue: info.position,
                  onSaved: (String ? value){
                    info.position = value!;
                  },
                  validator: _validateString,
                  decoration: InputDecoration(
                      labelText: 'Position'
                  ),
                ),
              ),
              ListTile(
                leading: Text('birthdate'),
                title: TextButton(
                  child: Text(
                    info.birthdate == '' ? 'choose date' : info.birthdate,
                  ),
                  onPressed: () {
                    _selectDate();
                  },
                ),
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

  _submit() async {
    if (_keyform.currentState!.validate()) {
      _keyform.currentState!.save();
      if (await _storeData()) {
        print('store complete');
        Navigator.pop(context);
      }
    }
  }

  Future<bool> _storeData() async{
    LocalData localData = LocalData();
    bool isSave = await localData.setString(key: 'name', value: info.name);
    isSave = await localData.setString(key: 'position', value: info.position);
    isSave = await localData.setString(key: 'birthdate', value: info.birthdate);
    return isSave;
  }
  _selectDate() async {
    DateTime firstDate = DateTime(DateTime.now().year - 100);
    DateTime lastDate = DateTime.now();

    DateTime birthdate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
    ) ??
        DateTime.now();

    info.birthdate =
        DateFormat.yMMMMEEEEd().format(birthdate); //birthday.toString();
    setState(() {});
  }
}
