import 'package:flutter/material.dart';

class ClientFormPage extends StatelessWidget {
  ClientFormPage({super.key});
  final TextEditingController textFormNameController = TextEditingController();
  final TextEditingController textFormEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Cliente'),
      ),
      body: Padding(
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
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.save),
              label: const Text('Salvar'),
            )
          ],
        ),
      ),
    );
  }
}
