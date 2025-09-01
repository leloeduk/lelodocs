import '../entities/invoice.dart';

abstract class InvoiceRepository {
  Future<void> createInvoice(Invoice invoice);
  Future<List<Invoice>> getInvoices();
  Future<void> markAsPaid(String id);
}
