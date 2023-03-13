import '../models/account.dart';

class BankController {
  final Map<String, Account> _database = {};

  List<String> Obter_mapas(){
    List<String> values = [];
    _database.forEach((String key, Account account){
      values.add("Key: $key" + " " + "Values: ${account.ToString()}");
        }
    );
    return values;
  }
  addAccount({required String id, required Account account}) {
    _database[id] = account;
  }

  bool makeTransfer(
      {required String idSender,
      required String idReceiver,
      required double amount}) {
    // Verificar se ID de remetente é válido
    if (!verifyId(idSender)) {
      return false;
    }

    // Verificar se ID de destinatário é válido
    if (!verifyId(idReceiver)) {
      return false;
    }

    Account accountSender = _database[idSender]!;
    Account accountReceiver = _database[idReceiver]!;

    // Verificar se o remetente está autenticado
    if (!accountSender.isAuthenticated) {
      return false;
    }

    // Verificar se o remetente possui saldo suficiente
    if (accountSender.balance < amount) {
      return false;
    }

    // Se tudo estiver certo, efetivar transação
    accountSender.balance -= amount;
    accountReceiver.balance += amount;

    return true;
  }

  bool verifyId(String id) {
    return _database.containsKey(id);
  }
}
