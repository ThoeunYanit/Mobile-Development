enum DeliveryType { delivery, pickup }

class Product {
  String name;
  double price;

  Product({required this.name, required this.price});

  @override
  String toString() => 'Product name: $name, Product price: \$$price';
}

class Customer {
  String name;
  String? address;

  Customer({required this.name, this.address = 'No Customer Address'});

  @override
  String toString() {
    return 'Customer: $name, Address: $address';
  }
}

class Order {
  Customer customer;
  List<Product> products;
  DeliveryType deliveryType;
  String? deliveryAddress;

  Order({
    required this.customer,
    required this.products,
    required this.deliveryType,
    this.deliveryAddress = 'No Delivery Address',
  });

  double getTotalAmount() {
    double total = 0;

    for (var product in products) {
      total += product.price;
    }

    if (deliveryType == DeliveryType.delivery) {
      total += 2.5;
    }

    return total;
  }

  void printReceipt() {
    print('\n---Receipt---\n');
    print(customer);
    print(products.join('\n'));
    print('Delivery Type: ' + deliveryType.name);
    print('Delivery Address: ${deliveryAddress}');
    print('Order Total: \$${getTotalAmount()}');
    print('\n-------------');
  }
}

void main() {
  Product laptop = Product(name: "Laptop", price: 950);

  Product mouse = Product(name: "Mouse", price: 25);

  Product keyboard = Product(name: "Keyboard", price: 45);

  Customer customer1 = Customer(name: "John", address: "Phnom Penh");

  // Delivery order
  Order order1 = Order(
    customer: customer1,
    products: [laptop, mouse],
    deliveryType: DeliveryType.delivery,
    deliveryAddress: "Street 2004",
  );

  // Pickup order
  Order order2 = Order(
    customer: customer1,
    products: [keyboard],
    deliveryType: DeliveryType.pickup,
  );

  Customer customer2 = Customer(name: 'Doe');

  Order order3 = Order(
    customer: customer2,
    products: [laptop, mouse, keyboard],
    deliveryType: DeliveryType.pickup,
  );

  // print("Order 1 total: \$${order1.getTotalAmount()}");
  // print("Order 2 total: \$${order2.getTotalAmount()}");
  order1.printReceipt();
  order2.printReceipt();
  order3.printReceipt();
}
