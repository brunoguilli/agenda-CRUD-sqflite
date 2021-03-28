import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../my_app.dart';

part 'contact_list_back.g.dart';

//  Mobx -> digitar no terminal o comando: flutter packages pub run build_runner watch

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store {
  var _service = GetIt.I.get<ContactService>();

  @observable
  Future<List<Contact>> list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ContactListBack() {
    refreshList();
  }

  //  [Contact contact] -> Indica que esse parâmetro é opcional
  goToForm(BuildContext context, [Contact contact]) {
    Navigator.of(context)
        .pushNamed(MyApp.CONTACT_FORM, arguments: contact)
        .then(refreshList);
  }

  goToDetails(BuildContext context, Contact contact) {
    Navigator.of(context).pushNamed(MyApp.CONTACT_DATAILS, arguments: contact);
  }

  remove(int id) {
    print("remove id: $id");
    _service.remove(id);
    refreshList();
  }
}
