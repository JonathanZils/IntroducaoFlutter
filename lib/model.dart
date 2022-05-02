enum Sexo{ masculino, feminino}

class Pessoa{
  String? nome;
  String? cpf;
  DateTime? nascimento;
  int? idade;
  Sexo? sexo;
  double? salario;
  bool? programador;

  @override
  String toString(){
    return "{nome=$nome, cpf=$cpf, nacimento=$nascimento, idade=$idade, "
        "sexo=$sexo, salario=$salario, programador=$programador}";
  }
}

void mainEntidades(){
  Pessoa pessoa = new Pessoa();
  pessoa.nome = "zils";
  pessoa.cpf = "089.124.214-50";
  pessoa.nascimento = DateTime(1995,9,12);
  pessoa.idade = 26;
  pessoa.sexo = Sexo.masculino;
  pessoa.salario = 2.500;
  pessoa.programador = true;
  print(pessoa);
}