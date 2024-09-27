import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

enum Exchange{
  Real,
  Euro,
  Dollar
}


class Calculator extends StatefulWidget {

  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Exchange exchangeName = Exchange.Dollar;
  Exchange exchangeName2 = Exchange.Dollar;
  double value1 = 0;
  double value2 = 0;
  double value3 = 0;

  final TextEditingController _valueController = TextEditingController();

  String _getExchangeName(Exchange exchange) {
    switch (exchange) {
      case Exchange.Dollar:
        return 'Dólar Americano (USD)';
      case Exchange.Euro:
        return 'Euro (EUR)';
      case Exchange.Real:
        return 'Real (BRL)';
      default:
        return '';
    }
  }

  double _convertExchange(Exchange exchange1, Exchange exchange2) {
    switch (exchange1) {
      case Exchange.Real:
        switch (exchange2) {
          case Exchange.Real:
            return value1;
          case Exchange.Euro:
            return value1 * 0.16;
          case Exchange.Dollar:
            return value1 * 0.18;
        }
      case Exchange.Dollar:
        switch (exchange2) {
          case Exchange.Real:
            return value1 * 5.45;
          case Exchange.Euro:
            return value1 * 0.89;
          case Exchange.Dollar:
            return value1;
        }
      case Exchange.Euro:
        switch (exchange2) {
          case Exchange.Real:
            return value1 * 6.1;
          case Exchange.Euro:
            return value1;
          case Exchange.Dollar:
            return value1 * 1.12;
        }
      default:
        return 0;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 768,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Conversor de Moedas',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Cotação atualizada em 24/09/2024',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Valor',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        onChanged: (value) {

                          setState(() {
                            value1 = double.parse(value);
                          });
                        },
                        controller: _valueController,
                        decoration: InputDecoration(
                          hintText: 'Digite o valor',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[600]!, width: 1.5),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Converter de:',
                        style: TextStyle(fontSize: 16),
                      ),
                      _buildExpansionList(),
                      const SizedBox(height: 15),
                      const Text(
                        'Para:',
                        style: TextStyle(fontSize: 16),
                      ),
                      _buildExpansionList2(),
                      const SizedBox(height: 24),
                       Center(
                        child: Text(
                          'O valor convertido é ${_convertExchange(exchangeName, exchangeName2).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              elevation: 2,
                              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
                            ),
                            onPressed: () {
                              setState(() {
                                String currentText = _valueController.text;

                                if (currentText.isNotEmpty) {
                                  String updatedText = currentText.substring(0, currentText.length - 1);
                                  _valueController.text = updatedText;
                                  if (updatedText.isNotEmpty) {
                                    double convertedValue = double.parse(updatedText);

                                    value2 = convertedValue;
                                    value1 = convertedValue;
                                  } else {
                                    value2 = 0;
                                    value1 = 0;
                                  }
                                }
                              });
                            },
                            child: const Text('Deletar'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      buildRow(['7', '8', '9']),
                      buildRow(['4', '5', '6']),
                      buildRow(['1', '2', '3']),
                      buildRow(['0', '.']),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpansionList() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
        title: Text(
          _getExchangeName(exchangeName),
          style: const TextStyle(fontSize: 16),
        ),
        children: <Widget>[
          ListTile(
            title: const Text('Dólar Americano (USD)'),
            selected: exchangeName == Exchange.Dollar,
            onTap: () {
              setState(() {
                exchangeName = Exchange.Dollar;
              });
            },
          ),
          ListTile(
            title: const Text('Euro (EUR)'),
            selected: exchangeName == Exchange.Euro,
            onTap: () {
              setState(() {
                exchangeName = Exchange.Euro;
              });
            },
          ),
          ListTile(
            title: const Text('Real (BRL)'),
            selected: exchangeName == Exchange.Real,
            onTap: () {
              setState(() {
                exchangeName = Exchange.Real;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionList2() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
        title: Text(
          _getExchangeName(exchangeName2),
          style: const TextStyle(fontSize: 16),
        ),
        children: <Widget>[
          ListTile(
            title: const Text('Dólar Americano (USD)'),
            selected: exchangeName2 == Exchange.Dollar,
            onTap: () {
              setState(() {
                exchangeName2 = Exchange.Dollar;
              });
            },
          ),
          ListTile(
            title: const Text('Euro (EUR)'),
            selected: exchangeName2 == Exchange.Euro,
            onTap: () {
              setState(() {
                exchangeName2 = Exchange.Euro;
              });
            },
          ),
          ListTile(
            title: const Text('Real (BRL)'),
            selected: exchangeName2 == Exchange.Real,
            onTap: () {
              setState(() {
                exchangeName2 = Exchange.Real;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttons.map((label) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _valueController.text += label;
                  value1 = double.parse(_valueController.text);
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 2,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
