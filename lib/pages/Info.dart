import 'package:flutter/material.dart';
import 'package:gsb_day2/models/info.dart';
import 'package:gsb_day2/utills/local_date.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

  @override
  Widget build(BuildContext context) {
    // TextStyle textStyle = TextStyle(fontSize: 20);
    return Scaffold(
      body: FutureBuilder(
        future: _getInfo() ,
        builder: (BuildContext context, AsyncSnapshot<Info> snapshot) {
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator());
          }
          Info ? info = snapshot.data;
          return SizedBox(
            width: double.infinity,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                      'https://i.natgeofe.com/n/3861de2a-04e6-45fd-aec8-02e7809f9d4e/02-cat-training-NationalGeographic_1484324_3x4.jpg'
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  child: ListTile(
                    title: const Text('Name'),
                    subtitle: Text(info!.name),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('Position'),
                    subtitle: Text(info.position),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('Birthdate'),
                    subtitle: Text(info.birthdate),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('Email'),
                    subtitle: Text(info.email),
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/editinfo',
                          arguments: info).then((value) => setState(() {}));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(24),
                    ),
                    child: const Icon(
                        Icons.edit,
                        color: Colors.white
                    ),
                )
              ],
            ),
          );
        }
      ),
    );
  }

  Future<Info> _getInfo()async{
    LocalData localData = LocalData();
    Info info = Info();
    info.name = await localData.getString('name')??'';
    info.position = await localData.getString('position')??'';
    info.email = await localData.getString('email')??'';
    info.birthdate = await localData.getString('birthdate')??'';
    return info;
  }
}
