import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Plat {
  String name;
  String imagePath;
  double price;
  String description;

  Plat({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
  });
}

class CreateMenuScreen extends StatefulWidget {
  @override
  _CreateMenuScreenState createState() => _CreateMenuScreenState();
}

class _CreateMenuScreenState extends State<CreateMenuScreen> {
  List<Plat> plats = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _addPlat() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      TextEditingController nameController = TextEditingController();
      TextEditingController priceController = TextEditingController();
      TextEditingController descriptionController = TextEditingController();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Ajouter un plat'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Nom du plat',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: 'Prix',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                if (pickedFile != null)
                  Image.file(
                    File(pickedFile.path),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    priceController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  setState(() {
                    plats.add(Plat(
                      name: nameController.text,
                      imagePath: pickedFile.path,
                      price: double.parse(priceController.text),
                      description: descriptionController.text,
                    ));
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Ajouter'),
            ),
          ],
        ),
      );
    }
  }

  void _modifyPlat(int index) {
    TextEditingController nameController = TextEditingController(text: plats[index].name);
    TextEditingController priceController = TextEditingController(text: plats[index].price.toString());
    TextEditingController descriptionController = TextEditingController(text: plats[index].description);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Modifier un plat'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nom du plat',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Prix',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  priceController.text.isNotEmpty &&
                  descriptionController.text.isNotEmpty) {
                setState(() {
                  plats[index] = Plat(
                    name: nameController.text,
                    imagePath: plats[index].imagePath,
                    price: double.parse(priceController.text),
                    description: descriptionController.text,
                  );
                });
                Navigator.of(context).pop();
              }
            },
            child: Text('Modifier'),
          ),
        ],
      ),
    );
  }

  void _deletePlat(int index) {
    setState(() {
      plats.removeAt(index);
    });
  }

  void _generateQRCode() {
    String menuData = plats
        .map((plat) =>
    '${plat.name} - ${plat.price.toStringAsFixed(2)} dt\nDescription: ${plat.description}')
        .join('\n\n');


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('    Menu de restaurant '),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code),
            onPressed: _generateQRCode,
          ),
        ],
      ),
      body: plats.isEmpty
          ? Center(
        child: Text(
          'Aucun plat ajouté',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: plats.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(plats[index].imagePath),
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                plats[index].name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                '${plats[index].price.toStringAsFixed(2)} dt\n${plats[index].description}',
                style: TextStyle(color: Colors.grey[700]),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.orange),
                    onPressed: () => _modifyPlat(index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deletePlat(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPlat,
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
