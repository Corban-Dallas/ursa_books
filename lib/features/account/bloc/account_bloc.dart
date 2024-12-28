import 'package:bloc/bloc.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(const AccountState()) {
    on<AccountEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
