import 'package:aps_mobile/view/custom_drawer/custom_drawer.dart';
import 'package:aps_mobile/view/tabs/places/components/places_tile.dart';
import 'package:flutter/material.dart';

class PlacesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Lojas Físicas'),
        centerTitle: true,
      ),
      body: ListView(
        children: lojaFisicas.map<PlaceTile>(
                (local) => PlaceTile(
                  title: local['descricao'],
                  endereco: local['endereco'],
                  imgLink: local['imgLink'],
                  lat: local['lat'],
                  long: local['long'],
                )
        ).toList(),
      ),
    );
  }

  final lojaFisicas = [
    {
      "descricao": "Loja Av. Brasil",
      "endereco": "Av.Brasil",
      "imgLink": "https://lh3.googleusercontent.com/proxy/L6bepSytpKbIFDvhJsMvoe68ZWcModbdAN9zlZx9I-H_j483YDrYmijrIZeA1uzQ9mzb8qxvOcP67be9xBUwcSI10SDkBEL9FDMruCInX74lLjw7bR9iIjeK5bjAHCxC-rYxmf3Jw5MRjMZsmjk",
      "lat": -23.574261,
      "long": -46.6667211
    },
    {
      "descricao": "Loja Av.Prof. João Fiúsa",
      "endereco": "Av.Prof. João Fiúsa",
      "imgLink": "https://listenx.com.br/blog/wp-content/uploads/2019/11/listenxproducoes_listenxmusicemotionforbusiness_image_467.jpeg",
      "lat": -21.2107157,
      "long": -47.8064192
    }
  ];

}
