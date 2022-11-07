import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 32, 32, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(249, 238, 47, 1),
        leading: Image.asset(
          'assets/logo/logo.png',
          scale: 1.5,
        ),
        title: const Text(
          'Meu Perfil',
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 14,
        ),
        const CircleAvatar(
          maxRadius: 80,
          backgroundImage: NetworkImage(
              'https://img.freepik.com/free-icon/important-person_318-10744.jpg?t=st=1645538552~exp=1645539152~hmac=268f4df1741112ca3b8735a233c8d50b8c76ebe5b0aa4d7bf90f1a359824ed8d&w=996'),
        ),
        const SizedBox(
          height: 52,
        ),
        _nome(),
        const SizedBox(
          height: 22,
        ),
        _status(),
        const SizedBox(
          height: 22,
        ),
        _solicatacoes()
      ],
    );
  }

  _nome() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              size: 32,
              Icons.people,
              color: Colors.grey,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Nome',
                style: TextStyle(fontFamily: 'MavenPro', color: Colors.grey),
              ),
              Text(
                'Pedro Belarmino',
                style: TextStyle(
                    fontFamily: 'MavenPro', fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 60.0),
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 30,
              color: Color.fromRGBO(82, 163, 208, 1),
            ),
          ),
        ],
      ),
    );
  }

  _status() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              size: 32,
              Icons.people,
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Status',
                style: TextStyle(fontFamily: 'MavenPro', color: Colors.grey),
              ),
              Text(
                'Disponivel',
                style: TextStyle(
                    fontFamily: 'MavenPro', fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 100.0),
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 30,
              color: Color.fromRGBO(82, 163, 208, 1),
            ),
          ),
        ],
      ),
    );
  }

  _solicatacoes() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              size: 32,
              Icons.phone_outlined,
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Solicitações',
                style: TextStyle(fontFamily: 'MavenPro', color: Colors.grey),
              ),
              Text(
                'Você tem 2 Solicitações',
                style: TextStyle(
                    fontFamily: 'MavenPro', fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 30,
              color: Color.fromRGBO(82, 163, 208, 1),
            ),
          ),
        ],
      ),
    );
  }
}
