import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/app/models/client_model.dart';
import 'package:learn_bloc/app/modules/client/client_event.dart';
import 'package:learn_bloc/app/modules/client_form/client_form_bloc.dart';

import '../modules/client/client_bloc.dart';
import '../modules/client_form/client_form_event.dart';
import '../modules/client_form/client_form_state.dart';

class ClientFormPage extends StatefulWidget {
  ClientFormPage({super.key});

  @override
  State<ClientFormPage> createState() => _ClientFormPageState();
}

class _ClientFormPageState extends State<ClientFormPage> {
  final TextEditingController textFormNameController = TextEditingController();

  final TextEditingController textFormEmailController = TextEditingController();

  final ClientFormBloc clientFormBloc = ClientFormBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Cliente'),
      ),
      body: BlocBuilder(
        bloc: clientFormBloc,
        builder: (context, state) {
          if (state is ClientFormLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ClientFormErrorState) {
            final String message = state.menssage;

            return Center(
              child: Text(message),
            );
          }
          if (state is ClientFormSucessState) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.of(context).pop();
            });
          }
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextFormField(
                  controller: textFormNameController,
                  decoration: const InputDecoration(
                    label: Text('Nome:'),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: textFormEmailController,
                  decoration: const InputDecoration(
                    label: Text('Email:'),
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final String name = textFormNameController.text;
                    final String email = textFormEmailController.text;

                    final client = ClientModel(name: name, email: email);

                    Navigator.of(context).pop(client);
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
