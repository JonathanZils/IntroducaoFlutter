enum Sexo{ masculino, feminino}

class Pessoa{
  String? nome;
  String? cpf;
  DateTime? nascimento;
  int? idade;
  Sexo? sexo;

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


  String toString(){
    return "{nome=$nome, cpf=$cpf, nacimento=$nascimento, idade=$getIdade(), "
        "sexo=$sexo, salario=$salario";
  }
}


void mainEntidades(){
  Pessoa pessoa = Programador();

  pessoa.nome = "zils";
  pessoa.cpf = "089.124.214-50";
  pessoa.nascimento = DateTime(1995,9,12);
  pessoa.idade = 26;
  pessoa.sexo = Sexo.masculino;
  //pessoa.salario = 2.500;

  print(pessoa.toString);
}

