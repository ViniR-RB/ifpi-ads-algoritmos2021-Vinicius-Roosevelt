import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../widgets/card.dart';

class HomePrestadorPage extends StatefulWidget {
  const HomePrestadorPage({Key? key}) : super(key: key);

  @override
  State<HomePrestadorPage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePrestadorPage> {
  final _selectedIndex = RxNotifier<int>(0);

  void _onItemTapped(int index) {
    if (index == 1) {
      Modular.to.pushNamed('/home/prestador/perfil');
    }
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
        currentIndex: _selectedIndex.value,
        selectedItemColor: Color.fromRGBO(249, 238, 47, 1),
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 238, 47, 1),
        leading: Image.asset(
          'assets/logo/logo.png',
          scale: 1.5,
        ),
        title: const Text(
          'HelloService',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'MavenPro',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Text(
              'Lista de Estabelecimentos',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              Cardlist(),
              Cardlist(),
              Cardlist(),
              Cardlist(),
              Cardlist(),
              Cardlist(),
              Cardlist(),
              Cardlist(),
              Cardlist(),
              Cardlist(),
            ],
          ),
        ],
      ),
    );
  }
}
