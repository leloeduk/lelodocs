import '../entities/client.dart';

abstract class ClientRepository {
  Future<void> addClient(Client client);
  Future<List<Client>> getClients();
  Future<void> deleteClient(String id);
}
