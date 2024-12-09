import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_flowers/blocs/flower_bloc.dart';
import 'package:love_flowers/blocs/auth_bloc.dart';
import 'package:love_flowers/blocs/connection_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:love_flowers/widgets/full_screen_flower.dart';

class FlowerGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlowerBloc, FlowerState>(
      builder: (context, state) {
        return GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: state.flowers.length,
          itemBuilder: (context, index) {
            final flower = state.flowers[index];
            return GestureDetector(
              onTap: () {
                context.read<FlowerBloc>().selectFlower(flower);
                // Show full-screen flower view
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenFlower(
                      imagePath: flower.fullScreenImagePath,
                      animationPath: flower.animationPath,
                    ),
                  ),
                );
                // Simulate sending a flower
                context.read<FlowerBloc>().sendFlower(
                      context.read<AuthBloc>().state.userId,
                      context.read<ConnectionBloc>().state.connectedUserId!,
                      flower,
                    );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${flower.name} sent!')),
                );
              },
              child: Card(
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      flower.svgPath,
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(height: 8),
                    Text(flower.name),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
