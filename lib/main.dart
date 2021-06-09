import 'package:flutter/material.dart';
import 'package:flutter_mobx_test/tabs/form_view.dart';
import 'package:flutter_mobx_test/tabs/stores/atualizar_cadastro_store.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('pt_BR', null);
  runApp(
    MultiProvider(
      providers: [
        Provider<AtualizarCadastroStore>(create: (_) => AtualizarCadastroStore()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AtualizarCadastroVew(),
    );
  }
}
