import 'package:rxdart/rxdart.dart';

void main(List<String> arguments) {
  var n = (arguments.length == 1) ? int.parse(arguments.first) : 10;

  const seed = IndexedPair(1, 1, 0);

  Rx.range(1, n)
      .scan((IndexedPair seq, value, index) => IndexedPair.next(seq), seed)
      .listen(print, onDone: () => print('done!'));
}

class IndexedPair {
  final int n1, n2, index;

  const IndexedPair(this.n1, this.n2, this.index);

  factory IndexedPair.next(IndexedPair prev) => IndexedPair(
        prev.n2,
        prev.index <= 1 ? prev.n1 : prev.n1 + prev.n2,
        prev.index + 1,
      );

  @override
  String toString() => '$index:$n2';
}
