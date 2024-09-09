import 'package:flutter/material.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.blueAccent
            //color: Color(0xFF1D6CAB),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton( color: Colors.red, onPressed: () {  }, icon: const Icon(Icons.circle,)),
                  const Text("Bakery",style: TextStyle(fontSize: 18,),),
                ],
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                ),
                alignment: Alignment.centerRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
