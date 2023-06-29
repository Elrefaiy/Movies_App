import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_application/core/utils/app_strings.dart';
import '../../domain/entities/onboarding.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  var pageController = PageController();

  List<Onboarding> onboardingData = [
    Onboarding(
      image: '${AppStrings.assetImage}img1.jpg',
      title: 'REAL TIME',
      content: 'movie & TV information and updates movie trailer',
      gradiant: [
        Color(0xFF000000),
        Color(0xFF143050),
        Color(0x30143050),
        Color(0x1D000000),
      ],
    ),
    Onboarding(
      image: '${AppStrings.assetImage}img2.jpg',
      title: 'FIND MOVIE',
      content: 'watch and find that bring your mood back',
      gradiant: [
        Color(0xFF000000),
        Color(0xFF612020),
        Color(0x30612020),
        Color(0x1D000000),
      ],
    ),
    Onboarding(
      image: '${AppStrings.assetImage}img3.jpg',
      title: 'INVITE FRIENDS',
      content: 'create your personal movie night space with friends',
      gradiant: [
        Color(0xFF000000),
        Color(0xFF18243D),
        Color(0x3018243D),
        Color(0x1D000000),
      ],
    ),
    Onboarding(
      image: '${AppStrings.assetImage}img4.jpg',
      title: 'NEWEST MOVIES',
      content: 'join us now and keep up with newest released movies',
      gradiant: [
        Color(0xFF000000),
        Color(0xFF271D41),
        Color(0x30271D41),
        Color(0x1D000000),
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
