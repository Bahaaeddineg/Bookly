part of 'theme_cubit.dart';

 class ThemeState extends Equatable {
    final bool isSwitched;
  const ThemeState({required this.isSwitched});
 

  @override
  List<Object> get props => [isSwitched];
}



