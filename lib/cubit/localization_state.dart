part of 'localization_cubit.dart';

class LocalizationStates extends Equatable{
  final Locale locale;

  LocalizationStates({required this.locale});

  factory LocalizationStates.initial()=>LocalizationStates(locale: Locale('sv', 'SE'));

  LocalizationStates copyWith({required Locale locale}) => LocalizationStates(locale:this.locale);
  @override
  List<Object?> get props => [locale];

}

