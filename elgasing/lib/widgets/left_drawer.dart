// Asumsikan berkas ini ada di direktori yang sesuai (contoh: di luar folder widgets)
// Sesuaikan path import berikut jika struktur folder Anda berbeda
import 'package:elgasing/screens/myItemlist.dart';
import 'package:flutter/material.dart';
import 'package:elgasing/screens/menu.dart';
import 'package:elgasing/screens/itemslist_form.dart';
import 'package:elgasing/screens/items_entry_list.dart';


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text(
                  'ElGasing Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Selamat Datang di ElGasing Shop! Toko Bola Tergacor',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(), 
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Add items'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductFormPage(), 
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('Item List'),
            onTap: () {
                // Route to news list page
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ItemListPage()),
                );
            },
        ),


        ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('My Item'),
            onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyItemsPage()),
                );
            },
        ),
        ],
      ),
    );
  }
}