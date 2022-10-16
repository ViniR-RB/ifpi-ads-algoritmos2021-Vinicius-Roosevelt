
import 'package:app/app/modules/auth/pages/selectForm/pages/factory/pages/factoryForm_page.dart';
import 'package:app/app/modules/auth/pages/selectForm/pages/people/pages/peopleForm_page.dart';

import 'package:app/app/modules/auth/pages/selectForm/pages/selectForm_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

class FormFactoryModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const FormFactoryPage()),
  
  ];
}
