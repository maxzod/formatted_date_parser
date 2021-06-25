String breakAfter(String input, [String breakPoint = ' ']) {
  final buffer = StringBuffer();
  for (var i = 0; i < input.length; i++) {
    if (input[i] != breakPoint) {
      buffer.write(input[i]);
    } else {
      break;
    }
  }
  return buffer.toString();
}

String toMonthIndex(int index) {
  if (index < 10) {
    return '0$index';
  } else {
    return index.toString();
  }
}

Map<String, dynamic> splitStringToDate(String str) {
  final listSplited = splitStringToList(str);

  return {
    'year': listSplited[2],
    'month': _extractMonth(listSplited[1]),
    'day': listSplited[0],
    'hour': _extractHour(listSplited.last),
    'minuite': _extractMinute(listSplited.last),
    // 'period': 'AM',
  };
}

DateTime parse(String str) {
  final listSplited = splitStringToList(str);
  return DateTime(
    int.parse(listSplited[2]),
    int.parse(_extractMonth(listSplited[1])),
    int.parse(listSplited[0]),
    int.parse(_extractHour(listSplited.last)),
    int.parse(_extractMinute(listSplited.last)),
  );
}

List<String> splitStringToList(String inputDate) {
  return inputDate.split(' ');
}

String _extractMonth(String month) {
  return toMonthIndex(monthsList.indexOf(month) + 1);
}

String _extractHour(String inputDate) {
  final index = inputDate.indexOf(':');
  final hours = inputDate.replaceRange(index, inputDate.length, '');
  final _hoursAsInt = int.parse(hours);
  if (inputDate.toLowerCase().contains('am')) {
    if (_hoursAsInt + 12 == 24) return '00';
    return toMonthIndex(_hoursAsInt + 12);
  } else {
    return toMonthIndex(_hoursAsInt);
  }
}

String _extractMinute(String inputDate) {
  final lower = inputDate.toLowerCase();
  final withoutHoures = lower.replaceRange(0, 3, '');
  final mins = '${withoutHoures[0]}${withoutHoures[1]}';
  return mins;
}

const monthsList = [
  'Jan.',
  'Feb.',
  'Mar.',
  'Apr.',
  'May',
  'Jun.',
  'Jul.',
  'Aug.',
  'Sep.',
  'Oct.',
  'Nov.',
  'Dec.',
];
