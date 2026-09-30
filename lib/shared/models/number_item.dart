class NumberItem {
  final int value;
  final String emoji;
  final String trName;
  final String enName;

  const NumberItem({
    required this.value,
    required this.emoji,
    required this.trName,
    required this.enName,
  });
}

final List<NumberItem> numbersList = [
  NumberItem(value: 1, emoji: '🍎', trName: 'Bir', enName: 'One'),
  NumberItem(value: 2, emoji: '🍓', trName: 'İki', enName: 'Two'),
  NumberItem(value: 3, emoji: '🌻', trName: 'Üç', enName: 'Three'),
  NumberItem(value: 4, emoji: '🦋', trName: 'Dört', enName: 'Four'),
  NumberItem(value: 5, emoji: '🍄', trName: 'Beş', enName: 'Five'),
  NumberItem(value: 6, emoji: '🐝', trName: 'Altı', enName: 'Six'),
  NumberItem(value: 7, emoji: '🐞', trName: 'Yedi', enName: 'Seven'),
  NumberItem(value: 8, emoji: '🌰', trName: 'Sekiz', enName: 'Eight'),
  NumberItem(value: 9, emoji: '🍇', trName: 'Dokuz', enName: 'Nine'),
  NumberItem(value: 10, emoji: '🌼', trName: 'On', enName: 'Ten'),
];