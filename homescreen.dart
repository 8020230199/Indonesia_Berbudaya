import 'package:flutter/material.dart';
import 'provinsi.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  final List<Map<String, String>> provinces = const [
    {
      'name': 'Jambi',
      'image': 'gambar/jambi.jpg',
      'id': 'jambi'
    },
    {
      'name': 'Jawa Tengah',
      'image': 'gambar/jawa tengah.jpg',
      'id': 'jateng'
    },
    {
      'name': 'Bali',
      'image': 'gambar/bali.jpg',
      'id': 'bali'
    },
    {
      'name': 'Yogyakarta',
      'image': 'gambar/yogyakarta.jpg',
      'id': 'diy'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indonesia Berbudaya'),
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Pengenalan
            const Text(
              'Selamat Datang di Indonesia!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Indonesia adalah negara kepulauan yang kaya akan warisan budaya dan sejarah. Jelajahi berbagai situs budaya menakjubkan yang tersebar di seluruh nusantara.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Pilih Provinsi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),

            // 2. GridView Provinsi
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3 / 2.5,
                ),
                itemCount: provinces.length,
                itemBuilder: (context, index) {
                  final province = provinces[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman provinsi
                       if (province['id'] == 'jambi') { // Hanya Jambi yang bisa diklik untuk demo ini
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProvinceScreen(provinceName: province['name']!),
                          ),
                        );
                       } else {
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text('Halaman untuk ${province['name']} belum tersedia.'))
                         );
                       }
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                province['image']!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                               color: Colors.brown.withOpacity(0.8),
                               borderRadius: const BorderRadius.only(
                                 bottomLeft: Radius.circular(10),
                                 bottomRight: Radius.circular(10),
                               ),
                            ),
                            child: Text(
                              province['name']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}