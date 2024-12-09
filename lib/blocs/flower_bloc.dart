import 'package:flutter_bloc/flutter_bloc.dart';

class Flower {
  final String id;
  final String name;
  final String svgPath;
  final String animationPath;
  final String fullScreenImagePath;

  Flower({
    required this.id,
    required this.name,
    required this.svgPath,
    required this.animationPath,
    required this.fullScreenImagePath,
  });
}

class FlowerState {
  final List<Flower> flowers;
  final Flower? selectedFlower;

  FlowerState({required this.flowers, this.selectedFlower});
}

class FlowerBloc extends Cubit<FlowerState> {
  FlowerBloc()
      : super(FlowerState(flowers: [
          Flower(
            id: '1',
            name: 'Rose',
            svgPath: 'assets/rose.svg',
            animationPath: 'assets/rose_animation.json',
            fullScreenImagePath: 'assets/rose_full.jpg',
          ),
          Flower(
            id: '2',
            name: 'Tulip',
            svgPath: 'assets/tulip.svg',
            animationPath: 'assets/tulip_animation.json',
            fullScreenImagePath: 'assets/tulip_full.jpg',
          ),
          Flower(
            id: '3',
            name: 'Sunflower',
            svgPath: 'assets/sunflower.svg',
            animationPath: 'assets/sunflower_animation.json',
            fullScreenImagePath: 'assets/sunflower_full.jpg',
          ),
        ]));

  void selectFlower(Flower flower) {
    emit(FlowerState(flowers: state.flowers, selectedFlower: flower));
  }

  Future<void> sendFlower(
      String senderId, String receiverId, Flower flower) async {
    // Simulate sending flower
    print('Flower ${flower.name} sent from $senderId to $receiverId');
  }
}
