import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormFactoryPage extends StatefulWidget {
  const FormFactoryPage({Key? key}) : super(key: key);

  @override
  State<FormFactoryPage> createState() => _FormFactoryPageState();
}

class _FormFactoryPageState extends State<FormFactoryPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

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
      appBar: AppBar(
        title: const Text('Empresa'),
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(54, 59, 107, 1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
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
                                              children: [_namefield()],
                                            ))
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

  field(
    size,
    String? Function(String?)? validator,
    controller,
    label,
    hintText,
    textInputType,
  ) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.2,
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          label: Text(label),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
        ),
      ),
    );
  }

  _namefield() {
    return Column(
      children: [
        Text('Name'),
        field(
          MediaQuery.of(context).size,
          (p0) => null,
          _nameController,
          'Name',
          'Name',
          TextInputType.name,
        ),
      ],
    );
  }
}
