import 'package:agenda_crud/app/domain/entities/contact.dart';

abstract class ContactDAO {
  // Não posso instanciar
  // Metodos sem implementação
  save(Contact contact);

  remove(int id);

  Future<List<Contact>> find();
}
