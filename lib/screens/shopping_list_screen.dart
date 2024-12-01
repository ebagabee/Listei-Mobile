import 'package:flutter/material.dart';
import 'package:listei_mobile/components/new_list_card.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold é o widget base que fornece a estrutura visual básica do Material Design
      appBar: AppBar(
        // AppBar é a barra superior do aplicativo
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.png'),
        ),
        title: const Text(
          'Listou',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          // Actions são os widgets que aparecem no lado direito do AppBar
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // TODO: Ação do Menu Hamburger
              print('Menu clicked');
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            NewListCard(
              onTap: () {
                print('Criar nova lista');
              },
            )
          ],
        ),
      ),
    );
  }
}
