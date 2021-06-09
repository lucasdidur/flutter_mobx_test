import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_test/tabs/stores/atualizar_cadastro_store.dart';
import 'package:flutter_mobx_test/widgets/date_util.dart';
import 'package:flutter_mobx_test/widgets/text.dart';
import 'package:flutter_mobx_test/widgets/text_field.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class AtualizarCadastroViewAnexoTab extends StatefulWidget {
  AtualizarCadastroViewAnexoTab({Key key}) : super(key: key);

  @override
  _AtualizarCadastroViewAnexoTabState createState() => _AtualizarCadastroViewAnexoTabState();
}

class _AtualizarCadastroViewAnexoTabState extends State<AtualizarCadastroViewAnexoTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  TextEditingController controllerNomeCompleto;
  TextEditingController controllerTelefoneCelular;
  TextEditingController controllerTelefoneFixo;
  TextEditingController controllerEmail;
  TextEditingController controllerCidade;
  TextEditingController controllerOutrasInformacoes;

  @override
  void initState() {
    super.initState();

    controllerNomeCompleto = TextEditingController();
    controllerTelefoneCelular = TextEditingController();
    controllerTelefoneFixo = TextEditingController();
    controllerEmail = TextEditingController();
    controllerCidade = TextEditingController();
    controllerOutrasInformacoes = TextEditingController();

    context.read<AtualizarCadastroStore>().setupValidations();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AtualizarCadastroStore>(context, listen: false).loadDefault(
        context,
        txNome: controllerNomeCompleto,
        txTelefoneCelular: controllerTelefoneCelular,
      );
    });
  }

  @override
  void dispose() {
    // context.read<AtualizarCadastroStore>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var store = Provider.of<AtualizarCadastroStore>(context, listen: false);

    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Card(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Nome Completo
                      Observer(builder: (_) {
                        return TextFieldWidget(
                          controller: controllerNomeCompleto,
                          onChanged: (value) => store.nameCompleto = value,
                          labelText: 'Nome Completo',
                          errorText: store.error.nameCompleto,
                        );
                      }),

                      // Telefone Celular
                      Observer(
                        builder: (_) => TextFieldWidget(
                          controller: controllerTelefoneCelular,
                          labelText: "Telefone Celular",
                          onChanged: (value) => store.telefoneCelular = value,
                          keyboardType: TextInputType.phone,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(12),
                            FilteringTextInputFormatter.digitsOnly,
                            // NumberTextInputFormatter(),
                          ],
                        ),
                      ),

                      // Telefone Fixo
                      Observer(
                        builder: (_) => TextFieldWidget(
                          controller: controllerTelefoneFixo,
                          labelText: "Telefone Fixo",
                          onChanged: (value) => store.telefoneFixo = value,
                          keyboardType: TextInputType.phone,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(12),
                            FilteringTextInputFormatter.digitsOnly,
                            // NumberTextInputFormatter(),
                          ],
                        ),
                      ),

                      // Email
                      Observer(
                          builder: (_) => TextFieldWidget(
                                controller: controllerEmail,
                                labelText: "E-mail",
                                onChanged: (value) => store.email = value,
                                errorText: store.error.email,
                                keyboardType: TextInputType.emailAddress,
                              )),

                      // Cidade
                      Observer(
                          builder: (_) => TextFieldWidget(
                                controller: controllerCidade,
                                labelText: "Cidade",
                                onChanged: (value) => store.cidade = value,
                                errorText: store.error.cidade,
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(100),
                                ],
                              )),

                      // Outras Informações
                      Observer(
                          builder: (_) => TextFieldWidget(
                                controller: controllerOutrasInformacoes,
                                labelText: "Outras Informações",
                                onChanged: (value) => store.outrasInformacoes = value,
                                errorText: store.error.outrasInformacoes,
                                maxLines: 4,
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(200),
                                ],
                              )),

                      Container(
                        padding: EdgeInsets.only(top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Observer(builder: (_) {
                              return Texto(
                                "Ultima Atualização Enviada: " + formatDateddMMyyykkmm(store.ultimaAlteracao),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
