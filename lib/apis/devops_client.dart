import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/devops_config.dart';
import '../model/work_item.dart';
import 'interceptors.dart';
import 'list_response.dart';

part 'devops_client.g.dart';

@RestApi()
abstract class DevOpsClient {
  factory DevOpsClient(Dio dio) = _DevOpsClient;

  factory DevOpsClient.fromConfig(DevopsConfig config) {
    assert(config.baseUrl?.isNotEmpty ?? true, 'Base url is empty');
    assert(config.username?.isNotEmpty ?? true, 'Username is empty');
    assert(config.password?.isNotEmpty ?? true, 'Password is empty');

    final Dio dio = Dio()
      ..options.baseUrl = config.baseUrl!
      ..interceptors.add(AuthInterceptor(config.username!, config.password!));

    return DevOpsClient(dio);
  }

  @GET('/{organization}/_apis/work/accountmyworkrecentactivity')
  Future<ListResponse<WorkItem>> myWorkRecentActivity(
    @Path('organization') String organization,
  );
}
