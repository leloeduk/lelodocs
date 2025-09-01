import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? address;

  const Client({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.address,
  });

  @override
  List<Object?> get props => [id, name, email, phone, address];
}
