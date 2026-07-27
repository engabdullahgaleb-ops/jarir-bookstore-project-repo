import 'package:bloc/bloc.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit():super(AppInitialState());
}
sealed class AppState{
}
class AppInitialState extends AppState{

}