import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introducaoflutter/fiscal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _incrementando = true;
  int _contador = 0;
  List<int> _historico = [];
  int _total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'cond.Controle',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: _buildDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Contador:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20.0),
            Text(
              '$_contador',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
            const SizedBox(height: 20.0),
            Text('Historico:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white)),
            const SizedBox(height: 20.0),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                    '${_historico.isEmpty ? '(vazio)' : _historico.join(' , ')}',
                    style: TextStyle(
                        fontSize: 24.0,
                        color:
                            _historico.isEmpty ? Colors.red : Colors.green))),
            const SizedBox(height: 20.0),
            Text('Total:',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                )),
            const SizedBox(height: 20.0),
            Text(
              '$_total',
              style: TextStyle(color: Colors.green, fontSize: 22),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementarOuDecrementar,
        tooltip: 'Increment',
        child: Icon(_incrementando ? Icons.add : Icons.remove),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
        child: ListView(children: [
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
        ),
        child: Text(
          'Options...',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      ListTile(
          leading: Icon(Icons.clear),
          title: Text('zerar contador'),
          onTap: _zerar),
      ListTile(
          leading: Icon(Icons.swap_calls),
          title: Text('Inverter contador'),
          onTap: _inverter),
      ListTile(
          leading: Icon(Icons.memory),
          title: Text('Memorizar contador'),
          onTap: _memorizar),
    ]));
  }

  void _incrementarOuDecrementar() {
    mainNotaFiscal();
    setState(() {
      if (_incrementando) {
        _contador++;
      } else {
        _contador--;
      }
    });
  }

  void _zerar() {
    Navigator.of(context).pop();
    setState(() {
      _contador = 0;
      _historico.clear();
      _total = 0;
    });
  }

  void _inverter() {
    Navigator.of(context).pop();
    setState(() {
      _incrementando = !_incrementando;
    });
  }

  void _memorizar() {
    Navigator.of(context).pop();
    setState(() {
      _historico.add(_contador);
      _total = _historico.isEmpty ? 0 : _historico.reduce((a, b) => a + b);
    });
  }
}
