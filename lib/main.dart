import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/bloc/initial/initial_state.dart';
import 'package:test_task/repositories/repository.dart';
import 'package:test_task/widgets/fullscreen_loader.dart';
import 'package:test_task/widgets/item.dart';

import 'bloc/counter/counter_bloc.dart';
import 'bloc/initial/initial_bloc.dart';
import 'bloc/initial/initial_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    apiRepository: ApiRepository(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required ApiRepository apiRepository})
      : _apiRepository = apiRepository;

  final ApiRepository _apiRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RepositoryProvider.value(
            value: _apiRepository,
            child: BlocProvider(
                create: (BuildContext context) => CounterBloc(),
                child: BlocProvider(
                  create: (BuildContext context) => InitialBloc(),
                  child: const MyHomePage(title: 'Flutter Demo Home Page'),
                ))));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<InitialBloc>().add(InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {},
            builder: (context, state) {
              {
                return Stack(
                  children: [
                    Stack(alignment: Alignment.bottomCenter, children: [
                      Center(
                        child: CustomScrollView(slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Column(
                              children: [
                                BlocConsumer<InitialBloc, InitialAppState>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    if (state is InitialState) {
                                      return const Expanded(
                                        child: FullscreenLoader(
                                          showGrayBackground: false,
                                        ),
                                      );
                                    } else {
                                      return Expanded(
                                        child: Container(
                                            width: 200,
                                            height: 100,
                                            child: Image.network(state
                                                .logo!.hits[0].webformatUrl)),
                                      );
                                    }
                                    // return Container();
                                  },
                                ),

                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Wrap(children: state.items),
                                )
                                //Ce
                              ],
                            ),
                          )
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FloatingActionButton(
                                onPressed: () => context
                                    .read<CounterBloc>()
                                    .add(CounterDecrementEvent()),
                                child:
                                    SvgPicture.asset('lib/assets/minus.svg')),
                            FloatingActionButton(
                              onPressed: () => context.read<CounterBloc>().add(
                                  CounterIncrementEvent(
                                      Item('Item ${state.items.length + 1}'))),
                              child: SvgPicture.asset('lib/assets/plus.svg'),
                            )
                          ],
                        ),
                      ),
                    ]),
                    // if (state is LoadingState) const FullscreenLoader(),
                  ],
                );
              }
              // }
              //else return Container();
            }));
  }
}

//
