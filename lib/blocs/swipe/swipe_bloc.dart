// import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/models.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  //final AuthBloc _authBloc;
  // final DatabaseRepository _databaseRepository;
  // StreamSubscription? _authSubscription;

  SwipeBloc() : super(SwipeLoading());
  //  {
  //   on<LoadUsers>(_onLoadUsers); // event type and (callbacks)
  //   on<UpdateHome>(_onUpdateHome);
  //   on<SwipeLeft>(_onSwipeLeft);
  //   on<SwipeRight>(_onSwipeRight);
  // } // swipeloading is the initial state

  @override
  Stream<SwipeState> mapEventToState(
    SwipeEvent event,
  ) async* {
    if (event is LoadUsers) {
      yield* _onLoadUsers(
          event); // yield is like return, but doesn't terminate the function
    }
    if (event is SwipeLeft) {
      yield* _onSwipeLeft(event, state);
    }

    if (event is SwipeRight) {
      yield* _onSwipeRight(event, state);
    }
  }

  // callbacks
  Stream<SwipeState> _onLoadUsers(LoadUsers event) async* {
    yield SwipeLoaded(users: event.users);
    // _databaseRepository.getUsers(event.userId, 'Male').listen((users) {
    //   print('$users');
    //   add(
    //     UpdateHome(users: users),
    //   );
    // });
  }

  // void _onUpdateHome(
  //   UpdateHome event,
  //   //Emitter<SwipeState> emit,
  // ) {
  //   if (event.users != null) {
  //     //emit(SwipeLoaded(users: event.users!));
  //   } else {
  //     //emit(SwipeError());
  //   }
  // }

  Stream<SwipeState> _onSwipeLeft(SwipeLeft event, SwipeState state
      //Emitter<SwipeState> emit,
      ) async* {
    if (state is SwipeLoaded) {
      try {
        yield SwipeLoaded(
            users: List.from(state.users)
              ..remove(event.user)); // remove user that is swiped left
      } catch (_) {}

      //final state = this.state as SwipeLoaded;

      //List<User> users = List.from(state.users)..remove(event.user);

      //if (users.isNotEmpty) {
      //emit(SwipeLoaded(users: users));
      // } else {
      //emit(SwipeError());
      //  }
    }
  }

  Stream<SwipeState> _onSwipeRight(SwipeRight event, SwipeState state
      // Emitter<SwipeState> emit,
      ) async* {
    if (state is SwipeLoaded) {
      try {
        yield SwipeLoaded(
            users: List.from(state.users)
              ..remove(event.user)); // remove user that is swiped right
      } catch (_) {}
      // final state = this.state as SwipeLoaded;
      // List<User> users = List.from(state.users)..remove(event.user);

      // if (users.isNotEmpty) {
      //   //emit(SwipeLoaded(users: users));
      // } else {
      //   //emit(SwipeError());
      // }
    }
  }
}
