import 'package:aps_mobile/model/pedido.dart';
import 'package:aps_mobile/model/user.dart';
import 'package:aps_mobile/repositories/pedido_repository.dart';
import 'package:mobx/mobx.dart';

part 'pedido_store.g.dart';

class PedidoStore = _PedidoStore with _$PedidoStore;

abstract class _PedidoStore with Store {

  final _pedidoRepository = PedidoRepository();

  @observable
  List<Pedido> pedidos = [];

  @observable
  bool loading = false;

  Future<void> buscaPedidoPorCliente(User user) async {
    loading = true;

    pedidos = await _pedidoRepository.buscaPedidosPorCliente(user.id);

    loading = false;
  }

}