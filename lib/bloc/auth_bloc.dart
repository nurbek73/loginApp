import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:stack_project/bloc/Login_bloc.dart';
import 'package:stack_project/repositries/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<PhoneNumEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final tokenModel =
            await repository.getCode(phoneNumber: event.phoneNumber);
        emit(AuthSuccess(tokenModel: tokenModel));
      } catch (e) {
        if (e is DioException) {
          emit(
            AuthError(
              errorText: e.response!.data['message'].toString(),
            ),
          );
        } else {
          emit(
            AuthError(
              errorText: e.toString(),
            ),
          );
        }
      }
    });

    on<CodeEvent>((event, emit) async {
      emit(AuthLoadingCode());

      try {
        final errorModel = await repository.sendCode(code: event.code);

        emit(AuthSuccessCode(errorModel: errorModel));
      } catch (e) {
        if (e is DioException) {
          if (e.response?.data['error'] != null) {
            emit(AuthErrorCode(
              errorText: e.response!.data['error'].toString(),
            ));
          } else {
            emit(
              AuthErrorCode(
                errorText: e.response!.data['message'].toString(),
              ),
            );
          }
        } else {
          emit(
            AuthErrorCode(
              errorText: e.toString(),
            ),
          );
        }
      }
    });
  }
}
