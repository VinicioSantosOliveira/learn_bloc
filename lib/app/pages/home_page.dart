import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/client_model.dart';
import '../modules/client/client_bloc.dart';
import '../modules/client/client_event.dart';
import '../modules/client/client_state.dart';
import 'client_form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ClientBloc clientBloc = ClientBloc();

  @override
  void initState() {
    clientBloc.add(LoadClientEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () async {
              ClientModel? client = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClientFormPage(),
                  ));
              if (client != null && client.email != '' && client.name != '') {
                clientBloc.add(AddClientEvent(client: client));
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder(
          bloc: clientBloc,
          builder: (context, state) {
            if (state is ClientLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ClientErrorState) {
              final String message = state.message;

              return Center(
                child: Text(message),
              );
            }
            if (state is ClientSucessState) {
              List<ClientModel> clients = state.clients;

              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: clients.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(clients[index].name),
                          subtitle: Text(clients[index].email),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            return Container();
          }),
    );
  }
}
