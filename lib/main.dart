import 'package:flutter/material.dart';

void main() => runApp(const DogClubApp());

class DogClubApp extends StatelessWidget {
  const DogClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog Club',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF0D47A1),
        scaffoldBackgroundColor: const Color(0xFFF0F4F8),
      ),
      home: const ServicesPage(),
    );
  }
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        elevation: 2,
        leading: const Icon(Icons.pets, color: Colors.white),
        title: const Text(
          'Dog Club',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: Colors.white),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(value: '1', child: Text('Inicio')),
              const PopupMenuItem(value: '2', child: Text('Perfil')),
              const PopupMenuItem(value: '3', child: Text('Contacto')),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            
            // Sección de Título "Servicios" con ícono a la derecha
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Servicios',
                      style: TextStyle(
                        fontSize: 22, 
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0D47A1)
                      ),
                    ),
                    SizedBox(width: 10),
                    // Cambiado a ícono de mascota (tipo hueso/huella) a la derecha
                    Icon(Icons.cruelty_free, color: Color(0xFF0D47A1)), 
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // SECCIÓN DE TARJETAS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildServiceCard(
                    Icons.hotel, 
                    'Hospedaje', 
                    'Sueño seguro y cómodo para tu mascota en instalaciones VIP.'
                  ),
                  const SizedBox(height: 15),
                  _buildServiceCard(
                    Icons.moped, 
                    'Guardería', 
                    'Diversión todo el día con supervisión constante y juegos.'
                  ),
                  const SizedBox(height: 15),
                  _buildServiceCard(
                    Icons.directions_walk, 
                    'Paseo', 
                    'Rutas llenas de aventura para mantener la salud de tu perro.'
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // BOTÓN RESERVA AHORA (Cuadrado)
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D47A1),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, 
                ),
              ),
              child: const Text(
                'RESERVA AHORA',
                style: TextStyle(
                  fontSize: 18, 
                  color: Colors.white, 
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
      
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pets, size: 18, color: Colors.grey),
            SizedBox(width: 8),
            Text(
              'Nicolas Rios Perales',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar ajustado para ocupar el ancho total
  Widget _buildServiceCard(IconData icon, String title, String desc) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF1976D2), size: 35),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 18,
                      color: Color(0xFF0D47A1),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}