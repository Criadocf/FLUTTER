import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String cep = '';
  String logradouro = '';
  String complemento = '';
  String bairro = '';
  String localidade = '';
  String uf = '';
  String ibge = '';
  String gia = '';
  String ddd = '';
  String siafi = '';

  _buscarCep() async {
    var url = Uri.parse('https://viacep.com.br/ws/64019020/json/');
    http.Response response;

    response = await http.get(url);

    print('Resposta' + response.statusCode.toString());
    print('Resposta' + response.body);

    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      cep = retorno['cep'];
      logradouro = retorno['logradouro'];
      complemento = retorno['complemento'];
      bairro = retorno['bairro'];
      localidade = retorno['localidade'];
      uf = retorno['uf'];
      ibge = retorno['ibge'];
      gia = retorno['gia'];
      ddd = retorno['ddd'];
      siafi = retorno['siafi'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CEP'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                _buscarCep();
              },
              child: Text("Buscar Cep"),
            ),
          ),
          Column(
            children: [
              Text(''),
              Text(''),
              Text(''),
              Text(''),
              Text(
                'RESULTADOS DA BUSCA DO CEP',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(''),
              Text(''),
              Text(''),
              Text('CEP => ' + cep),
              Text('\n'),
              Text('LOGRADOURO => ' + logradouro),
              Text('\n'),
              Text('COMPLEMENTO => ' + complemento),
              Text('\n'),
              Text('BAIRRO => ' + bairro),
              Text('\n'),
              Text('LOCALIDADE => ' + localidade),
              Text('\n'),
              Text('UF => ' + uf),
              Text('\n'),
              Text('IBGE => ' + ibge),
              Text('\n'),
              Text('GIA > ' + gia),
              Text('\n'),
              Text('DDD > ' + ddd),
              Text('\n'),
              Text('SIAFI => ' + siafi),
            ],
          )
        ],
      ),
    );
  }
}
