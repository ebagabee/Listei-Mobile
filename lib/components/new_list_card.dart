import 'package:flutter/material.dart';

class NewListCard extends StatelessWidget {
  // VoiceCallback é um tipo do Flutter para funções que não recebem parametros
  final VoidCallback onTap;

  // Construtor que exige que onTap seja fornecido (required)
  const NewListCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Altura fixa do container em Logical pixels
      height: 60,
      // Ocupa toda a largura disponível do pai
      width: double.infinity,

      // BoxDecoration define o visual do container
      decoration: BoxDecoration(
        // Gradiente linear (degradê)
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF5722),
              Color(0xFFFF7043),
            ],
            // Direção do gradiente, da esquerda para direita
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(12)),
      // InWell adiciona capacidade de toque com efeito visual
      child: InkWell(
        // Função chamada para quando o usuário toca no card
        onTap: onTap,
        // Centraliza o icone no container
        child: const Center(
          child: Icon(
            Icons.add, // Icone de adição
            color: Colors.white,
            size: 30, // Tamanho do icone
          ),
        ),
      ),
    );
  }
}
