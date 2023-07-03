import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment/product_model.dart';
import 'package:flutter_ui_assignment/widgets/custom_text_field.dart';



class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  List<Products> productList = [];
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController deadLineEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Task Manager"),
      ),
      body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onLongPress: () => _showTaskDetailsBottomSheet(productList[index]),
              title: Text(
                productList[index].title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                productList[index].description,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                title: const Center(
                  child: Text(
                    "Add New Task",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                ),
                content: SingleChildScrollView(
                  child: SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomTextField(
                            hinText: "Enter the title",
                            controller: titleEditingController,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomTextField(
                            hinText: "Enter the description",
                            controller: descriptionEditingController,
                            maxLine: 5,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomTextField(
                            hinText: "Days Required",
                            controller: deadLineEditingController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          productList.add(
                            Products(
                              title: titleEditingController.text,
                              description: descriptionEditingController.text,
                              deadline: deadLineEditingController.text,
                            ),
                          );
                          if (mounted) {
                            setState(() {});
                          }
                          Navigator.pop(context);
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  )
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showTaskDetailsBottomSheet(Products product) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Task Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Title: ${product.title}",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height:16),
              Text(
                "Description: ${product.description}",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height:16),
              Text(
                "Days Required: ${product.deadline}",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  productList.remove(product);
                  if (mounted) {
                    setState(() {});
                  }
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}



