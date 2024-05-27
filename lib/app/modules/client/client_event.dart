import 'package:learn_bloc/app/models/client_model.dart';

abstract class ClientEvent {}

class LoadClientEvent extends ClientEvent {}

class AddClientEvent extends ClientEvent {
  final ClientModel client;

  AddClientEvent({required this.client});
}

class RemoveClientEvent extends ClientEvent {
  final ClientModel client;

  RemoveClientEvent({required this.client});
}
