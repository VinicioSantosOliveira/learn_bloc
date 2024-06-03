import 'package:equatable/equatable.dart';

import '../../models/client_model.dart';

abstract class ClientState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ClientInitialState extends ClientState {}

class ClientLoadingState extends ClientState {}

class ClientSucessState extends ClientState {
  final List<ClientModel> clients;

  ClientSucessState({required this.clients});
}

class ClientErrorState extends ClientState {
  final String message;

  ClientErrorState({required this.message});
}
