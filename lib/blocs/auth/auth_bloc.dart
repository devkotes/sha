import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sha/models/form/form_sign_in_model.dart';
import 'package:sha/models/form/form_sign_up_model.dart';
import 'package:sha/models/form/form_user_edit_model.dart';
import 'package:sha/models/user_model.dart';
import 'package:sha/services/auth_service.dart';
import 'package:sha/services/user_service.dart';
import 'package:sha/services/wallet_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());
          final res = await AuthService().checkEmail(email: event.email);
          if (res == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email Sudah terpakai'));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthRegister) {
        try {
          emit(AuthLoading());
          final user = await AuthService().register(data: event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogin) {
        try {
          emit(AuthLoading());
          final user = await AuthService().login(data: event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());
          final FormSignInModel data =
              await AuthService().getCredentialFromLocal();

          final UserModel user = await AuthService().login(data: data);

          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthUpdateUser) {
        try {
          if (state is AuthSuccess) {
            final updateUser = (state as AuthSuccess).user.copyWith(
                  name: event.data.name,
                  email: event.data.email,
                  username: event.data.username,
                  password: event.data.password,
                );

            emit(AuthLoading());

            await UserService().updateUser(data: event.data);

            emit(AuthSuccess(updateUser));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthUpdatePin) {
        try {
          if (state is AuthSuccess) {
            final updateUser =
                (state as AuthSuccess).user.copyWith(pin: event.newPin);

            emit(AuthLoading());

            await WalletService()
                .updatePin(oldPin: event.oldPin, newPin: event.newPin);

            emit(AuthSuccess(updateUser));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogout) {
        try {
          emit(AuthLoading());

          await AuthService().logout();

          emit(AuthInitial());
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthUpdateBalance) {
        if (state is AuthSuccess) {
          final currentUser = (state as AuthSuccess).user;
          final updateUser = currentUser.copyWith(
              balance: currentUser.balance! + event.amount);

          emit(AuthSuccess(updateUser));
        }
      }
    });
  }
}
