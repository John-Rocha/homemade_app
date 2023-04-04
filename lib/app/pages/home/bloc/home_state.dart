import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:homemade_app/app/models/product_model.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;

  const HomeState({
    required this.status,
    required this.products,
    this.errorMessage,
  });

  HomeState.initial()
      : status = HomeStateStatus.initial,
        products = [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, products, errorMessage];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
