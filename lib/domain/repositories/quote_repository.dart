import '../entities/quote.dart';

abstract class QuoteRepository {
  Future<void> createQuote(Quote quote);
  Future<List<Quote>> getQuotes();
  Future<void> convertToInvoice(String id);
}
