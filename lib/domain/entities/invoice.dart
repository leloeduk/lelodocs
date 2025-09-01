import 'package:equatable/equatable.dart';
import 'product.dart';
import 'client.dart';

class Invoice extends Equatable {
  final String id;
  final Client client;
  final List<Product> items;
  final double total;
  final DateTime date;
  final bool isPaid;

  const Invoice({
    required this.id,
    required this.client,
    required this.items,
    required this.total,
    required this.date,
    this.isPaid = false,
  });

  @override
  List<Object?> get props => [id, client, items, total, date, isPaid];
}
