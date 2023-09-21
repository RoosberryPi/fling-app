import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flingapp/repositories/database/database_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'images_event.dart';
part 'images_state.dart';

// Manages the logic for images and deciding what to do when events occur. It knows the current states.
// The Bloc processes the events and updates the states, and the UI is notified of the change.
class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final DatabaseRepository _databaseRepository;
  StreamSubscription? _databaseSubscription;

// data base repository is a required input of the bloc
  ImagesBloc({required DatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(ImagesLoading());

  // async gives you a Future
  // async* gives you a Stream
  @override
  Stream<ImagesState> mapEventToState(ImagesEvent event) async* {
    if (event is LoadImages) {
      yield* _mapLoadImagesToState();
    }

    if (event is UpdateImages) {
      yield* _mapUpdateImagesToState(event);
    }
  }

  Stream<ImagesState> _mapLoadImagesToState() async* {
    _databaseSubscription?.cancel();
    _databaseRepository
        .getUser()
        .listen((user) => add(UpdateImages(user.imageUrls)));
  }

  Stream<ImagesState> _mapUpdateImagesToState(UpdateImages event) async* {
    yield ImagesLoaded(imageUrls: event.imageUrls);
  }
}
