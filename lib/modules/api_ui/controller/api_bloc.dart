import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../bloc/bloc.dart';
import '../../../modules/api_ui/view_model/api_model.dart';
import '../../../utlis/helpers/app_state.dart';
import '../../../utlis/helpers/response_modal.dart';

class ApiBloc extends Bloc<ApiModel> {
  @override
  ApiModel initDefaultValue() {
    return ApiModel(appState: AppState.initial);
  }

  callApi() async {
    state.appState = AppState.loading;
    emit(state);
    var data = await http.get(
        // Uri.parse('https://list.ly/api/v4/meta?url=http://google.com'),
        Uri.parse('https://date.nager.at/api/v2/publicholidays/2020/US'),
        headers: {
          'Content-Type': 'application/json',
        });

    if (data.statusCode == 200) {
      state.appState = AppState.success;
      state.responseModel = ResponseModel(
        statusCode: data.statusCode.toString(),
        statusMessage: data.reasonPhrase.toString(),
        data: jsonDecode(data.body),
      );
    } else {
      state.appState = AppState.failure;
    }
    emit(state);
  }
}
