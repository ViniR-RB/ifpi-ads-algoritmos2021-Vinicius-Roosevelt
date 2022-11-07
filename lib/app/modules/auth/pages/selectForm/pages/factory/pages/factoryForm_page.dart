import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormFactoryPage extends StatefulWidget {
  const FormFactoryPage({Key? key}) : super(key: key);

  @override
  State<FormFactoryPage> createState() => _FormFactoryPageState();
}

class _FormFactoryPageState extends State<FormFactoryPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _telefoneController = TextEditingController();

  final TextEditingController _cnpjController = TextEditingController();

  final TextEditingController _dtnascimentoController = TextEditingController();

  final TextEditingController _sexoController = TextEditingController();

  final TextEditingController _cepController = TextEditingController();

  final TextEditingController _estadoController = TextEditingController();

  final TextEditingController _cidadeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 100)),
                          Text(
                            'Conte Nós Mais Sobre Sua Empresa',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Padding(padding: EdgeInsets.only(top: 20)),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(0),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(54, 59, 107, 1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(0),
                                ),
                              ),
                              child: ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            children: [
                                              _fields('Name Completo:', 'Nome',
                                                  _nameController),
                                              _fields('CNPJ:', 'CNPJ',
                                                  _cnpjController),
                                              _fields(
                                                  'Celular (com DD):',
                                                  '00 00000-0000',
                                                  _telefoneController),
                                              _fields('Cep:', '00000-000',
                                                  _cnpjController),
                                              _fields('Estado:', 'Piaui',
                                                  _estadoController),
                                              _fields('Cidade:', 'Teresina',
                                                  _estadoController),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  button(
                                                    'Confirmar',
                                                    () => Modular.to
                                                        .navigate('/home/empresa'),
                                                  ),
                                                  button('Voltar',
                                                      () => Modular.to.pop()),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  button(String label, Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, bottom: 12),
      child: TextButton(
        style: TextButton.styleFrom(
          textStyle: TextStyle(color: Color.fromRGBO(54, 59, 107, 1)),
          side: BorderSide.none,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          backgroundColor: Color.fromRGBO(249, 238, 47, 1),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }

  field(
    size,
    String? Function(String?)? validator,
    controller,
    label,
    hintText,
    textInputType,
  ) {
    return Container(
      color: Color.fromRGBO(48, 48, 48, 1),
      height: size.height / 14,
      width: size.width / 1.2,
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.grey),
          label: Text(label),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromRGBO(48, 48, 48, 1), width: 1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromRGBO(48, 48, 48, 1), width: 1),
          ),
        ),
      ),
    );
  }

  _fields(String title, label, TextEditingController controller) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 22.0, top: 12)),
            Text(
              '$title',
              style: TextStyle(
                fontFamily: 'MavenPro',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 12.0, bottom: 0)),
        field(
          MediaQuery.of(context).size,
          (p0) => null,
          controller,
          '$label',
          '$label',
          TextInputType.name,
        ),
      ],
    );
  }
}
