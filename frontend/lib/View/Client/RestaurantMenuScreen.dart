import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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

class Panier {
  List<Plat> plats = [];

  void ajouterAuPanier(Plat plat) {
    plats.add(plat);
  }

  double get total {
    return plats.fold(0, (sum, item) => sum + item.price);
  }

  void viderPanier() {
    plats.clear();
  }

  void supprimerDuPanier(int index) {
    plats.removeAt(index);
  }
}

class RestaurantMenuScreen extends StatefulWidget {
  @override
  _RestaurantMenuScreenState createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen>
    with TickerProviderStateMixin {
  List<Plat> plats = [
    Plat(
      name: 'Bolognese',
      imagePath: 'assets/palt1.png',
      price: 12.50,
      description: '',
    ), Plat(
      name: 'Pizza',
      imagePath: 'assets/palt1.png',
      price: 12.50,
      description: '',
    ), Plat(
      name: 'makloub',
      imagePath: 'assets/plat3.png',
      price: 12.50,
      description: '',
    ), Plat(
      name: 'mlewi',
      imagePath: 'assets/plats2.png',
      price: 12.50,
      description: '',
    ),
    Plat(
      name: 'Pizza Margherita',
      imagePath: 'assets/palt1.png',
      price: 9.00,
      description: '',
    ),
    // Add more dishes here
  ];

  Panier panier = Panier();

  void _ajouterAuPanier(Plat plat) {
    setState(() {
      panier.ajouterAuPanier(plat);
      _showAddToCartAnimation();
    });
  }

  void _showAddToCartAnimation() {
    final snackBar = SnackBar(
      content: Text(
        'Plat ajouté au panier !',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _passerCommande() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(FontAwesomeIcons.checkCircle, color: Colors.green),
            SizedBox(width: 10),
            Text('Passer commande'),
          ],
        ),
        content: Text(
            'Voulez-vous passer la commande pour un total de ${panier.total.toStringAsFixed(2)} €?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Annuler', style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                panier.viderPanier();
              });
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Commande passée avec succès !'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Text('Confirmer'),
          ),
        ],
      ),
    );
  }

  void _supprimerDuPanier(int index) {
    setState(() {
      panier.supprimerDuPanier(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        hintColor: Colors.orangeAccent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orangeAccent,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green,
        ),
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: DefaultTextStyle(
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Menu du Restaurant'),
                WavyAnimatedText('Choisissez vos plats'),
              ],
              isRepeatingAnimation: true,
            ),
          ),
          backgroundColor: Colors.orangeAccent,
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.shoppingCart),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        padding: EdgeInsets.all(16),
                        height: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Votre Panier',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: panier.plats.length,
                                itemBuilder: (context, index) {
                                  return Slidable(
                                    key: ValueKey(index),
                                    endActionPane: ActionPane(
                                      motion: ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {
                                            _supprimerDuPanier(index);
                                          },
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'Supprimer',
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      elevation: 4,
                                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ListTile(
                                        leading: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            panier.plats[index].imagePath,
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        title: Text(
                                          panier.plats[index].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                        subtitle: Text(
                                            '${panier.plats[index].price.toStringAsFixed(2)} dt'),
                                        trailing: IconButton(
                                          icon: Icon(Icons.delete, color: Colors.red),
                                          onPressed: () {
                                            _supprimerDuPanier(index);
                                          },
                                        ),
                                        contentPadding: EdgeInsets.all(8),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total : ${panier.total.toStringAsFixed(2)}dt',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                ElevatedButton.icon(
                                  onPressed: panier.plats.isEmpty
                                      ? null
                                      : _passerCommande,
                                  icon: Icon(FontAwesomeIcons.checkCircle),
                                  label: Text('Commander'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                if (panier.plats.isNotEmpty)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Text(
                        '${panier.plats.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: plats.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 6,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    plats[index].imagePath,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  plats[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Text(
                    '${plats[index].price.toStringAsFixed(2)} dt\n${plats[index].description}'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        _ajouterAuPanier(plats[index]);
                      },
                    ),
                  ],
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            );
          },
        ),
      ),
    );
  }
}
