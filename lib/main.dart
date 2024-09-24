import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _selectedOption = 'Dólar Americano (USD)';
  String _selectedOption2 = 'Dólar Americano (USD)';
  TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 768,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'Conversor de Moedas',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Cotação atualizada em 24/09/2024',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Valor',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      TextField(
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
                      SizedBox(height: 20),
                      Text(
                        'Converter de:',
                        style: TextStyle(fontSize: 16),
                      ),
                      _buildExpansionList(),
                      SizedBox(height: 15),
                      Text(
                        'Para:',
                        style: TextStyle(fontSize: 16),
                      ),
                      _buildExpansionList2(),
                      SizedBox(height: 24),
                      Center(
                        child: Text(
                          'O valor convertido é 0,00',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            'Converter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              elevation: 2,
                              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_valueController.text.isNotEmpty) {
                                  _valueController.text = _valueController.text
                                      .substring(0, _valueController.text.length - 1);
                                }
                              });
                            },
                            child: Text('Deletar'),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      buildRow(['7', '8', '9']),
                      buildRow(['4', '5', '6']),
                      buildRow(['1', '2', '3']),
                      buildRow(['0', ',']),
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
          _selectedOption,
          style: TextStyle(fontSize: 16),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Dólar Americano (USD)'),
            selected: _selectedOption == 'Dólar Americano (USD)',
            onTap: () {
              setState(() {
                _selectedOption = 'Dólar Americano (USD)';
              });
            },
          ),
          ListTile(
            title: Text('Euro (EUR)'),
            selected: _selectedOption == 'Euro (EUR)',
            onTap: () {
              setState(() {
                _selectedOption = 'Euro (EUR)';
              });
            },
          ),
          ListTile(
            title: Text('Real (BRL)'),
            selected: _selectedOption == 'Real (BRL)',
            onTap: () {
              setState(() {
                _selectedOption = 'Real (BRL)';
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
          _selectedOption2,
          style: TextStyle(fontSize: 16),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Dólar Americano (USD)'),
            selected: _selectedOption2 == 'Dólar Americano (USD)',
            onTap: () {
              setState(() {
                _selectedOption2 = 'Dólar Americano (USD)';
              });
            },
          ),
          ListTile(
            title: Text('Euro (EUR)'),
            selected: _selectedOption2 == 'Euro (EUR)',
            onTap: () {
              setState(() {
                _selectedOption2 = 'Euro (EUR)';
              });
            },
          ),
          ListTile(
            title: Text('Real (BRL)'),
            selected: _selectedOption2 == 'Real (BRL)',
            onTap: () {
              setState(() {
                _selectedOption2 = 'Real (BRL)';
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
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  label,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 2,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
