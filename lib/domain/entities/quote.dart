import 'package:equatable/equatable.dart';
import 'product.dart';
import 'client.dart';

class Quote extends Equatable {
  final String id;
  final Client client;
  final List<Product> items;
  final double total;
  final DateTime date;
  final bool convertedToInvoice;

  const Quote({
    required this.id,
    required this.client,
    required this.items,
    required this.total,
    required this.date,
    this.convertedToInvoice = false,
  });

  @override
  List<Object?> get props => [
    id,
    client,
    items,
    total,
    date,
    convertedToInvoice,
  ];
}
