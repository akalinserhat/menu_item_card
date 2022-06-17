part of "../menu_item_card.dart";

class MenuCategoryItemCard extends StatelessWidget {
  final double width;
  final String? imageURL;
  final String title;
  final String subText;
  final Function(Key? key) onTap;

  const MenuCategoryItemCard({
    Key? key,
    this.width = 380,
    this.imageURL,
    required this.title,
    required this.subText,
    required this.onTap,
  }) : super(key: key);

  double get height => width / 3;
  double get titleFontSize => width / 19;

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
    return Stack(
      children: [
        Center(
          child: Text(
            title,
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: titleFontSize),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(subText, style: const TextStyle(color: Colors.blue))),
        )
      ],
    );
  }

  Widget _sufixIconArea() {
    return const Icon(Icons.chevron_right_rounded);
  }

  Widget _content() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 1, child: _imageArea()),
        Expanded(flex: 2, child: _descriptionArea()),
        Expanded(flex: 1, child: _sufixIconArea()),
      ],
    );
  }

  Widget _noImageContent() {
    return Row(
      children: [
        _descriptionArea(),
        _sufixIconArea(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(key),
      child: Card(
        child: SizedBox(
          width: width,
          height: height,
          child: (imageURL != null) ? _content() : _noImageContent(),
        ),
      ),
    );
  }
}
