import 'package:flutter_mobx_test/utils/string_util.dart';
import 'package:intl/intl.dart';

String formatDate(String format, num timestamp) {
  return DateFormat(format, 'pt_BR').format(
    DateTime.fromMillisecondsSinceEpoch(timestamp * 1000),
  );
}

String formatDatedddeMMMdeyyykkmm(DateTime dateTime) {
  if (dateTime == null) return "-";
  return DateFormat("dd 'de' MMMM 'de' yyyy, kk:mm", 'pt_BR').format(dateTime);
}

String formatDateddMMyyykkmm(DateTime dateTime) {
  if (dateTime == null) return "-";
  return DateFormat("dd/MM/yyyy kk:mm", 'pt_BR').format(dateTime);
}

String formatDateddMMyyyy(DateTime dateTime) {
  if (dateTime == null) return "-";
  return DateFormat("dd/MM/yyyy", 'pt_BR').format(dateTime);
}

String formatDateddMM(DateTime dateTime) {
  if (dateTime == null) return "-";
  return DateFormat("dd/MM", 'pt_BR').format(dateTime);
}

DateTime getDate([DateTime dateTime]) {
  if (dateTime == null) {
    dateTime = DateTime.now();
  }
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

DateTime doubleToDateTime(num date) {
  if (date != null) {
    String dateStr = date.toString();
    if (dateStr.length == 8) {
      return DateTime(
        int.parse(dateStr.substring(0, 4)),
        int.parse(dateStr.substring(4, 6)),
        int.parse(dateStr.substring(6)),
      );
    } else {
      return DateTime(
        int.parse(dateStr.substring(0, 4)),
        int.parse(dateStr.substring(4, 6)),
        int.parse(dateStr.substring(6, 8)),
        int.parse(dateStr.substring(8, 10)),
        int.parse(dateStr.substring(10)),
      );
    }
  } else {
    return DateTime.now();
  }
}

DateTime rawDateTime(t) {
  if (isNotNull(t)) {
    if (t is DateTime) {
      return t;
    } else {
      if (t is num) {
        return doubleToDateTime(t);
      } else {
        try {
          return DateTime.parse(t);
        } catch (err) {
          return DateTime.fromMillisecondsSinceEpoch(t.millisecondsSinceEpoch);
        }
      }
    }
  }
  return null;
}

DateTime doubleToDate(num date) {
  String dateStr = date.toString();
  if (dateStr.length > 8)
    return DateTime(
      int.parse(dateStr.substring(0, 4)),
      int.parse(dateStr.substring(4, 6)),
      int.parse(dateStr.substring(6, 8)),
      int.parse(dateStr.substring(8, 10)),
      int.parse(dateStr.substring(10)),
    );
  else
    return DateTime(
      int.parse(dateStr.substring(0, 4)),
      int.parse(dateStr.substring(4, 6)),
      int.parse(dateStr.substring(6)),
    );
}

String fmtHora(num hora) {
  String horaStr = hora.toString();
  if (hora > 0)
    return horaStr.substring(0, horaStr.length - 2) + ":" + horaStr.substring(horaStr.length - 2);
  else
    return "00:00";
}

DateTime getDateTime(num time, {bool isInMillisecond = true, bool isInNum = false}) {
  if (time == null) {
    return null;
  }
  DateTime dateTime;

  if (isInNum) {
    dateTime = doubleToDate(time);
  } else if (isInMillisecond) {
    dateTime = DateTime.fromMillisecondsSinceEpoch(time);
  } else if (time != null) {
    dateTime = DateTime.fromMillisecondsSinceEpoch((time) * 1000);
  }
  return dateTime;
}

num dateToNum(DateTime value) {
  return (value.year.toInt() * 10000) + (value.month.toInt() * 100) + value.day.toInt();
}

num dateTimeToNum(DateTime value) {
  return (value.year.toInt() * 100000000) +
      (value.month.toInt() * 1000000) +
      (value.day.toInt() * 10000) +
      (value.hour.toInt() * 100) +
      value.minute;
}
