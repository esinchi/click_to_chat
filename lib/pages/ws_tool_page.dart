import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WsTools extends StatefulWidget {
  @override
  _WsToolsState createState() => _WsToolsState();
}

class _WsToolsState extends State<WsTools> {
  List<String> _myList = new List();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
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
              setState(() {});

              print(_myList);

              //print(intRegex.allMatches(value).map((m) => m.group(0)));
            },
            //autofocus: ,
          ),
        ),
        Text(
          'CLICK PARA CHATEAR',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        _listaNumeros(),
      ],
    ));
  }

  Widget _listaNumeros() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _myList.length,
      itemBuilder: (context, index) {
        //return Text(_myList[index]);

        return ListTile(
          leading: Icon(Icons.phone, color: Colors.blue),
          title: Text(_myList[index]),
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            print(_myList[index]);
            abrirWhatsapp(_myList[index]);
          },
        );
      },
    );
  }

  abrirWhatsapp(String telefono) async {
    String whatsappUrl = "whatsapp://send?phone=593$telefono";
    await canLaunch(whatsappUrl)
        ? launch(whatsappUrl)
        : print(
            "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  }
}
