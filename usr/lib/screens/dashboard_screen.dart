import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void _handleLogout(BuildContext context) {
    // Implementasi fitur logout (SKPL-PKM.F-0009)
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin keluar dari sistem?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context); // Tutup dialog
              Navigator.pushReplacementNamed(context, '/'); // Kembali ke login
            },
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard PakanMoo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Keluar',
            onPressed: () => _handleLogout(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nama Pengguna',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'Role: Admin', // Mock role (SKPL-PKM.F-0006)
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.inventory),
              title: const Text('Stok Pakan'),
              onTap: () {}, // TODO: Implementasi halaman stok
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Jadwal Pakan'),
              onTap: () {}, // TODO: Implementasi halaman jadwal
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Laporan'),
              onTap: () {}, // TODO: Implementasi halaman laporan
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Manajemen Pengguna'),
              onTap: () {}, // TODO: Implementasi halaman manajemen pengguna
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ringkasan Sistem',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            // Grid untuk Ringkasan (SKPL-PKM.F-0048)
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildSummaryCard(
                  context,
                  title: 'Total Stok',
                  value: '1,250 kg',
                  icon: Icons.inventory_2,
                  color: Colors.blue,
                ),
                _buildSummaryCard(
                  context,
                  title: 'Pakan Masuk',
                  value: '500 kg',
                  icon: Icons.arrow_downward,
                  color: Colors.green,
                ),
                _buildSummaryCard(
                  context,
                  title: 'Pakan Keluar',
                  value: '250 kg',
                  icon: Icons.arrow_upward,
                  color: Colors.orange,
                ),
                _buildSummaryCard(
                  context,
                  title: 'Jadwal Hari Ini',
                  value: '4 Jadwal',
                  icon: Icons.schedule,
                  color: Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
