part of "../menu_item_card.dart";

class PeiceIndicator extends StatefulWidget {
  final double height;
  final int initialValue;
  final int minValue;
  final int maxValue;
  final int stepValue;
  final Color color;
  const PeiceIndicator({
    Key? key,
    this.height = 50,
    this.initialValue = 0,
    this.minValue = 0,
    this.maxValue = 99,
    this.stepValue = 1,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  State<PeiceIndicator> createState() => _PeiceIndicatorState();
}

class _PeiceIndicatorState extends State<PeiceIndicator> {
  double get height => widget.height;
  double get width => (widget.height / 5);
  int get initialValue => widget.initialValue;
  int get minValue => widget.minValue;
  int get maxValue => widget.maxValue;
  int get stepValue => widget.stepValue;
  Color get color => widget.color;

  int pieceCounter = 0;

  void _increment() {
    setState(() {
      pieceCounter += stepValue;
    });
  }

  void _decrement() {
    setState(() {
      pieceCounter -= stepValue;
    });
  }

  Widget _buttonState() {
    return FloatingActionButton(
      onPressed: () => _increment(),
      child: const Icon(Icons.add),
    );
  }

  Widget _indicatorState() {
    return Column(
      children: [
        Expanded(flex: 1, child: _incrementButton()),
        const SizedBox(height: 5),
        Expanded(flex: 1, child: _pieceNumber()),
        const SizedBox(height: 5),
        Expanded(flex: 1, child: _decrementButton()),
      ],
    );
  }

  Widget _incrementButton() {
    return FloatingActionButton(
        onPressed: () => _increment(),
        child: const Icon(
          Icons.add,
          // color: color,
        ));
  }

  Widget _decrementButton() {
    return FloatingActionButton(
        onPressed: () => _decrement(),
        child: const Icon(
          Icons.remove,
        ));
  }

  Widget _pieceNumber() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(1, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Text(
              pieceCounter.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    pieceCounter = initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width,
      // height: height,
      child: (pieceCounter == 0) ? _buttonState() : _indicatorState(),
    );
  }
}
