import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailScreen extends StatelessWidget {
  final int data;

  DetailScreen({required this.data});
  Future<Map> _getProductDetail() async {
    var url = Uri.parse("http://172.20.10.3:5050/get_productsID/${this.data}");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Failed to load product details");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('DETAILS',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,

        ),),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Map>(
              future: _getProductDetail(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                      strokeWidth: 5,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/loading_spinner.gif',
                            image: snapshot.data!['image'],
                            width: 300,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  snapshot.data!['title'] ?? "No Title",
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  snapshot.data!['description'] ?? "No Description",
                                  style: const TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [
                              const Text(
                                "Total: ",
                                style: TextStyle(fontSize: 25),
                              ),
                              Text(
                                "\$${snapshot.data!['price'] ?? "0.00"}",
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  print("checkout");
                                },
                                child: const Text(
                                  "CheckOut",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Text("No widget to build");
              },
            ),
          ),
        ],
      ),
    );
  }
}
