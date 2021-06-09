// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atualizar_cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AtualizarCadastroStore on _AtualizarCadastroStoreBase, Store {
  final _$nameCompletoAtom =
      Atom(name: '_AtualizarCadastroStoreBase.nameCompleto');

  @override
  String get nameCompleto {
    _$nameCompletoAtom.reportRead();
    return super.nameCompleto;
  }

  @override
  set nameCompleto(String value) {
    _$nameCompletoAtom.reportWrite(value, super.nameCompleto, () {
      super.nameCompleto = value;
    });
  }

  final _$telefoneCelularAtom =
      Atom(name: '_AtualizarCadastroStoreBase.telefoneCelular');

  @override
  String get telefoneCelular {
    _$telefoneCelularAtom.reportRead();
    return super.telefoneCelular;
  }

  @override
  set telefoneCelular(String value) {
    _$telefoneCelularAtom.reportWrite(value, super.telefoneCelular, () {
      super.telefoneCelular = value;
    });
  }

  final _$telefoneFixoAtom =
      Atom(name: '_AtualizarCadastroStoreBase.telefoneFixo');

  @override
  String get telefoneFixo {
    _$telefoneFixoAtom.reportRead();
    return super.telefoneFixo;
  }

  @override
  set telefoneFixo(String value) {
    _$telefoneFixoAtom.reportWrite(value, super.telefoneFixo, () {
      super.telefoneFixo = value;
    });
  }

  final _$emailAtom = Atom(name: '_AtualizarCadastroStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$cidadeAtom = Atom(name: '_AtualizarCadastroStoreBase.cidade');

  @override
  String get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(String value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  final _$outrasInformacoesAtom =
      Atom(name: '_AtualizarCadastroStoreBase.outrasInformacoes');

  @override
  String get outrasInformacoes {
    _$outrasInformacoesAtom.reportRead();
    return super.outrasInformacoes;
  }

  @override
  set outrasInformacoes(String value) {
    _$outrasInformacoesAtom.reportWrite(value, super.outrasInformacoes, () {
      super.outrasInformacoes = value;
    });
  }

  final _$ultimaAlteracaoAtom =
      Atom(name: '_AtualizarCadastroStoreBase.ultimaAlteracao');

  @override
  DateTime get ultimaAlteracao {
    _$ultimaAlteracaoAtom.reportRead();
    return super.ultimaAlteracao;
  }

  @override
  set ultimaAlteracao(DateTime value) {
    _$ultimaAlteracaoAtom.reportWrite(value, super.ultimaAlteracao, () {
      super.ultimaAlteracao = value;
    });
  }

  final _$filesAtom = Atom(name: '_AtualizarCadastroStoreBase.files');

  @override
  List<FileUploadBean> get files {
    _$filesAtom.reportRead();
    return super.files;
  }

  @override
  set files(List<FileUploadBean> value) {
    _$filesAtom.reportWrite(value, super.files, () {
      super.files = value;
    });
  }

  final _$loadDefaultAsyncAction =
      AsyncAction('_AtualizarCadastroStoreBase.loadDefault');

  @override
  Future<dynamic> loadDefault(BuildContext context,
      {TextEditingController txNome}) {
    return _$loadDefaultAsyncAction
        .run(() => super.loadDefault(context, txNome: txNome));
  }

  final _$addFileAsyncAction =
      AsyncAction('_AtualizarCadastroStoreBase.addFile');

  @override
  Future<dynamic> addFile(
      {FileUploadBean fileUpload, String name, File file, String type}) {
    return _$addFileAsyncAction.run(() => super
        .addFile(fileUpload: fileUpload, name: name, file: file, type: type));
  }

  final _$_AtualizarCadastroStoreBaseActionController =
      ActionController(name: '_AtualizarCadastroStoreBase');

  @override
  void removeFile(FileUploadBean fileUpload) {
    final _$actionInfo = _$_AtualizarCadastroStoreBaseActionController
        .startAction(name: '_AtualizarCadastroStoreBase.removeFile');
    try {
      return super.removeFile(fileUpload);
    } finally {
      _$_AtualizarCadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNomeCompleto(String value) {
    final _$actionInfo = _$_AtualizarCadastroStoreBaseActionController
        .startAction(name: '_AtualizarCadastroStoreBase.validateNomeCompleto');
    try {
      return super.validateNomeCompleto(value);
    } finally {
      _$_AtualizarCadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_AtualizarCadastroStoreBaseActionController
        .startAction(name: '_AtualizarCadastroStoreBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_AtualizarCadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCidade(String value) {
    final _$actionInfo = _$_AtualizarCadastroStoreBaseActionController
        .startAction(name: '_AtualizarCadastroStoreBase.validateCidade');
    try {
      return super.validateCidade(value);
    } finally {
      _$_AtualizarCadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateOutrasInformacoes(String value) {
    final _$actionInfo =
        _$_AtualizarCadastroStoreBaseActionController.startAction(
            name: '_AtualizarCadastroStoreBase.validateOutrasInformacoes');
    try {
      return super.validateOutrasInformacoes(value);
    } finally {
      _$_AtualizarCadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameCompleto: ${nameCompleto},
telefoneCelular: ${telefoneCelular},
telefoneFixo: ${telefoneFixo},
email: ${email},
cidade: ${cidade},
outrasInformacoes: ${outrasInformacoes},
ultimaAlteracao: ${ultimaAlteracao},
files: ${files}
    ''';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  final _$nameCompletoAtom = Atom(name: '_FormErrorState.nameCompleto');

  @override
  String get nameCompleto {
    _$nameCompletoAtom.reportRead();
    return super.nameCompleto;
  }

  @override
  set nameCompleto(String value) {
    _$nameCompletoAtom.reportWrite(value, super.nameCompleto, () {
      super.nameCompleto = value;
    });
  }

  final _$emailAtom = Atom(name: '_FormErrorState.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$cidadeAtom = Atom(name: '_FormErrorState.cidade');

  @override
  String get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(String value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  final _$outrasInformacoesAtom =
      Atom(name: '_FormErrorState.outrasInformacoes');

  @override
  String get outrasInformacoes {
    _$outrasInformacoesAtom.reportRead();
    return super.outrasInformacoes;
  }

  @override
  set outrasInformacoes(String value) {
    _$outrasInformacoesAtom.reportWrite(value, super.outrasInformacoes, () {
      super.outrasInformacoes = value;
    });
  }

  @override
  String toString() {
    return '''
nameCompleto: ${nameCompleto},
email: ${email},
cidade: ${cidade},
outrasInformacoes: ${outrasInformacoes},
hasErrors: ${hasErrors}
    ''';
  }
}
