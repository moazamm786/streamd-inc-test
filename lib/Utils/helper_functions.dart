import 'package:intl/intl.dart';

class HelperFunctions {
  String compactNumber({required int number}) {
    int decimalDigits = number < 1000 ? 0 : 1;
    return NumberFormat.compactCurrency(
            decimalDigits: decimalDigits, symbol: '')
        .format(number);
  }

  String formatPrice({required int price}) {
    var formatter = NumberFormat('#,###');
    return formatter.format(price);
  }

  String formatDate({required String date, String? format}) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat(format??'HH:mm').format(dateTime);
  }

  String messageFormattedDate({required DateTime date}){
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);


    final aDate = DateTime(date.year, date.month, date.day);
    if(aDate == today) {
    return 'Today';
    } else if(aDate == yesterday) {
      return 'Yesterday';
    }
    return formatDate(date: date.toString(), format: 'dd/mm/yyyy');
  }
}
