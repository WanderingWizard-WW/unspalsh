import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unspalsh/di/injector.dart';
import 'package:unspalsh/view/home/bloc/home_cubit.dart';
import 'package:unspalsh/view/home/widgets/photo_view_screen.dart';
import 'package:unspalsh/view/home/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 1,
              elevation: 1,
              title: const Text('Unsplash Client'),
              bottom: SearchBar(
                onSearchSubmit: context.read<HomeCubit>().onSearchSubmitted,
              ),
            ),
            body: Builder(
              builder: (context) {
                if (state is HomeLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is HomeErrorState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: context.read<HomeCubit>().onRefresh,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }
                if (state is HomeEmptyState) {
                  return Center(
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }
                state as HomeLoadedState;
                return RefreshIndicator(
                  onRefresh: context.read<HomeCubit>().onRefresh,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: state.photos.length,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    itemBuilder: (context, index) {
                      final photo = state.photos.elementAt(index);
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (_, animation, __) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: PhotoViewScreen(photo: photo),
                                    );
                                  },
                                ),
                              );
                            },
                            child: Hero(
                              tag: photo.id,
                              child: Image.network(
                                photo.regularUrl,
                                fit: BoxFit.cover,
                                height: 400,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
