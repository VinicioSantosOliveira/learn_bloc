import 'package:equatable/equatable.dart';

import '../../models/client_model.dart';

class ClientFormEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AddClientFormEvent extends ClientFormEvent {
  final ClientModel clientForm;

  AddClientFormEvent({required this.clientForm});
}
