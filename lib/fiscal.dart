import 'dart:collection';

enum Sexo { masculino, feminino }

class Pessoa {
  String? nome;
  String? cpf;
  DateTime? nascimento;
  Sexo? sexo;

  Pessoa({this.nome, this.cpf, this.nascimento, this.sexo});
}

class NotaFiscal {
  int? numero;
  DateTime? emissao;
  Pessoa? cliente;
  String? enderecoEntrega;
  List<ItemNF> itens = [];

  NotaFiscal({this.numero, this.emissao, this.cliente, this.enderecoEntrega});

  double calcularValorTotal(){
    return itens.map((e) => e.calcularValorTotalIten()).reduce((a,b) => a+ b);

  }

  double calcularDescontoTotal() {
   return itens.map((e) => e.desconto).reduce((a,b) => a + b);
  }

  double calcularTotalAcrescimos() {
    return itens.map((e) => e.acrescimo).reduce((a,b) => a + b);
  }

  ItemNF? getProdutoMaisBarato() {
   return itens.reduce((a,b) => a.calcularValorTotalIten() < b.calcularValorTotalIten() ? a : b);
  }

  ItemNF? getProdutoMaisCaro() {
   return itens.reduce((a,b) => a.calcularValorTotalIten() > b.calcularValorTotalIten() ? a : b);
  }

  bool possuiDesconto(){
    return itens.any((c) => c.desconto > 0);
  }

  List<ItemNF> itensComDesconto(){
    return itens.where((c) => c.desconto > 0).toList();
  }

  String getStrItens(){
    return itens.map((e) => "${e.numSeq} : ${e.produto}").join(', ');
  }

  ItemNF? addItem(
      {required String produto,
      required double valor,
      double desconto = 0.0,
      double acrescimo = 0.0}) {
    ItemNF item = ItemNF(
        numSeq: itens.length + 1,
        produto: produto,
        valor: valor,
        desconto: desconto,
        acrescimo: acrescimo);

    itens.add(item);
    return item;
  }
}

class ItemNF {
  int numSeq;
  String produto;
  double valor;
  double desconto;
  double acrescimo;

  ItemNF(
      {required this.numSeq,
      required this.produto,
      required this.valor,
      this.desconto = 0.0,
      this.acrescimo = 0.0});

  double calcularValorTotalIten() {
    double total = valor + acrescimo - desconto;
    return total;
  }

  @override
  String toString() {
    return '{numSeq=$numSeq, produto=$produto, valor=$valor,'
        'desconto=$desconto, acrescimo=$acrescimo}';
  }
}

Future<void> mainNotaFiscal() async {
  // final pessoa = Pessoa(nome: 'zils');
  // final nota = NotaFiscal(cliente: pessoa);
  // nota.addItem(produto: 'notebook', valor: 1000.0, acrescimo: 150.0);
  // nota.addItem(produto: 'teclado', valor: 200.0);
  // final valorTotal = await nota.calcularValorTotal();
  // print('Valor total da nota : ${nota.getProdutoMaisBarato()}');


  // Set<String> nomes = Set<String>();
  // nomes.add('Jao');
  // nomes.add('Samuel');
  // nomes.add('Torfin');
  // nomes.add('Deb');
  // nomes.add('Clark');
  // nomes.add('Serjey');
  // print(nomes.runtimeType);//mostra o tipo
  // if(nomes.contains('jao')){
  //   print('jao esta aqui');
  // }else{
  //   print('jao não esta aqui');
  // }

  // Queue<String> fila = Queue<String>();
  // fila.add('Jao');
  // fila.add('Samuel');
  // fila.add('Torfin');
  // fila.add('Deb');
  // fila.add('Clark');
  // fila.add('Serjey');



}
