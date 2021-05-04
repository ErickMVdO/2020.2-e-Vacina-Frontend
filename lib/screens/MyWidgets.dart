import 'package:flutter/material.dart';

class MyWidgets {
  final Color gangGray = Color.fromRGBO(51, 51, 51, 1.0);

  Widget caixaTexto(String texto, final inputCon,
      {bool numberPad = false,
      bool isObscure = false,
      int maxLength = TextField.noMaxLength,
      TextInputType textInput = TextInputType.text,
      String errorText}) {
    return Container(
      padding: EdgeInsets.only(bottom: 11.5),
      child: TextField(
        controller: inputCon,
        keyboardType: textInput,
        maxLength: maxLength,
        obscureText: isObscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: texto,
          errorText: errorText,
        ),
        //controller: _textEditingController,
      ),
    );
  }

  Widget button(String label, double largura, double altura, double fontSize,
      Color cor, Function onPressedAction) {
    return Padding(
      padding: EdgeInsets.only(bottom: 11.5),
      child: SizedBox(
        width: largura,
        height: altura,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: cor),
          onPressed: () {
            onPressedAction();
          },
          child: Text(
            label,
            style: TextStyle(fontSize: fontSize),
          ),
        ),
      ),
    );
  }

  Widget textButton(String label, double largura, double altura,
      double fontSize, Color cor, Function onPressedAction) {
    return Padding(
      padding: EdgeInsets.only(bottom: 11.5),
      child: SizedBox(
        width: largura,
        height: altura,
        child: TextButton(
          onPressed: () {
            onPressedAction();
          },
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              color: cor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget BorderButton(String label, double altura, double fontSize, Color cor,
      IconData arrow, Function onPressed,
      {Icon icon}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: SizedBox(
        height: altura,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(side: BorderSide(color: gangGray)),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                if (icon != null) icon,
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: fontSize,
                      color: gangGray,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ]),
              Icon(arrow, size: 30, color: cor),
            ],
          ),
        ),
      ),
    );
  }
}

class alertDialog extends StatefulWidget {
  final String label;

  const alertDialog(this.label, {Key key}) : super(key: key);
  @override
  _alertDialogState createState() => _alertDialogState();
}

class _alertDialogState extends State<alertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        widget.label,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Ok",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class errorText extends StatefulWidget {
  final bool error;

  const errorText(this.error, {Key key}) : super(key: key);
  @override
  _errorTextState createState() => _errorTextState();
}

class _errorTextState extends State<errorText> {
  Color mostraTexto() {
    Color color;
    widget.error
        ? color = Color.fromRGBO(200, 0, 0, 1)
        : color = Color.fromRGBO(200, 0, 0, 0);
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      width: 20000,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Preencha todos os campos obrigatórios.",
            style: TextStyle(
              fontSize: 15,
              color: mostraTexto(),
            ),
          )
        ],
      ),
    );
  }
}

class textSwitch extends StatefulWidget {
  final String label;
  final double altura, fontSize;
  final Icon icon;

  const textSwitch(this.label, this.altura, this.fontSize, {Key key, this.icon})
      : super(key: key);
  @override
  _textSwitchState createState() => _textSwitchState();
}

class _textSwitchState extends State<textSwitch> {
  bool _escolha = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.altura,
        decoration: (BoxDecoration(
          border: Border.all(
              width: 1.0, color: const Color.fromRGBO(100, 100, 100, 1)),
        )),
        child: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                if (widget.icon != null) widget.icon,
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: widget.fontSize,
                      color: Color.fromRGBO(51, 51, 51, 1.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ]),
              Switch(
                  value: _escolha,
                  onChanged: (bool valor) {
                    setState(() {
                      _escolha = valor;
                    });
                  })
            ],
          ),
        ));
  }
}

class GenderPicker extends StatefulWidget {
  final TextEditingController controller;
  final String errorText;
  const GenderPicker(this.controller, {Key key, this.errorText})
      : super(key: key);

  @override
  _GenderPickerState createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 31.5),
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              border: OutlineInputBorder(), errorText: widget.errorText),
          hint: Text('Sexo'),
          value: dropdownValue,
          isExpanded: true,
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
              widget.controller.text = newValue;
              print(newValue);
            });
          },
          items: [
            DropdownMenuItem(
              child: Text('Masculino'),
              value: '1', //value pode ser mudado para valor mais significativo
            ),
            DropdownMenuItem(
              child: Text('Feminino'),
              value: '2',
            ),
          ]),
    );
  }
}

class DatePick extends StatefulWidget {
  final TextEditingController birthDateController;
  final String errorText;

  const DatePick(this.birthDateController, {Key key, this.errorText})
      : super(key: key);
  @override
  _DatePickState createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  DateTime _dateTime;
  String _date;

  String setDate(String dateTime) {
    setState(() {
      _date =
          "${dateTime.substring(8, 10)}/${dateTime.substring(5, 7)}/${dateTime.substring(0, 4)}";
    });
    return _date;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 31.5),
      height: 92,
      child: SizedBox(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: BorderSide(
            color:
                widget.errorText == null ? Colors.grey[500] : Colors.red[600],
          )),
          onPressed: () {
            showDatePicker(
                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(1920),
                    lastDate: DateTime(2022))
                .then((date) {
              setState(() {
                _dateTime = date;
                widget.birthDateController.text = date.toIso8601String();
              });
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _dateTime == null
                    ? "Data de nascimento"
                    : setDate(_dateTime.toString()),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              Icon(Icons.arrow_drop_down, size: 23, color: Colors.grey[700]),
            ],
          ),
        ),
      ),
    );
  }
}
