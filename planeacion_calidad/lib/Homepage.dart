import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:planeacion_calidad/models/Area.dart';

Future<List<ReqResArea>>? getAreas() async {
  final url = Uri.parse("https://gist.github.com/Gustavovaldezurango/4454a97550380765212f8c9cf6c3cfbe");
  final respuesta = await http.get(url);
  print('Respuesta $respuesta');
  print('Respuesta ${respuesta.body}');
  return reqResAreaFromJson(respuesta.body);
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAreas(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ReqResArea>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListaUrl(snapshot.data);
          }
        },
      ),
    );
  }
}

class ListaUrl extends StatelessWidget {
  final List<ReqResArea>? areas;
  ListaUrl(this.areas);
  @override
  Widget build(BuildContext context) {
    print(this.areas);
    return ListView.builder(
      itemCount: areas!.length,
      itemBuilder: (BuildContext context, int index) {
        final area = areas![index];
        return ListTile(
          trailing: Image.network(area.urlArea),
        );
      },
    );
  }
}
