import 'package:agenda_crud/app/view/contact_details.dart';
import 'package:agenda_crud/app/view/contact_form.dart';
import 'package:agenda_crud/app/view/contact_list.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // static -> para que eu tenha acesso a esse atributo quando chamar a classe
  // const -> o valor não vai mudar
  static const HOME = "/";
  static const CONTACT_FORM = "contact-form";
  static const CONTACT_DATAILS = "contact-details";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // routas: Funcao que retorna o widget responsavel
      //  "/" -> Nome da Rota (/ -> RAIZ)
      //  (context) => ContactList() -> funcao recebe um context e retorna um ContactList()
      routes: {
        HOME: (context) => ContactList(),
        CONTACT_FORM: (context) => ContactForm(),
        CONTACT_DATAILS: (context) => ContactDetails()
      },
    );
  }
}
