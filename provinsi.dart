import 'package:flutter/material.dart';
import 'situs.dart';

class ProvinceScreen extends StatelessWidget {
  final String provinceName;

  const ProvinceScreen({super.key, required this.provinceName});

  
  final List<Map<String, String>> culturalSites = const [
    {
      'name': 'Candi Muaro Jambi',
      'photo': 'gambar/cmj.jpg',
      'description': 'Kompleks percandian Hindu-Buddha terluas di Asia Tenggara.',
      'id': 'candi_muaro_jambi',
    },
    {
      'name': 'Masjid Agung Al-Falah',
      'photo': 'gambar/masjid.jpg',
      'description': 'Dikenal sebagai Masjid Seribu Tiang yang ikonik di Jambi.',
      'id': 'masjid_al_falah',
    },
    {
      'name': 'Rumah Adat Kajang Lako',
      'photo': 'gambar/rumah adat.jpg',
      'description': 'Rumah panggung tradisional khas masyarakat Jambi.',
      'id': 'rumah_kajang_lako',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budaya di $provinceName'),
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: culturalSites.length,
        itemBuilder: (context, index) {
          final site = culturalSites[index];
          return GestureDetector(
            onTap: () {
              // Navigasi ke halaman detail situs
              if (site['id'] == 'candi_muaro_jambi') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SiteDetailScreen(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Halaman untuk ${site['name']} belum tersedia.'))
                );
              }
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      site['photo']!,
                      // Removed fixed height to allow the image to take full width and adjust height
                      fit: BoxFit.cover, // Ensures the image covers the available space without distortion
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          site['name']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          site['description']!,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}