import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment_2/utils.dart';
import 'Widget/box_image_snackbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
        centerTitle: true,
          title: const Text("Photo Gallery"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:Column(
              children: [
                const SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  child: const Text("Welcome to My Photo Gallery!",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: searchEditingController,
                  decoration:  const InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search,color: Colors.grey,size: 25),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderSide:BorderSide(
                      color: Colors.green,
                    ) ),
                  ),
                ),
                const SizedBox(height: 20,),
                 const Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    ImageBoxSnackBar(imageUrl: imageUrl1,),
                    ImageBoxSnackBar(imageUrl: imageUrl2,),
                    ImageBoxSnackBar(imageUrl: imageUrl3,),
                    ImageBoxSnackBar(imageUrl: imageUrl4,),
                    ImageBoxSnackBar(imageUrl: imageUrl5,),
                    ImageBoxSnackBar(imageUrl: imageUrl6,),

                  ],
                ),
                const SizedBox(height: 20,),
                ListView(
                  shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    ListTile(
                      leading: Icon(Icons.photo),
                      title: Text("Sample Photo 1"),
                      subtitle: Text("Category 1"),
                    ),
                    ListTile(
                      leading: Icon(Icons.photo),
                      title: Text("Sample Photo 2"),
                      subtitle: Text("Category 2"),
                    ),
                    ListTile(
                      leading: Icon(Icons.photo),
                      title: Text("Sample Photo 3"),
                      subtitle: Text("Category 3"),
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('Photos Uploaded Successfully!'),
              ),
            );
          },
          child: const Icon(Icons.upload),
        ),
      ),
    );
  }
}


