import 'package:bloc/bloc.dart';
import 'package:chat39/controller/data/local/sheard.dart';
import 'package:chat39/utilities/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'style_state.dart';

class StyleCubit extends Cubit<StyleState> {
  StyleCubit() : super(StyleInitial());
  static  StyleCubit get(context)=>BlocProvider.of(context);
  bool isDarkTheme = false;

  void changeAppTheme(){
    isDarkTheme = !isDarkTheme;
    MyCache.putBoolean(key: MySharedKeys.theme,
        value: isDarkTheme);
    emit(ChangeColorTheme());
  }

  void getAppTheme(){
    isDarkTheme =MyCache.getBoolean(key:MySharedKeys.theme);
  }


}
