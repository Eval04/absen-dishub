import 'package:flutter/material.dart';

class UserAbsenPage extends StatefulWidget {
  const UserAbsenPage({super.key});

  @override
  State<UserAbsenPage> createState() => _UserAbsenPageState();
}

class _UserAbsenPageState extends State<UserAbsenPage> {
  bool sudahAbsenMasuk = false;
  bool sudahAbsenPulang = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF03254C),
        title: const Text('SIMAGANG Dishub'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// INFO USER
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Budi Santoso',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF03254C),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('NIM: 12345678'),
                  Text('Universitas Negeri'),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// STATUS KEHADIRAN
            _card(
              color: const Color(0xFF187BCD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Status Kehadiran Hari Ini',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    sudahAbsenPulang
                        ? 'Hadir (Lengkap)'
                        : sudahAbsenMasuk
                            ? 'Sudah Absen Masuk'
                            : 'Belum Absen',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// TOMBOL ABSEN MASUK
            _button(
              text: 'Absen Masuk',
              color: const Color(0xFF1167B1),
              enabled: !sudahAbsenMasuk,
              onTap: () {
                setState(() {
                  sudahAbsenMasuk = true;
                });
              },
            ),

            const SizedBox(height: 12),

            /// TOMBOL ABSEN PULANG
            _button(
              text: 'Absen Pulang',
              color: const Color(0xFF187BCD),
              enabled: sudahAbsenMasuk && !sudahAbsenPulang,
              onTap: () {
                setState(() {
                  sudahAbsenPulang = true;
                });
              },
            ),

            const SizedBox(height: 24),

            /// RIWAYAT ABSEN
            const Text(
              'Riwayat Absen',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF03254C),
              ),
            ),
            const SizedBox(height: 8),

            _riwayat('24 Apr 2024', 'Hadir'),
            _riwayat('23 Apr 2024', 'Izin'),
            _riwayat('22 Apr 2024', 'Hadir'),
            _riwayat('21 Apr 2024', 'Sakit'),
            _riwayat('20 Apr 2024', 'Alpha'),
          ],
        ),
      ),
    );
  }

  Widget _card({required Widget child, Color? color}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  Widget _button({
    required String text,
    required Color color,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          disabledBackgroundColor: color.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _riwayat(String tanggal, String status) {
    Color statusColor;
    switch (status) {
      case 'Hadir':
        statusColor = Colors.green;
        break;
      case 'Izin':
        statusColor = Colors.orange;
        break;
      case 'Sakit':
        statusColor = Colors.deepOrange;
        break;
      default:
        statusColor = Colors.red;
    }

    return Card(
      child: ListTile(
        title: Text(tanggal),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
