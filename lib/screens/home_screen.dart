import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_flowers/blocs/connection_bloc.dart';
import 'package:love_flowers/widgets/flower_grid.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Love Flowers'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome to Love Flowers!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Expanded(
            child: BlocBuilder<ConnectionBloc, UserConnectionState>(
              builder: (context, state) {
                if (state.connectedUserId == null) {
                  return Center(
                    child: ElevatedButton(
                      child: Text('Connect with Someone'),
                      onPressed: () {
                        // Simulate connecting with a user
                        context.read<ConnectionBloc>().connectWithUser(
                              'simulated_user_id',
                              'connected_user_id',
                            );
                      },
                    ),
                  );
                }
                return FlowerGrid();
              },
            ),
          ),
        ],
      ),
    );
  }
}
