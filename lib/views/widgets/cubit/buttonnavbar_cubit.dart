import 'package:bloc/bloc.dart';
import 'package:foodly/views/screens/home_pages/home_v1_page.dart';
import 'package:foodly/views/screens/search_restaurant_page.dart';
import 'package:meta/meta.dart';

part 'buttonnavbar_state.dart';

class BottonNavBarCubit extends Cubit<BottonNavBarState> {
  int pageIndex = 0;
  BottonNavBarCubit() : super(BottonNavBarInitial());

  List pages = [
   const HomePageV1(),
   const SearchRestaurantPage(),
  const HomePageV1(),
  const  HomePageV1(),
  ];
  changePage(int tappedIndex) {
    pageIndex = tappedIndex;

    emit(BottonNavBarInitial());
  }
}
