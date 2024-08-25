import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sha/models/form/form_transfer_model.dart';
import 'package:sha/services/transaction_service.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferInitial()) {
    on<TransferEvent>((event, emit) async {
      if (event is TransferPost) {
        try {
          emit(TransferLoading());

          await TransactionService().transfer(data: event.data);

          emit(TransferSuccess());
        } catch (e) {
          emit(TransferFailed(e.toString()));
        }
      }
    });
  }
}
