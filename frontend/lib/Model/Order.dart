class Order {
  final String id;
  final String title;
  final String status; // "Terminé" or "En cours"
  final String details;

  Order({
    required this.id,
    required this.title,
    required this.status,
    required this.details,
  });
}
