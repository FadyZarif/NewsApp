import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/states.dart';
import '../../shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsCubit()..getSportsNews(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          NewsCubit cubit = NewsCubit.get(context);
          return ConditionalBuilder(
            condition: state is! NewsGetSportsLoadingState,
            builder: (context){
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,i){
                    return buildArticleItem(cubit.sports[i]);
                  },
                  separatorBuilder: (context,i){
                    return Divider(thickness: 1,);
                  },
                  itemCount: cubit.sports.length
              );
            },
            fallback: (context)=>Center(child: CircularProgressIndicator(),),
          );
        },

      ),
    );
  }
}
