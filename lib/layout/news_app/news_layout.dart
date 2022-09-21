import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/news_app/cubit/cubit.dart';
import 'package:newsapp/modules/search/search.dart';
import 'package:newsapp/network/remote/dio_helper.dart';
import 'package:newsapp/shared/components/components.dart';

import '../../shared/cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titleList[cubit.screenIndex]),
            actions: [
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeMode();
                  },
                  icon: Icon(Icons.brightness_4_outlined)
              ),
              IconButton(
                  onPressed: () {
                    navigator(context: context,widget: SearchScreen());
                  },
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
    );
  }
}
