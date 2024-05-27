import 'package:bloc/bloc.dart';

import '../../models/client_model.dart';
import '../../repositories/client_repository.dart';
import 'client_event.dart';
import 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final ClientRepository clientRepo = ClientRepository();

  ClientBloc() : super(ClientInitialState()) {
    on<LoadClientEvent>(
      (event, emit) {
        emit(ClientLoadingState());
        try {
          List<ClientModel> clients = clientRepo.loadClients();
          emit(ClientSucessState(clients: clients));
        } catch (e) {
          emit(ClientErrorState(message: e.toString()));
        }
      },
    );

    on<AddClientEvent>(
      (event, emit) {
        emit(ClientLoadingState());
        try {
          clientRepo.addClient(event.client);
          List<ClientModel> clients = clientRepo.loadClients();
          emit(ClientSucessState(clients: clients));
        } catch (e) {
          emit(ClientErrorState(message: e.toString()));
        }
      },
    );

    on<RemoveClientEvent>(
      (event, emit) {
        emit(ClientLoadingState());
        try {
          clientRepo.removeClient(event.client);
          List<ClientModel> clients = clientRepo.loadClients();
          emit(ClientSucessState(clients: clients));
        } catch (e) {
          emit(ClientErrorState(message: e.toString()));
        }
      },
    );
  }
}
