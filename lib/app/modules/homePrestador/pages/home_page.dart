import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/card.dart';

class HomePrestadorPage extends StatefulWidget {
  const HomePrestadorPage({Key? key}) : super(key: key);

  @override
  State<HomePrestadorPage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePrestadorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Modular.to.pushNamed('/home/prestador/perfil'),
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ))
        ],
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
