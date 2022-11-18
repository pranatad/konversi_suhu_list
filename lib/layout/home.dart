import 'package:flutter/material.dart';
import 'package:konversi_suhu_list/method/history.dart';
import 'package:konversi_suhu_list/method/results.dart';
import 'package:konversi_suhu_list/layout/color_pallete.dart';
import 'package:konversi_suhu_list/method/convert.dart';
import 'package:konversi_suhu_list/method/dropdown.dart';
import 'package:konversi_suhu_list/method/inputs.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _inputUser = 0;
  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;
  var listItem = ["Kelvin", "Reamur"];
  List listViewItem = [];

  onDropdownChange(newValue) {
    setState(() {
      _newValue = newValue;
      perhitunganSuhu();
    });
  }

  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin") {
        _result = _inputUser + 273;
        listViewItem.add('Kelvin : $_result');
      } else if (_newValue == "Reamur") {
        _result = (4 / 5) * _inputUser;
        listViewItem.add('Reamur : $_result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konverter Suhu'),
        foregroundColor: Color.fromARGB(244, 252, 249, 249),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(children: [
          Inputs(inputController: inputController),
          Dropdown(
              newValue: _newValue,
              onDropdownChange: onDropdownChange,
              listItem: listItem),
          Results(result: _result),
          Convert(perhitunganSuhu: perhitunganSuhu),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              "Riwayat Konversi",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: History(listViewItem: listViewItem),
          ),
        ]),
      ),
    );
  }
}
