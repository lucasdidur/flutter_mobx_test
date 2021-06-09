import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx_test/tabs/form_tab1.dart';
import 'package:flutter_mobx_test/tabs/form_tab2.dart';
import 'package:flutter_mobx_test/tabs/stores/atualizar_cadastro_store.dart';
import 'package:provider/provider.dart';

class AtualizarCadastroVew extends StatefulWidget {
  static const String routeName = '/atualizar_cadastro';

  AtualizarCadastroVew({RouteSettings settings});

  @override
  _AtualizarCadastroVewState createState() => _AtualizarCadastroVewState();
}

class _AtualizarCadastroVewState extends State<AtualizarCadastroVew> with SingleTickerProviderStateMixin {
  final Stream<int> _currentIndex = Stream<int>.value(0);

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = new TabController(length: 2, vsync: this);
    // _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    // _currentIndex.add(_tabController.index);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    // _currentIndex.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atualizar Cadastro"),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () async {
              await context.read<AtualizarCadastroStore>().sendFormulario();
            },
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              child: TabBar(
                controller: _tabController,
                labelColor: Theme.of(context).primaryColorDark,
                unselectedLabelColor: Color.fromRGBO(48, 48, 4, 1),
                tabs: [
                  new Tab(text: "Informações"),
                  new Tab(text: "Anexos"),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _showAnexo(context),
                    _showFormulario(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _showAnexo(BuildContext context) {
    return AtualizarCadastroViewAnexoTab();
  }

  _showFormulario(BuildContext context) {
    return AtualizarCadastroVewFormularioTab();
  }
}
