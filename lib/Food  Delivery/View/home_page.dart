import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../consts.dart';
import '../Model/category_model.dart';
import '../Model/product_model.dart';
import '../Provider/card_provider.dart';
import '../Widgets/food_product_items.dart';
import 'cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String category = "";
  List<MyProductModel> productModel = [];

  @override
  void initState() {
    super.initState();
    if (myCategories.isNotEmpty) {
      category = myCategories[0].name;
      filterProductByCategory(category);
    }
  }

  void filterProductByCategory(String selectedCategory) {
    setState(() {
      category = selectedCategory;
      productModel = myProductModel
          .where(
            (element) =>
                element.category.toLowerCase() ==
                selectedCategory.toLowerCase(),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Your Location",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: kblack,
                                size: 20,
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: korange,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Nabin, Nepal",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kblack,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.search, color: kblack),
                        ),
                        const SizedBox(width: 10),
                        // ✅ Updated: Entire cart icon is tappable
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Cart(),
                              ),
                            );
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.shopping_cart_outlined, color: kblack),
                              ),
                              if (cartProvider.carts.isNotEmpty)
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      color: Color(0xfff95f60),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      cartProvider.carts.length.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Let's find the best food around you",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -.4,
                    color: kblack,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Find by Category",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: kblack,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(color: Colors.orange),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    ...List.generate(
                      myCategories.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            filterProductByCategory(myCategories[index].name);
                          },
                          child: Container(
                            height: 120,
                            width: 85,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: category == myCategories[index].name
                                  ? Border.all(width: 2.5, color: korange)
                                  : Border.all(color: Colors.white),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 47,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.4),
                                            offset: const Offset(0, 10),
                                            blurRadius: 12,
                                            spreadRadius: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Image.asset(
                                      myCategories[index].image,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  myCategories[index].name,
                                  style: const TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Result (${productModel.length})",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                    fontWeight: FontWeight.bold,
                    letterSpacing: -.2,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 25),
                  itemCount: productModel.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      right: index == productModel.length - 1 ? 25 : 15,
                    ),
                    child: FoodProductItems(
                      productModel: productModel[index],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}



