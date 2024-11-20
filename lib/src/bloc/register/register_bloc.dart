import 'package:bloc/bloc.dart';
import '../../services/user_service.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserService userService;

  RegisterBloc({required this.userService}) : super(RegisterInitial());

  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoading();

      try {
        final user = await userService.registerUser(
          event.name,
          event.email,
          event.password,
        );
        yield RegisterSuccess(user: user);
      } catch (error) {
        yield RegisterFailure(error: error.toString());
      }
    }
  }
}
