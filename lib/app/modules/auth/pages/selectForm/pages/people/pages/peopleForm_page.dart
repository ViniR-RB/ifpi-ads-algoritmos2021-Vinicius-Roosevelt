import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormPeoplePage extends StatefulWidget {
  const FormPeoplePage({Key? key}) : super(key: key);

  @override
  State<FormPeoplePage> createState() => _FormPeoplePageState();
}

class _FormPeoplePageState extends State<FormPeoplePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _telefoneController = TextEditingController();

  final TextEditingController _cpfController = TextEditingController();

  final TextEditingController _dtnascimentoController = TextEditingController();

  final TextEditingController _sexoController = TextEditingController();

  final TextEditingController _cepController = TextEditingController();

  final TextEditingController _estadoController = TextEditingController();

  final TextEditingController _cidadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: _body(size),
    );
  }

  _body(size) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(24)),
          _title('Finalize seu cadastro'),
          Form(
            key: _formKey,
            child: Column(
              children: [
                _field(size, _nameController, 'Nome'),
                _field(size, _telefoneController, 'Telefone'),
                _field(size, _cpfController, 'CPF'),
                _field(size, _sexoController, 'Sexo'),
                _field(size, _cepController, 'Cep'),
                _field(size, _estadoController, 'Estado'),
                _field(size, _cidadeController, 'Cidade'),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buttonFinish(size, () => Modular.to.navigate('/home/prestador'),
                  'Finalizar'),
              SizedBox(
                width: 20,
              ),
              _buttonFinish(size, () => Modular.to.pop('/selectform'), 'Voltar')
            ],
          )
        ],
      ),
    );
  }

  _field(Size size, TextEditingController controller, labelText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.red,
          labelText: labelText,
          border: const UnderlineInputBorder(),
          labelStyle: const TextStyle(
            fontFamily: 'Raleway',
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _title(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
              fontSize: 36),
        ),
      ],
    );
  }

  _buttonFinish(Size size, onpressed, label) {
    return Container(
      width: size.width / 2.5,
      child: TextButton(
        onPressed: onpressed,
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            side: BorderSide(
              color: Color.fromRGBO(82, 163, 208, 1),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
