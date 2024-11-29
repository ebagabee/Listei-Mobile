import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Container principal que ocupa toda a tela
      body: Container(
        color: Colors.white,
        // Padding para dar espaçamento em toda a tela
        padding: const EdgeInsets.all(20),
        // SafeArea garante que o conteúdo não fique sob a barra de status
        child: SafeArea(
          child: Column(
            // Alinha os elementos verticalmente
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Coluna para os textos superiores
              Column(
                children: [
                  const SizedBox(height: 60), // Espaço para o topo
                  // Titulo principal
                  const Text(
                    'Organize sua\nLista de Compras',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20), // Espaço entre os textos
                  // Texto explicativo
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text:
                                'Com o Listou, você pode criar\ne organizar suas compras com '),
                        TextSpan(
                          text: 'facilidade',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)),
              ),

              // Botão de criar lista
              SizedBox(
                width: double.infinity, // Botao ocupa toda a largura
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TestPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Criar Lista',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),

          // Área cinza para futura imagem (placeholder)
        ),
      ),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rota de Teste'),
      ),
    );
  }
}
