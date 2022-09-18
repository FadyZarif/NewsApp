import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/states.dart';
import '../../shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsCubit()..getScienceNews(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          NewsCubit cubit = NewsCubit.get(context);
          return ConditionalBuilder(
            condition: state is! NewsGetScienceLoadingState,
            builder: (context){
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,i){
                    return buildArticleItem(cubit.science[i]);
                  },
                  separatorBuilder: (context,i){
                    return Divider(thickness: 1,);
                  },
                  itemCount: cubit.science.length
              );
            },
            fallback: (context)=>Center(child: CircularProgressIndicator(),),
          );
        },

      ),
    );
  }
}
