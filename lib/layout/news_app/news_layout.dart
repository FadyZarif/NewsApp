import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/news_app/cubit/cubit.dart';
import 'package:newsapp/network/remote/dio_helper.dart';

import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinessNews(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titleList[cubit.screenIndex]),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search)
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: (){
                  cubit.getBusinessNews();
                }
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex: cubit.screenIndex,
              onTap: (i) {
                cubit.changeBottomNavBar(i);
              },
            ),
            body: cubit.screenList[cubit.screenIndex],
          );
        },
      ),
    );
  }
}
