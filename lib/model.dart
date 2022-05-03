import 'package:flutter/cupertino.dart';

enum Sexo{ MASCULINO, FEMININO}

Sexo? strToSexo(String? str){
  if(str == null){
    return null;
  }
  switch(str.toUpperCase()){
    case'MASCULINO':
    case'M':
      return Sexo.MASCULINO;
    case'FEMININO':
    case'F':
      return Sexo.FEMININO;
    default:
      return null;
  }
}



class Pessoa{


  String? nome;
  String? cpf;
  DateTime? nascimento;
  int? idade;
  Sexo? sexo;

  Pessoa(this.nome, this.cpf, this.nascimento, this.sexo);
  Pessoa.fromMap(Map<String ,String> map){
    nome = map['nome'];
    cpf = map['cpf'];
    nascimento = DateTime.tryParse(map['nascimento'] ?? '2001-01-01');
    sexo = strToSexo(map['sexo']);
  }

int? getIdade(){
  if(nascimento == null){
    return null;
  }
  final hoje = DateTime.now();
  final idade = hoje.difference(nascimento!);
  return idade.inDays ~/ 365;

}

  @override
  String toString(){
    return "{nome=$nome, cpf=$cpf, nacimento=$nascimento, idade=$getIdade(), "
        "sexo=$sexo";
  }
}
class Programador extends Pessoa{

  double? salario;
  Programador(String? nome, String? cpf, DateTime? nascimento, Sexo? sexo, this.salario)
  : super(nome, cpf, nascimento, sexo);

  Programador.fromMap(Map<String, String> map) : super.fromMap(map){
    salario = double.tryParse(map['salario'] ?? "0.0");
  }

  String toString(){
    return "{nome=$nome, cpf=$cpf, nacimento=$nascimento, idade=$getIdade(), "
        "sexo=$sexo, salario=$salario";
  }
}


void mainEntidades(){
  // final map = {
  //   'nome': 'Zils',
  //   'nascimento': '1995-09-12',
  //   'sexo': 'M',
  //   'salario': '10000.0'
  // };

//   Pessoa pessoa = Pessoa.fromMap(map);
//
// print(pessoa);


//for tradicional estilo java/php
List<String> nome = ['Carlos', 'jão', 'samuel'];
for(int i = 0; i < nome.length; i++){
  if(nome[i].toUpperCase().startsWith('s')){
    break;
  }
  print("$i - ${nome[i]}");
}

  // Pessoa pessoa = Programador();
  //
  // pessoa.nome = "zils";
  // pessoa.cpf = "089.124.214-50";
  // pessoa.nascimento = DateTime(1995,9,12);
  // pessoa.idade = 26;
  // pessoa.sexo = Sexo.masculino;
  // //pessoa.salario = 2.500;
  //
  // print(pessoa.toString);
}

