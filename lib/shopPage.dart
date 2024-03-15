// ShopPage
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  List<String> shopList = ['상품a', '상품b', '상품c'];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
            ),
            itemCount: shopList.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
              ),
              width: 100,
              height: 100,
              child: Center(
                  child: Text(shopList[index])
              ),
            ),
          )
      ),
    );
  }
}
