import 'package:flutter/material.dart';
import 'package:menu_item_card/menu_item_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MenuItemCard(
              imageURL:
                  "https://media.istockphoto.com/photos/turkish-food-iskender-dner-kebab-with-yoghurt-on-a-plate-picture-id1048799978?s=612x612",
              title: "Yaprak Döner",
              description: "%100 dana eti - tereyağı - kandıra yoğurdu",
              price: 59.99,
              currencySymbol: "₺",
              onChangePiece: (value) {},
            ),
            MenuCategoryItemCard(
              imageURL:
                  "https://media.istockphoto.com/photos/lentil-soup-picture-id856009070?s=612x612",
              title: "Çorbalar",
              subText: "5 Farklı çeşit",
              onTap: (key) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Menu Category Item Taped")));
              },
            ),
          ],
        ),
      ),
    );
  }
}
