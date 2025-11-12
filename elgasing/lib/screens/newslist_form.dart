import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  int _price = 0;
  String _description = "";
  String _category = "sepatu";
  String _thumbnail = "";
  bool _isFeatured = false;

  final List<String> _categories = [
    'sepatu',
    'jersey',
    'celana',
    'gear',
    'bola',
    'anal',
  ];

  bool _isValidUrl(String value) {
    final urlPattern = r'^(http|https):\/\/[^\s$.?#].[^\s]*$';
    return RegExp(urlPattern).hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Tambah Produk Baru')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === NAME ===
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nama Produk",
                  hintText: "Masukkan nama produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) => setState(() => _name = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong!";
                  }
                  if (value.length < 3) {
                    return "Nama minimal 3 karakter!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // === PRICE ===
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Harga Produk",
                  hintText: "Masukkan harga (dalam angka)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() {
                  _price = int.tryParse(value) ?? 0;
                }),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harga tidak boleh kosong!";
                  }
                  final num? val = num.tryParse(value);
                  if (val == null || val < 0) {
                    return "Harga harus berupa angka positif!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // === DESCRIPTION ===
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "Deskripsi Produk",
                  hintText: "Masukkan deskripsi produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) => setState(() => _description = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Deskripsi tidak boleh kosong!";
                  }
                  if (value.length < 10) {
                    return "Deskripsi minimal 10 karakter!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // === CATEGORY ===
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Kategori",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                value: _category,
                items: _categories
                    .map((cat) => DropdownMenuItem(
                          value: cat,
                          child:
                              Text(cat[0].toUpperCase() + cat.substring(1)),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _category = value!),
              ),
              const SizedBox(height: 12),

              // === THUMBNAIL ===
              TextFormField(
                decoration: InputDecoration(
                  labelText: "URL Thumbnail",
                  hintText: "Masukkan URL gambar produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) => setState(() => _thumbnail = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "URL thumbnail tidak boleh kosong!";
                  }
                  if (!_isValidUrl(value)) {
                    return "URL tidak valid!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // === IS FEATURED ===
              SwitchListTile(
                title: const Text("Tandai sebagai Produk Unggulan"),
                value: _isFeatured,
                onChanged: (value) =>
                    setState(() => _isFeatured = value),
              ),
              const SizedBox(height: 16),

              // === SAVE BUTTON ===
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Produk Berhasil Disimpan"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nama: $_name"),
                                Text("Harga: $_price"),
                                Text("Deskripsi: $_description"),
                                Text("Kategori: $_category"),
                                Text("Thumbnail: $_thumbnail"),
                                Text("Unggulan: ${_isFeatured ? 'Ya' : 'Tidak'}"),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  _formKey.currentState!.reset();
                                  setState(() {
                                    _isFeatured = false;
                                    _category = 'update';
                                  });
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
