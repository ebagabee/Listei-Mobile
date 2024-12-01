import 'package:flutter/material.dart';

// Lista padrão inicial
const defaultItems = ['pao', 'leite', 'ovos', 'queijo', 'banha'];

class ShoppingListCard extends StatelessWidget {
  final String title;
  final List<String> items;

  // Construtor com valores padrão
  const ShoppingListCard({
    Key? key,
    this.title = 'Lista Inicial',
    this.items = defaultItems,
  }) : super(key: key);

  // Funcao para auxiliar para pegar os 5 primeiros itens
  String _getFirstFiveItems() {
    return items.take(5).join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ), // Espaçamento
          Text(
            _getFirstFiveItems(),
            style: const TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    ));
  }
}
