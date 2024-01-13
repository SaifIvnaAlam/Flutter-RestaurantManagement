import '../../create_item/domain/item_model.dart';
import 'package:restaurantmanagement/src/features/orders/domain/order_model.dart';

List<OrderModel> demoOrderData = [
  OrderModel(
    id: "1",
    orderBy: "Customer 1",
    orderDate: "2024-01-14",
    totalPrice: "50.00",
    tableNo: 1,
    itemsOrdered: [
      ItemModel(
        id: "101",
        name: "Product A",
        price: 20.00,
        description: "Description for Product A",
        image: "image_a.jpg",
      ),
      ItemModel(
        id: "102",
        name: "Product B",
        price: 10.00,
        description: "Description for Product B",
        image: "image_b.jpg",
      ),
    ],
  ),
  OrderModel(
    id: "2",
    orderBy: "Customer 2",
    orderDate: "2024-01-15",
    totalPrice: "75.00",
    tableNo: 2,
    itemsOrdered: [
      ItemModel(
        id: "201",
        name: "Product C",
        price: 30.00,
        description: "Description for Product C",
        image: "image_c.jpg",
      ),
      ItemModel(
        id: "202",
        name: "Product D",
        price: 15.00,
        description: "Description for Product D",
        image: "image_d.jpg",
      ),
    ],
  ),
  OrderModel(
    id: "1",
    orderBy: "Customer 1",
    orderDate: "2024-01-14",
    totalPrice: "50.00",
    tableNo: 1,
    itemsOrdered: [
      ItemModel(
        id: "101",
        name: "Product A",
        price: 20.00,
        description: "Description for Product A",
        image: "image_a.jpg",
      ),
      ItemModel(
        id: "102",
        name: "Product B",
        price: 10.00,
        description: "Description for Product B",
        image: "image_b.jpg",
      ),
    ],
  ),
  OrderModel(
    id: "1",
    orderBy: "Customer 1",
    orderDate: "2024-01-14",
    totalPrice: "50.00",
    tableNo: 1,
    itemsOrdered: [
      ItemModel(
        id: "101",
        name: "Product A",
        price: 20.00,
        description: "Description for Product A",
        image: "image_a.jpg",
      ),
      ItemModel(
        id: "102",
        name: "Product B",
        price: 10.00,
        description: "Description for Product B",
        image: "image_b.jpg",
      ),
    ],
  ),
  OrderModel(
    id: "1",
    orderBy: "Customer 1",
    orderDate: "2024-01-14",
    totalPrice: "50.00",
    tableNo: 1,
    itemsOrdered: [
      ItemModel(
        id: "101",
        name: "Product A",
        price: 20.00,
        description: "Description for Product A",
        image: "image_a.jpg",
      ),
      ItemModel(
        id: "102",
        name: "Product B",
        price: 10.00,
        description: "Description for Product B",
        image: "image_b.jpg",
      ),
    ],
  ),
  OrderModel(
    id: "1",
    orderBy: "Customer 1",
    orderDate: "2024-01-14",
    totalPrice: "50.00",
    tableNo: 1,
    itemsOrdered: [
      ItemModel(
        id: "101",
        name: "Product A",
        price: 20.00,
        description: "Description for Product A",
        image: "image_a.jpg",
      ),
      ItemModel(
        id: "102",
        name: "Product B",
        price: 10.00,
        description: "Description for Product B",
        image: "image_b.jpg",
      ),
    ],
  ),
  OrderModel(
    id: "1",
    orderBy: "Customer 1",
    orderDate: "2024-01-14",
    totalPrice: "50.00",
    tableNo: 1,
    itemsOrdered: [
      ItemModel(
        id: "101",
        name: "Product A",
        price: 20.00,
        description: "Description for Product A",
        image: "image_a.jpg",
      ),
      ItemModel(
        id: "102",
        name: "Product B",
        price: 10.00,
        description: "Description for Product B",
        image: "image_b.jpg",
      ),
    ],
  ),
  // Add more OrderModel instances with items as needed
];
