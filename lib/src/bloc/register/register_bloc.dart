import 'package:bloc/bloc.dart';
import '../../services/user_service.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserService userService;

  RegisterBloc({required this.userService}) : super(RegisterInitial()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
  }

  Future<void> _onRegisterButtonPressed(
      RegisterButtonPressed event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());

    try {
      final user = await userService.registerUser(
        event.name,
        event.email,
        event.password,
      );
      emit(RegisterSuccess(user: user));
    } catch (error) {
      emit(RegisterFailure(error: error.toString()));
    }
  }
}
