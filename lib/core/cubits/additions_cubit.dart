import 'package:flutter_bloc/flutter_bloc.dart';

class AdditionsCubit extends Cubit<Map<String, List<String>>> {
  AdditionsCubit() : super({});

  void addAddition(String productName, String addition) {
    final newState = Map<String, List<String>>.from(state);
    if (!newState.containsKey(productName)) {
      newState[productName] = [];
    }
    
    if (!newState[productName]!.contains(addition)) {
      newState[productName]!.add(addition);
      emit(newState);
    }
  }

  void clearAdditions(String productName) {
    final newState = Map<String, List<String>>.from(state);
    newState.remove(productName);
    emit(newState);
  }

  List<String> getAdditions(String productName) {
    return state[productName] ?? [];
  }
}
