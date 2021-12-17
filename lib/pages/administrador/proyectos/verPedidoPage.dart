import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_2021_app/models/proyectoDetalleModel.dart';
import 'package:tp_2021_app/resources/colors.dart';
import 'package:tp_2021_app/resources/strings.dart';
import 'package:tp_2021_app/services/eventServices.dart';

class PedidoDetail extends StatefulWidget {
  final int idPedido;
  const PedidoDetail({ Key? key , required this.idPedido}) : super(key: key);

  @override
  _PedidoDetailState createState() => _PedidoDetailState();
}

class _PedidoDetailState extends State<PedidoDetail> {
  late ProyectoDetalleModel model ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void cargarData(){

  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorBlueDark2,
      appBar: AppBar(
        title: Text('Detalle de Pedido'),
        backgroundColor: colorBlueDark2,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Text('NOMBRE DEL PEDIDO'),
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              child: FutureBuilder(future: eventServices.getByIDPedido(widget.idPedido),
              builder: (BuildContext context, AsyncSnapshot<ProyectoDetalleModel> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    final temp = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(temp.nombrePedido!,style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    );
                  } else {
                    return Text(resultError);
                  }
                } else {
                  return Positioned.fill(child: Center(child: CupertinoActivityIndicator(),));
                }
              },),
            ),
          ),
        ],
      ),
    );
  }
}