import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sha/models/tips_model.dart';
import 'package:sha/services/tips_service.dart';

part 'tips_event.dart';
part 'tips_state.dart';

class TipsBloc extends Bloc<TipsEvent, TipsState> {
  TipsBloc() : super(TipsInitial()) {
    on<TipsEvent>((event, emit) async {
      if (event is TipsGet) {
        try {
          emit(TipsLoading());

          final tips = await TipsService().getTips();

          emit(TipsSuccess(tips));
        } catch (e) {
          emit(TipsFailed(e.toString()));
        }
      }
    });
  }
}
