/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/state_managment.dart';

class AddItem extends ConsumerWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String productName = '';
  int quantity = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Nombre del producto'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa un nombre';
                }
                return null;
              },
              onSaved: (value) {
                productName = value ?? '';
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Cantidad'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa una cantidad';
                }
                return null;
              },
              onSaved: (value) {
                quantity = int.tryParse(value ?? '') ?? 0;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();

                  ref.read(cartListProvider.notifier).add(
                        CartItem(
                          name: productName,
                          quantity: quantity,
                          inCart: false,
                        ),
                      );

                  // Reiniciar el formulario
                  _formKey.currentState?.reset();

                  // Ocultar el teclado
                  //FocusScope.of(context).unfocus();

                  // Ocultar modal
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Añadir a la lista'),
            ),
          ],
        ),
      ),
    );
  }
}
*/

///*

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/state_managment.dart';

class AddItem extends ConsumerWidget {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  AddItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: productNameController,
            decoration: const InputDecoration(labelText: 'Nombre del producto'),
          ),
          TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Cantidad'),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              final productName = productNameController.text;
              final quantity = int.tryParse(quantityController.text);

              if (productName.isNotEmpty && quantity != null) {
                // int nextId = ref.read(cartListProvider.notifier).countTotalItems();
                // Añadir item a la lista
                ref.read(cartListProvider.notifier).add(
                      CartItem(
                        name: productName,
                        quantity: quantity,
                        inCart: false,
                      ),
                    );

                // Limpiar campos
                productNameController.clear();
                quantityController.clear();

                // Ocultar modal
                Navigator.of(context).pop();
              }
            },
            child: const Text('Añadir a la lista'),
          ),
        ],
      ),
    );
  }
}
//*/