import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_mobx_test/beans/file_upload_bean.dart';
import 'package:flutter_mobx_test/models/user_profile.dart';
import 'package:flutter_mobx_test/utils/file_util.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';
part 'atualizar_cadastro_store.g.dart';

class AtualizarCadastroStore = _AtualizarCadastroStoreBase with _$AtualizarCadastroStore;

abstract class _AtualizarCadastroStoreBase with Store {
  final FormErrorState error = FormErrorState();

  @observable
  String nameCompleto = '';

  @observable
  String telefoneCelular = '';

  @observable
  String telefoneFixo = '';

  @observable
  String email = '';

  @observable
  String cidade = '';

  @observable
  String outrasInformacoes = '';

  @observable
  DateTime ultimaAlteracao;

  @observable
  List<FileUploadBean> files = [];

  List<ReactionDisposer> _disposers;

  @action
  Future loadDefault(BuildContext context, {TextEditingController txNome}) async {
    // var produtor = Provider.of<AppSession>(context, listen: false).produtor;
    // print('Carregando informações do produtor' + produtor.toString());

    // var userProfile = await context.read<UserProfileRepository>().findByProdutor(produtor);
    var userProfile = UserProfile(
      nomeCompleto: "Lucas Didur",
      ultimaAlteracao: DateTime.now(),
    );
    nameCompleto = userProfile.nomeCompleto;
    // telefoneCelular = userProfile.telefoneCelular;
    // telefoneFixo = userProfile.telefoneFixo;
    // email = userProfile.email;
    // cidade = userProfile.cidade;
    // outrasInformacoes = userProfile.outrasInformacoes;
    ultimaAlteracao = userProfile.ultimaAlteracao;

    txNome.text = nameCompleto;
  }

  void setupValidations() {
    print('Configurando validadores');
    _disposers = [
      reaction((_) => nameCompleto, validateNomeCompleto),
      reaction((_) => email, validateEmail),
      reaction((_) => cidade, validateCidade),
      reaction((_) => outrasInformacoes, validateOutrasInformacoes),
    ];
  }

  setupControllers({TextEditingController txNome}) {
    print('setupControllers');

    _disposers.addAll([
      reaction((_) => nameCompleto, (value) {
        print('changed');
        txNome.value =
            TextEditingValue(text: nameCompleto, selection: TextSelection.collapsed(offset: nameCompleto.length - 1));
      }),
    ]);
  }

  @action
  Future addFile({
    FileUploadBean fileUpload,
    String name,
    File file,
    String type,
  }) async {
    if (fileUpload != null) {
      files.add(fileUpload);
    } else {
      FileUploadBean _file = FileUploadBean();
      _file.name = basename(file.path);
      _file.file = file;
      _file.type = type;
      _file.size = await getFileSize(file.path);

      files.add(_file);
    }
  }

  @action
  void removeFile(FileUploadBean fileUpload) {
    files.remove(fileUpload);
  }

  @action
  void validateNomeCompleto(String value) {
    if (!isNull(value) && !isLength(value, 3, 200)) {
      error.nameCompleto = "Nome precisa estar entre 3 a 200 caracteres";
      return;
    }

    error.nameCompleto = null;
  }

  @action
  void validateEmail(String value) {
    error.email = isEmail(value)
        ? null
        : !isNull(value)
            ? 'Por favor, informe um email válido'
            : null;
  }

  @action
  void validateCidade(String value) {
    if (!isNull(value) && !isLength(value, 3, 200)) {
      error.cidade = 'Cidade precisa estar entre 3 a 100 caracteres';
      return;
    }

    error.cidade = null;
  }

  @action
  void validateOutrasInformacoes(String value) {
    if (!isNull(value) && !isLength(value, 3, 200)) {
      error.outrasInformacoes = 'Outras informações precisa estar entre 3 a 200 caracteres';
      return;
    }

    error.outrasInformacoes = null;
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateEmail(email);
    validateNomeCompleto(nameCompleto);
    validateCidade(cidade);
    validateOutrasInformacoes(outrasInformacoes);
  }

  uploadFiles(BuildContext context) async {
    // Toast.show("Iniciando upload...", context, duration: 5);

    print("Upload file...");
  }

  Future sendFormulario() async {
    print(this.toString());

    UserProfile document = UserProfile();
    // var userSession = _session.userSession;

    //   document.sink("produtor").add(userSession.produtor);
    //   document.sink("ultimaAlteracao").add(DateTime.now());

    //   form.save();

    //   Response response;

    //   var doc = UserProfile.fromJson(document.joinJson());

    //   if (isNotNull(document.id)) {
    //     response = await service.updateDocument(doc);
    //   } else {
    //     response = await service.addDocument(doc);
    //   }

    //   if (response.isCompleted()) {
    //     showSnack(
    //       message: "Informações enviadas com Sucesso!",
    //     );
    //   }
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String nameCompleto;

  @observable
  String email;

  @observable
  String cidade;

  @observable
  String outrasInformacoes;

  @computed
  bool get hasErrors {
    return nameCompleto != null || email != null || cidade != null || outrasInformacoes != null;
  }
}
