import 'package:agenda_crud/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;
// Quando formos usar as especificações do DAO é para injetar o ContactDAOImpl
// Obs: Quando trocar de tecnologia do banco de dados, basta trocar o ContactDAOImpl por outro método
// registerSingleton -> Cria um unico ojeto para atender todo mundo
  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());
  getIt.registerSingleton<ContactService>(ContactService());
}
