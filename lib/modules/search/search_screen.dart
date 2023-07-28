import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press_pulse/shared/components/components.dart';
import 'package:press_pulse/shared/cubit/cubit.dart';
import 'package:press_pulse/shared/cubit/states.dart';


class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color? textInput = Theme.of(context).textTheme.bodyMedium!.color;
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list= NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    obscureText: false,
                    style: TextStyle(color:textInput, fontSize: 16),
                    // enabled: ,
                    // onFieldSubmitted: ,
                    // onChanged: ,
                    // onTap: ,
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.search_rounded,color: primaryColor,),
                      hintStyle: TextStyle(color: primaryColor),
                      hintText: 'Search',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: primaryColor,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor,),
                        borderRadius: BorderRadius.circular(25.0),
                      ),

                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(child: articleBuilder(list)),
              ]
          ),
        );
      },
    );
  }
}
