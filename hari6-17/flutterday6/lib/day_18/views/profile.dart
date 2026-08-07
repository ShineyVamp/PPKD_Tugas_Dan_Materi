import 'package:flutter/material.dart';
import 'package:flutterday6/day_18/database/db_helper.dart';
import 'package:flutterday6/day_18/model/user_login_model.dart';

class DaftarPengguna extends StatefulWidget {
  const DaftarPengguna({super.key});

  @override
  State<DaftarPengguna> createState() => _DaftarPenggunaState();
}

class _DaftarPenggunaState extends State<DaftarPengguna> {
  void _refreshList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Profil Pengguna")),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<UserModelSQL>>(
              future: DBHelper().getAllUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Terjadi kesalahan: ${snapshot.error}'),
                  ); // Center
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Tidak ada data pengguna.'),
                  ); // Center
                }

                final daftarPengguna = snapshot.data!;

                return ListView.builder(
                  itemCount: daftarPengguna.length,
                  itemBuilder: (context, index) {
                    final user = daftarPengguna[index];
                    return Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ), // CircleAvatar
                        title: Text(user.email),
                        subtitle: Text('Password: ${user.password}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                _showBottomSheet(
                                  context,
                                  daftarPengguna[index],
                                );
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                _showBottomSheet(
                                  context,
                                  daftarPengguna[index],
                                );
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ), // ListTile
                    ); // Card
                  },
                ); // ListView.builder
              },
            ), // FutureBuilder
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, UserModelSQL user) {
    final emailController = TextEditingController(text: user.email);
    final passwordController = TextEditingController(text: user.password);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ), // RoundedRectangleBorder
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ), // EdgeInsets.only
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Kelola Pengguna',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ), // Text
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ), // InputDecoration
              ), // TextField
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ), // InputDecoration
              ), // TextField
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ), // Text
                    onPressed: () async {
                      if (user.id != null) {
                        final updatedUser = UserModelSQL(
                          id: user.id,
                          email: emailController.text.trim(),
                          password: passwordController.text,
                        ); // UserModelSQL

                        bool success = await DBHelper().updateUser(updatedUser);
                        if (success && context.mounted) {
                          Navigator.pop(context);
                          _refreshList();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data berhasil diperbarui'),
                            ), // SnackBar
                          );
                        }
                      }
                    },
                  ), // ElevatedButton.icon
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    icon: const Icon(Icons.delete, color: Colors.white),
                    label: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ), // Text
                    onPressed: () async {
                      if (user.id != null) {
                        await DBHelper().deleteUser(user.id!);
                        if (context.mounted) {
                          Navigator.pop(context);
                          _refreshList();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data berhasil dihapus'),
                            ), // SnackBar
                          );
                        }
                      }
                    },
                  ), // ElevatedButton.icon
                ],
              ), // Row
              const SizedBox(height: 20),
            ],
          ), // Column
        ); // Padding
      },
    );
  }
}
