import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/states.dart';
import '../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            title: Padding(
              padding: EdgeInsets.only(right: 25),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  cubit.getSearchNews(searchKey: value);
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'search must not be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('Search'),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
          ),
          body: ConditionalBuilder(
            condition: state is! NewsGetSearchLoadingState,
            builder: (context) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return buildArticleItem(cubit.search[i], context);
                  },
                  separatorBuilder: (context, i) {
                    return Divider(
                      thickness: 1,
                      color: Colors.grey,
                    );
                  },
                  itemCount: cubit.search.length);
            },
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
