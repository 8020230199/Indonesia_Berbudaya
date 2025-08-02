import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SiteDetailScreen extends StatelessWidget {
  const SiteDetailScreen({super.key});

  final String gmapsUrl = 'https://maps.app.goo.gl/uXv9xNAW5dG8EwMZA';

  // Fungsi untuk membuka URL Google Maps
  Future<void> _launchMapsUrl() async {
    final Uri uri = Uri.parse(gmapsUrl);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $gmapsUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candi Muaro Jambi'),
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Penjelasan dan Sejarah
              const Text(
                'Sejarah Candi Muaro Jambi',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'gambar/cmj.jpg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Kompleks Percandian Muaro Jambi adalah sebuah kompleks percandian agama Hindu-Buddha terluas di Asia Tenggara, dengan luas 3981 hektar. Kemungkinan besar merupakan peninggalan Kerajaan Sriwijaya dan Kerajaan Melayu. Kompleks ini terletak di Kecamatan Maro Sebo, Kabupaten Muaro Jambi, Jambi, Indonesia, tepatnya di tepi Batang Hari, sekitar 26 kilometer arah timur Kota Jambi.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              
              // Galeri Foto
              const Text(
                'Galeri Candi',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildGalleryItem(
                  'Candi Gumpung',
                  'Merupakan candi terbesar di kompleks ini, berfungsi sebagai pusat ritual keagamaan.',
                  'gambar/gumpung.jpg'
              ),
               _buildGalleryItem(
                  'Candi Tinggi',
                  'Memiliki struktur bangunan yang tinggi dengan halaman yang luas.',
                  'gambar/tinggi.jpg'
              ),
              const SizedBox(height: 24),

              // Detail Lokasi
              const Text(
                'Lokasi Situs',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.red, size: 30),
                  title: const Text('Kompleks Candi Muaro Jambi'),
                  subtitle: const Text('Kec. Maro Sebo, Kabupaten Muaro Jambi, Jambi'),
                  trailing: ElevatedButton.icon(
                    onPressed: _launchMapsUrl,
                    icon: const Icon(Icons.map),
                    label: const Text('Buka Peta'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat item galeri
  Widget _buildGalleryItem(String title, String description, String imageUrl) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  Text(description, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}