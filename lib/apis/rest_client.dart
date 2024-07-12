import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/work_item.dart';
import 'list_response.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/{organization}/_apis/work/accountmyworkrecentactivity')
  Future<ListResponse<WorkItem>> myWorkRecentActivity(
    @Path('organization') String organization,
  );
}
