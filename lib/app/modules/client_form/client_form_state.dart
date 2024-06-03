import 'package:equatable/equatable.dart';

class ClientFormState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ClientFormInitialState extends ClientFormState {}

class ClientFormLoadingState extends ClientFormState {}

class ClientFormSucessState extends ClientFormState {}

class ClientFormErrorState extends ClientFormState {
  final String menssage;

  ClientFormErrorState({required this.menssage});
}
