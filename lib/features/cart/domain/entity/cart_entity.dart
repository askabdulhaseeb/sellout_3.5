class CartEntity {
  const CartEntity({
    required this.postId,
    required this.quantity,
    required this.listId,
    required this.color,
    required this.size,
  });

  final String postId;
  final int quantity;
  final String listId;
  final String color;
  final String size;
}
