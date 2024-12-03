class ShoppingItem {
  final int id;
  final String name;
  final int quantity;
  final double unityPrice;
  final bool inCart;

  const ShoppingItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.unityPrice,
    required this.inCart,
  });
}
