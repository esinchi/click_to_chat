import 'package:flutter/material.dart';

class WhatsAppTool extends StatelessWidget {
  List<String> _myList = new List();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Pega tu texto',
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 4,
              maxLines: 6,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:
                      'Hola por favor escribeme a mi whatsapp 0995636354 o al 0992554723 gracias'),
              onChanged: (value) {
                //ejecutamos cada vez q cambie el texto, creamos una lista, y guardamos los numeros
                final intRegex = RegExp(r'\d+', multiLine: true);

                _myList =
                    intRegex.allMatches(value).map((m) => m.group(0)).toList();

                // print(myList);

                //print(intRegex.allMatches(value).map((m) => m.group(0)));
              },
            ),
          ),
          Text(
            'NUMEROS',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          numeros()
        ],
      ),
    );
  }

  Widget numeros() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _myList.length,
      itemBuilder: (BuildContext context, int index) {
        return Text('ok');
      },
    );
  }
}
