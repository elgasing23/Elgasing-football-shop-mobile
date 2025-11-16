import 'package:flutter/material.dart';
import 'package:elgasing/models/items_entry.dart';
import 'package:elgasing/widgets/items_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'items_detail.dart';

class MyItemsPage extends StatefulWidget {
  const MyItemsPage({super.key});

  @override
  State<MyItemsPage> createState() => _MyItemsPageState();
}

class _MyItemsPageState extends State<MyItemsPage> {

  Future<List<Item>> fetchMyItems(CookieRequest request) async {

    if (!request.jsonData.containsKey("id")) {

      final userInfo = await request.get("http://localhost:8000/auth/userinfo/");
      request.jsonData.addAll(userInfo);
    }

    int currentUser = request.jsonData["id"];


    final response = await request.get("http://localhost:8000/json/");

    List<Item> myItems = [];

    for (var d in response) {

      if (d['fields']['user'] == currentUser) {
        myItems.add(Item.fromJson(d));
      }
    }

    return myItems;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Items"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: fetchMyItems(request),
        builder: (context, snapshot) {
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Terjadi kesalahan: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }


          List<Item> items = snapshot.data ?? [];

          if (items.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Kamu belum membuat item apa pun.\nYuk tambahkan item baru!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, index) => ItemCard(
              item: items[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ItemDetailPage(item: items[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
