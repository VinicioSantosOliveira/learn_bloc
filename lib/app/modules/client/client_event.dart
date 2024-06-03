import 'package:equatable/equatable.dart';

import '../../models/client_model.dart';

abstract class ClientEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadClientEvent extends ClientEvent {}

class AddClientEvent extends ClientEvent {
  final ClientModel client;

  AddClientEvent({required this.client});
}

class RemoveClientEvent extends ClientEvent {
  final ClientModel client;

  RemoveClientEvent({required this.client});
}
