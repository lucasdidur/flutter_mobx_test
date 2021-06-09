import 'dart:convert';

class UserProfile {
  String nomeCompleto;
  String telefoneCelular;
  String telefoneFixo;
  String email;
  String cidade;
  String outrasInformacoes;
  DateTime ultimaAlteracao;

  UserProfile({
    this.nomeCompleto,
    this.telefoneCelular,
    this.telefoneFixo,
    this.email,
    this.cidade,
    this.outrasInformacoes,
    this.ultimaAlteracao,
  });

  Map<String, dynamic> toMap() {
    return {
      'nomeCompleto': nomeCompleto,
      'telefoneCelular': telefoneCelular,
      'telefoneFixo': telefoneFixo,
      'email': email,
      'cidade': cidade,
      'outrasInformacoes': outrasInformacoes,
      'ultimaAlteracao': ultimaAlteracao,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      nomeCompleto: map['nomeCompleto'],
      telefoneCelular: map['telefoneCelular'],
      telefoneFixo: map['telefoneFixo'],
      email: map['email'],
      cidade: map['cidade'],
      outrasInformacoes: map['outrasInformacoes'],
      ultimaAlteracao: map['ultimaAlteracao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) => UserProfile.fromMap(json.decode(source));
}
