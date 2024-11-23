import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/presentation/pages/product_details/product_details.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/page_route_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: InkWell(
            onTap: (){
              navKey.currentState!.push(MaterialPageRoute(builder: (context) => ProductDetails (productId: "673e1cd711599201718280fb")));
            },
            child: Text(
            "ali",
                    style: TextStyle(fontSize: 20),
                  ),
          )),
    );
  }
}
