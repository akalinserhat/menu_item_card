part of "../menu_item_card.dart";

class MenuItemCard extends StatefulWidget {
  final double width;
  final String? imageURL;
  final String title;
  final String description;
  final double price;
  final String currencySymbol;
  final Function(int value) onChangePiece;
  const MenuItemCard(
      {Key? key,
      this.width = 380,
      this.imageURL,
      required this.title,
      required this.description,
      required this.price,
      required this.currencySymbol,
      required this.onChangePiece})
      : super(key: key);

  @override
  State<MenuItemCard> createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  double get width => widget.width;
  double get height => widget.width / 3;
  String? get imageURL => widget.imageURL;
  String get title => widget.title;
  String get description => widget.description;
  double get price => widget.price;
  String get currencySymbol => widget.currencySymbol;
  double get titleFontSize => widget.width / 19;
  double get descriptionFontSize => widget.width / 25;
  double get priceFontSize => widget.width / 17;
  Function(int value) get onChangePiece => widget.onChangePiece;

  Widget _imageArea() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
      child: Image.network(
        imageURL!,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _descriptionArea() {
    var f = NumberFormat.currency(locale: "tr_TR", symbol: "₺");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 1,
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: titleFontSize),
              )),
          Expanded(
              flex: 2,
              child: Center(
                child: Text(description,
                    style: TextStyle(fontSize: descriptionFontSize)),
              )),
          Expanded(
              flex: 1,
              child: Center(
                  child: Text(
                f.format(price),
                style: TextStyle(
                    fontSize: priceFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ))),
        ],
      ),
    );
  }

  Widget _peiceIndicatorArea() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: PeiceIndicator(height: 10),
    );
  }

  Widget _content() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 1, child: _imageArea()),
        Expanded(flex: 2, child: _descriptionArea()),
        Expanded(flex: 1, child: _peiceIndicatorArea()),
      ],
    );
  }

  Widget _noImageContent() {
    return Row(
      children: [
        Expanded(flex: 3, child: _descriptionArea()),
        Expanded(flex: 1, child: _peiceIndicatorArea()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: width,
        height: height,
        child: (imageURL != null) ? _content() : _noImageContent(),
      ),
    );
  }
}
