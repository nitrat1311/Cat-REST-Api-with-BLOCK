import 'package:cat_api/services/connectivity_service.dart';
import 'package:equatable/equatable.dart';
import 'package:cat_api/models/cat_model.dart';
import 'package:cat_api/rest_api/cat_api.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  CatsBloc(this._connectivityService, this._catApi)
      : super(CatsLoadingState()) {
    on<CheckInternet>(_startConnectivityStream);

    on<NoInternetEvent>((event, emit) => emit(NoInternetState()));

    on<HaveInternet>(_loadCats);
  }

  final CatApi _catApi;
  final ConnectivityService _connectivityService;

  void _loadCats(HaveInternet event, Emitter<CatsState> emit) async {
    emit(CatsLoadingState());

    try {
      final List<Cat> _images = await _catApi.loadImages;
      emit(CatsLoadedState(catsImages: _images));
    } catch (_) {
      emit(CatErrorState());
    }
  }

  void _startConnectivityStream(CheckInternet event, Emitter<CatsState> emit) {
    _connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        add(NoInternetEvent());
      } else {
        add(HaveInternet());
      }
    });
  }
}
