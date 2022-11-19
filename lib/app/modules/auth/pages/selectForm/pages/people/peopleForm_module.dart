import 'package:app/app/modules/auth/pages/selectForm/pages/people/pages/peopleForm_page.dart';
import 'package:app/app/modules/auth/pages/selectForm/pages/people/peopleForm_controller.dart';
import 'package:app/app/modules/auth/pages/selectForm/pages/people/peopleForm_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormPeopleModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => PeopleFormRepository()),
    Bind((i) => PeopleFormController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => FormPeoplePage()),
  ];
}
