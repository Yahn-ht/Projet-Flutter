import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  late SharedPreferences prefs;
  String? firstName ;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }


  Future _loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString('firstName');
    });
  }
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    Widget content = const SizedBox();
    
    if (_currentIndex == 0) {
      content = const Center(
        child: Text(
          "Voici la page d'acceuil",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    } else if (_currentIndex == 1) {
      content = const Center(
        child: Text(
          "Voici la page d'informations",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    } else if (_currentIndex == 2) {
      content = const Center(
        child: Text(
          "Voici la page des paramètres",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 42, 49),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 42, 49),
        title: const Center(
          child: Text(
            'My Spaces',
            //textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        actions: const [
          Icon(Icons.add, size: 40, color: Colors.white),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 100,
              ),
              SizedBox(
                height: screen.height * 0.2,
              ),
              Text("$firstName"),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Statistiques'),
              ),
            ],
          ),
        ),
      ),

      body: content,


      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            //print(_currentIndex);
          });
        },
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey.withOpacity(0.5),
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Colors.white),
            label: 'Infomation',
            activeIcon: Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: 'Parametre',
            activeIcon: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}