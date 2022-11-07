import 'package:app/app/modules/homePrestador/pages/perfil/perfil_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/home_page.dart';

class HomePrestadorModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const HomePrestadorPage()),
    ModuleRoute('/perfil', module: PerfilModule()),
  ];
}
