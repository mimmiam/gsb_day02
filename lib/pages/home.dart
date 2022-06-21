import 'package:flutter/material.dart';
import 'package:gsb_day2/pages/Info.dart';
import 'package:gsb_day2/pages/fetch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const InfoScreen(),
    const FetchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.lightGreen,
        title: const Text('Demo'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.lightGreen),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://i.natgeofe.com/n/3861de2a-04e6-45fd-aec8-02e7809f9d4e/02-cat-training-NationalGeographic_1484324_3x4.jpg'),
                  ),
                  Text(
                    'MeowMeow',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Info'),
              onTap: () => _selectedIndex(0),
            ),
            ListTile(
              leading: const Icon(Icons.data_array),
              title: const Text('Fetch data'),
              onTap: () => _selectedIndex(1),
            )
          ],
        ),
      ),
      body: pages[selectedIndex],
    );
  }

  _selectedIndex(int index) {
    selectedIndex = index;
    setState(() {});
    Navigator.pop(context);
  }
}