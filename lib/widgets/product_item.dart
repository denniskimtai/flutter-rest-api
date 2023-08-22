import 'package:flutter/material.dart';
import 'package:restapi/Models/product_model.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.topRight,
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5, right: 10),
              child: Icon(Icons.favorite,
              color: Color.fromARGB(255, 189, 189, 189),),),
          ),
          Expanded(
            child: Image.network(
              product.image,
              fit: BoxFit.contain,
              height: 100,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                product.title,
                maxLines: 1,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Center(
              child: Text(
                'Ksh ${product.price}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue.shade400),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Center(
              child: Text(
                'BUY NOW',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
