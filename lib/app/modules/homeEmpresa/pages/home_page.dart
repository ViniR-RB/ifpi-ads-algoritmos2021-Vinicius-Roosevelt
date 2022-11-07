import 'package:flutter/material.dart';

import '../widgets/card.dart';

class HomeEmpresaPage extends StatefulWidget {
  const HomeEmpresaPage({Key? key}) : super(key: key);

  @override
  State<HomeEmpresaPage> createState() => _HomePageState();
}

class _HomePageState extends State<HomeEmpresaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
        ),
      ]),
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
