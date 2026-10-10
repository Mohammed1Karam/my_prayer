/// ذكر واحد مع عدد مرات تكراره.
class Zikr {
  const Zikr({
    required this.text,
    this.repeat = 1,
    this.reference = '',
  });

  final String text;
  final int repeat;
  final String reference;
}
