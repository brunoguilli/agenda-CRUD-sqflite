import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/my_app.dart';
import 'package:agenda_crud/app/view/contact_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContactList extends StatelessWidget {
  final _back = ContactListBack();

  CircleAvatar circleAvatar(String url) {
    try {
      return CircleAvatar(backgroundImage: NetworkImage(url));
    } catch (e) {
      return CircleAvatar(child: Icon(Icons.person));
    }
  }

  Widget iconEditButton(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
  }

  // context -> para saber a localização com relação a quem chamou
  Widget iconRemoveButton(BuildContext context, Function remove) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Excluir"),
                    content: Text("Confirma a exclusão?"),
                    actions: [
                      TextButton(
                          child: Text("Não"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      TextButton(
                        child: Text("Sim"),
                        onPressed: remove,
                      ),
                    ],
                  ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Contatos"),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
                })
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Contact> lista = futuro.data;
                  return ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, i) {
                        var contato = lista[i];
                        return ListTile(
                          leading: circleAvatar(contato.urlAvatar),
                          title: Text(contato.nome),
                          subtitle: Text(contato.telefone),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                iconEditButton(() {
                                  _back.goToForm(context, contato);
                                }),
                                iconRemoveButton(context, () {
                                  _back.remove(contato.id);
                                  Navigator.of(context).pop();
                                })
                              ],
                            ),
                          ),
                        );
                      });
                }
              });
        }));
  }
}