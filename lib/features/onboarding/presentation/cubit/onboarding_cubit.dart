import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/onboarding.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  var pageController = PageController();

  List<Onboarding> onboardingData = [
    Onboarding(
      image: 'assets/images/img1.jpg',
      title: 'REAL TIME',
      content: 'movie & TV information and updates movie trailer',
      gradiant: [
        Color(0xFF213538),
        Color(0xFF3A5C63),
        Color(0x316B9098),
        Color(0x006B9098),
      ],
    ),
    Onboarding(
      image: 'assets/images/img2.jpg',
      title: 'FIND MOVIE',
      content: 'watch and find that bring your mood back',
      gradiant: [
        Color(0xFF9C7145),
        Color(0xFF6E5B42),
        Color(0x3198866B),
        Color(0x0098866B),
      ],
    ),
    Onboarding(
      image: 'assets/images/img3.jpg',
      title: 'INVITE FRIENDS',
      content: 'create your personal movie night space with friends',
      gradiant: [
        Color(0xFF6EA6EF),
        Color(0xFF396AA8),
        Color(0x316B9098),
        Color(0x006B9098),
      ],
    ),
    Onboarding(
      image: 'assets/images/img4.jpg',
      title: 'NEWEST MOVIES',
      content: 'join us now and keep up with newest released movies',
      gradiant: [
        Color(0xFF221D36),
        Color(0xFF252948),
        Color(0x313653C4),
        Color(0x003653C4),
      ],
    ),
  ];

  int currentIndex = 0;
  void pageChanged(int index) {
    emit(OnboardingInitial());
    currentIndex = index;
    emit(PageChangedState());
  }
}
