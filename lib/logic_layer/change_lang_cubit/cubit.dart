
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextleveltask/logic_layer/change_lang_cubit/states.dart';



class ChangeLanguageCubit extends Cubit<ChangeLanguageStates> {
  ChangeLanguageCubit() : super(ChangeLanguageStateInitial());
  static ChangeLanguageCubit get(context) => BlocProvider.of(context);

  // switchLanguage(BuildContext context) {
  //   context.locale.languageCode == "en"
  //       ? context.setLocale(const Locale("ar"))
  //       : context.setLocale(const Locale("en"));
  //   String languageCode = context.locale.languageCode;
  //   saveLanguage(languageCode);
  //   emit(ChangeLanguageStateSuccess());
  // }


}