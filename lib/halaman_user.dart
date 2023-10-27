import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul_7http/api_data_source.dart';
import 'package:modul_7http/halamandetail.dart';
import 'package:modul_7http/users_model.dart';

class HalamanUsers extends StatelessWidget {
  const HalamanUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'List User',
          style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) { //error handling
            return Text('ADA ERROR');
          }
          if (snapshot.hasData) {
            UsersModel users = UsersModel.fromJson(snapshot.data!);
            return ListView.builder(
              itemCount: users.data!.length,
              itemBuilder: (context, index) {
                var user = users.data![index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HalamanDetail(user: user),
                      ),
                    );
                  },
                  leading: GestureDetector( // Fungsi supaya avatar bisa di klik dan membesar
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Container(
                              width: 300,
                              height: 300,
                              child: Image.network(
                                user.avatar!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar!),
                      radius: 40,
                    ),
                  ),
                  title: Text(
                    '${user.firstName} ${user.lastName}',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    '${user.email}',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.teal),
            ),
          );
        },
      ),
    );
  }
}
