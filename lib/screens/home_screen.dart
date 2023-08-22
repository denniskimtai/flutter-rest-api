import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:restapi/Models/product_model.dart';
import 'package:restapi/widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final dio = Dio();
  List<Product> productsList = [];

  //fetch from api
  Future<void> fetchProducts() async{

    try{

      final response = await dio.get("https://fakestoreapi.com/products");      

      if(response.statusCode == 200){
        final List<dynamic> responseJson = response.data;
        setState(() {
          productsList = responseJson.map((item) => Product.fromJson(item)).toList();
        });
      }else{
        //TODO show error code
      }

    }catch(error){
      //TODO handle error
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Category 1',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                return ProductItem(product: productsList[index]);
              },
            ),
          ),
        
        
        ],
      );
  }
}