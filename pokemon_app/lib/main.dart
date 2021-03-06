import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokemon_app/pokedex_json.dart';
import 'package:pokemon_app/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/pokemondetail.dart';

void main() => runApp(MaterialApp(
      title: "Poke App",
      home:HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  // var url = Uri.https('raw.githubusercontent.com', '/Biuni/PokemonGO-Pokedex/master/pokedex.json', {'q': '{https}'});
  var url =  Uri.parse('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
  PokeHub pokeHub;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {//web 跨域问题
    // var res = await http.get(url);
    // var decodedJson = jsonDecode(res.body);
    // pokeHub = PokeHub.fromJson(decodedJson);
    // print(pokeHub.toJson());
    // setState(() {});
    pokeHub = PokeHub.fromJson(pokedex_json);
    print(pokeHub.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poke App"),
        backgroundColor: Colors.cyan,
      ),
      body: pokeHub == null
          ? Center(child: CircularProgressIndicator(),)
          : GridView.count(
              crossAxisCount: 2,
              children: pokeHub.pokemon.map((poke) => Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                  onTap:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> PokeDetail(
                            pokemon: poke,
                      ))
                    );
                  },
                  child: Hero(
                    tag: poke.img,
                    child: Card(
                      child:Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width  * 0.2,
                            decoration: BoxDecoration(
                              image:DecorationImage(
                                fit:BoxFit.cover,
                                image: NetworkImage(poke.img)
                              )
                            ),
                          ),
                          Text(poke.name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),)
                        ],
                      )
                    ),
                  ),
                )
              )).toList()
            ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
