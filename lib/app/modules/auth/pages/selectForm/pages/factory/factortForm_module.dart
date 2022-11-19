import 'package:app/app/modules/auth/pages/selectForm/pages/factory/factoryForm_controller.dart';
import 'package:app/app/modules/auth/pages/selectForm/pages/factory/pages/factoryForm_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'factoryForm_repository.dart';

class FactoryFormModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => FactoryFormRepository()),
    Bind((i) => FactoryFormController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const FormFactoryPage()),
  ];
}
