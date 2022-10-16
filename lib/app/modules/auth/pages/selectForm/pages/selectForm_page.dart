import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SelectFormPage extends StatelessWidget {
  const SelectFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 239, 66, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Image.asset('assets/logo/logo.png'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      shape: BoxShape.rectangle),
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: 100,
                        onPressed: () =>
                            Modular.to.pushNamed('/selectform/people'),
                        icon: Icon(Icons.people, color: Colors.black),
                      ),
                      Text(
                        'Prestador de Serviço',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        shape: BoxShape.rectangle),
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 100,
                          onPressed: () =>
                              Modular.to.pushNamed('/selectform/factory'),
                          icon: Icon(
                            Icons.factory,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Empresa',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
