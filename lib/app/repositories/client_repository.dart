import 'package:learn_bloc/app/models/client_model.dart';

class ClientRepository {
  final List<ClientModel> _clients = [
    ClientModel(name: 'Luan Souza', email: 'luansouza@gmail.com'),
    ClientModel(name: 'Ana Clara', email: 'anaclara@gmail.com'),
    ClientModel(name: 'Vinicio Oliveira', email: 'viniciooliveira@gmail.com'),
    ClientModel(name: 'Natan Valim', email: 'natanvalim@gmail.com'),
  ];

  Future<List<ClientModel>> loadClients() async {
    await Future.delayed(const Duration(seconds: 2));

    return _clients;
  }

  void addClient(ClientModel client) {
    _clients.add(client);
  }

  void removeClient(ClientModel client) {
    _clients.remove(client);
  }
}
