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
                      InputTextWidget(
                        controller: controllerNomeCompleto,
                        labelText: "Nome Completo",
                        errorText: store.error.nameCompleto,
                        onChange: (value) {
                          controllerNomeCompleto.text = value;
                          controllerNomeCompleto.selection = TextSelection.collapsed(offset: value.length);
                          return store.nameCompleto = value;
                        },
                      ),

                      // Telefone Celular
                      Observer(
                        builder: (_) {
                          controllerTelefoneCelular.value = TextEditingValue(
                            text: store.telefoneCelular,
                            selection: TextSelection.collapsed(offset: store.telefoneCelular.length),
                          );
                          return InputTextWidget(
                            controller: controllerTelefoneCelular,
                            labelText: "Telefone Celular",
                            onSubmitted: (value) => store.telefoneCelular = value,
                            keyboardType: TextInputType.phone,
                            textInputFormatter: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(12),
                              FilteringTextInputFormatter.digitsOnly,
                              // NumberTextInputFormatter(),
                            ],
                          );
                        },
                      ),

                      // Telefone Fixo
                      Observer(
                        builder: (_) {
                          controllerTelefoneFixo.value = TextEditingValue(
                            text: store.telefoneFixo,
                            selection: TextSelection.collapsed(offset: store.telefoneFixo.length),
                          );
                          return InputTextWidget(
                            controller: controllerTelefoneFixo,
                            labelText: "Telefone Fixo",
                            onChange: (value) => store.telefoneFixo = value,
                            keyboardType: TextInputType.phone,
                            textInputFormatter: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(12),
                              FilteringTextInputFormatter.digitsOnly,
                              // NumberTextInputFormatter(),
                            ],
                          );
                        },
                      ),

                      // Email
                      Observer(builder: (_) {
                        controllerEmail.value = TextEditingValue(
                          text: store.email,
                          selection: TextSelection.collapsed(offset: store.email.length),
                        );
                        return InputTextWidget(
                          controller: controllerEmail,
                          labelText: "E-mail",
                          onChange: (value) => store.email = value,
                          errorText: store.error.email,
                          keyboardType: TextInputType.emailAddress,
                        );
                      }),

                      // Cidade
                      Observer(builder: (_) {
                        controllerCidade.value = TextEditingValue(
                          text: store.cidade,
                          selection: TextSelection.collapsed(offset: store.cidade.length),
                        );
                        return InputTextWidget(
                          controller: controllerCidade,
                          labelText: "Cidade",
                          onChange: (value) => store.cidade = value,
                          errorText: store.error.cidade,
                          textInputFormatter: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(100),
                          ],
                        );
                      }),

                      // Outras Informações
                      Observer(builder: (_) {
                        controllerOutrasInformacoes.value = TextEditingValue(
                          text: store.outrasInformacoes,
                          selection: TextSelection.collapsed(offset: store.outrasInformacoes.length),
                        );
                        return InputTextWidget(
                          controller: controllerOutrasInformacoes,
                          labelText: "Outras Informações",
                          onChange: (value) => store.outrasInformacoes = value,
                          errorText: store.error.outrasInformacoes,
                          maxLines: 4,
                          textInputFormatter: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(200),
                          ],
                        );
                      }),

                      Observer(
                        builder: (_) => Container(
                          padding: EdgeInsets.only(top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Texto(
                                "Ultima Atualização Enviada: " + formatDateddMMyyykkmm(store.ultimaAlteracao),
                              ),
                            ],
                          ),
                        ),
                      )
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
