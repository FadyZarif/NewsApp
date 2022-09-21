import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/news_app/cubit/cubit.dart';
import 'package:newsapp/layout/news_app/cubit/states.dart';
import 'package:newsapp/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        NewsCubit cubit = NewsCubit.get(context);
        return ConditionalBuilder(
          condition: state is! NewsGetBusinessLoadingState,
          builder: (context){
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,i){
                  return buildArticleItem(cubit.business[i],context);
                },
                separatorBuilder: (context,i){
                  return Divider(thickness: 1,color: Colors.grey,);
                },
                itemCount: cubit.business.length
            );
          },
          fallback: (context)=>Center(child: CircularProgressIndicator(),),
        );
      },

    );
  }
}
