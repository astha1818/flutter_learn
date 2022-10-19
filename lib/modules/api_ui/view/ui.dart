import 'package:flutter/material.dart';
import '../../../modules/api_ui/controller/api_bloc.dart';
import '../../../utlis/custom_widgets/custom_text.dart';
import '../../../bloc/bloc_builder.dart';
import '../../../utlis/helpers/app_state.dart';

class ApiUI extends StatefulWidget {
  const ApiUI({super.key});

  @override
  State<ApiUI> createState() => _ApiUIState();
}

class _ApiUIState extends State<ApiUI> {
  final ApiBloc _apiBloc = ApiBloc();
  @override
  void initState() {
    super.initState();
    _apiBloc.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _apiBloc,
      builder: () {
        return Scaffold(
          body: Center(
            child: _apiBloc.state.appState == AppState.loading
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return CustomText(
                        title: _apiBloc.state.responseModel?.data[index]
                            ['name'],
                      );
                    },
                    itemCount: _apiBloc.state.responseModel?.data.length,
                  ),
          ),
        );
      },
    );
  }
}
