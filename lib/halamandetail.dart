import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul_7http/users_model.dart';

class HalamanDetail extends StatelessWidget {
  final user;

  HalamanDetail({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Detail User',
          style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Fungsi supaya avatar bisa di klik dan membesar
            Text(
                'This is user ${user.id}',
                style: GoogleFonts.mooli(
                  textStyle: TextStyle(fontSize: 18),
                )
            ),
            SizedBox(height: 20),
            GestureDetector(
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
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              },
              child:
              CircleAvatar(
                backgroundImage: NetworkImage(user.avatar!),
                radius: 50,
              ),
            ),
            SizedBox(height: 20),
            Text(

              '${user.firstName} ${user.lastName}',

              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
            ),
            SizedBox(height: 10),
            Text(
              '${user.email}',
              style: GoogleFonts.lato(
              textStyle:
              TextStyle(fontSize: 18),
              )
            ),
          ],
        ),
      ),
    );
  }
}
