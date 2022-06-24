import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationStates> {
  LocalizationCubit(LocalizationStates initialState) : super(initialState);

  LocalizationStates get initialState => LocalizationStates.initial();

  void changeLanguage(String lang, String country) {
    emit(state.copyWith(locale: Locale(lang, country)));
  }
}