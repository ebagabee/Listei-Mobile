import 'package:flutter/material.dart';

class NewListCard extends StatelessWidget {
  // Podemos adicionar uma função de callback para onTap
  final VoidCallback onTap;

  const NewListCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF5722),
              Color(0xFFFF7043),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
