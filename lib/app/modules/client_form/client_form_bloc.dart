import 'package:bloc/bloc.dart';

import '../../repositories/client_repository.dart';
import 'client_form_event.dart';
import 'client_form_state.dart';

class ClientFormBloc extends Bloc<ClientFormEvent, ClientFormState> {
  final ClientRepository clientRep = ClientRepository();

  ClientFormBloc() : super(ClientFormInitialState()) {
    on<AddClientFormEvent>((event, emit) async {
      emit(ClientFormLoadingState());
      try {
        clientRep.addClient(event.clientForm);
        emit(ClientFormSucessState());
      } catch (e) {
        emit(ClientFormErrorState(menssage: e.toString()));
      }
    });
  }
}
