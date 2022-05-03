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

  double calcularValorTotal() {
    double total = 0.0;
    for (int i = 0; i < itens.length; i++) {
      total += itens[i].calcularValorTotalIten();
    }
    return total;
  }

  double calcularDescontoTotal() {
    double total = 0.0;
    for (ItemNF item in itens) {
      total += item.desconto;
    }
    return total;
  }

  double calcularTotalAcrescimos() {
    double total = 0.0;
    for (ItemNF item in itens) {
      total += item.acrescimo;
    }
    return total;
  }

  ItemNF? getProdutoMaisBarato() {
    ItemNF? itemMaisBarato;
    for (ItemNF item in itens) {
      if (itemMaisBarato == null) {
        itemMaisBarato = item;
      } else if (item.calcularValorTotalIten() <
          itemMaisBarato.calcularValorTotalIten()) {
        itemMaisBarato = item;
      }
    }
    return itemMaisBarato;
  }

  ItemNF? getProdutoMaisCaro() {
    ItemNF? itemMaisCaro;
    for (ItemNF item in itens) {
      if (itemMaisCaro == null) {
        itemMaisCaro = item;
      } else if (item.calcularValorTotalIten() >
          itemMaisCaro.calcularValorTotalIten()) {
        itemMaisCaro = item;
      }
    }
    return itemMaisCaro;
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

void mainNotaFiscal() {
  final pessoa = Pessoa(nome: 'zils');
  final nota = NotaFiscal(cliente: pessoa);
  nota.addItem(produto: 'notebook', valor: 1000.0, acrescimo: 150.0);
  nota.addItem(produto: 'teclado', valor: 200.0);
  print('Valor total da nota : ${nota.getProdutoMaisBarato()}');
}
