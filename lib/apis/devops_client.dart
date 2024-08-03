import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/devops_config.dart';
import '../model/list_response.dart';
import '../model/pipeline.dart';
import '../model/pipeline_run.dart';
import '../model/project.dart';
import '../model/work_item.dart';
import 'interceptors.dart';

part 'devops_client.g.dart';

@RestApi()
abstract class DevOpsClient {
  factory DevOpsClient(Dio dio) = _DevOpsClient;

  factory DevOpsClient.fromConfig(DevopsConfig config) {
    assert(config.baseUrl != null, 'Base url is required');
    assert(config.username != null, 'Username is required');
    assert(config.password != null, 'Password is required');
    assert(config.selectedOrganization != null, 'Organization is required');

    final Dio dio = Dio()
      ..options.connectTimeout = const Duration(seconds: 3)
      ..options.baseUrl = '${config.baseUrl}/${config.selectedOrganization}'
      ..interceptors.add(AuthInterceptor(config.username!, config.password!));

    return DevOpsClient(dio);
  }

  /// GET https://dev.azure.com/{organization}/_apis/work/accountmyworkrecentactivity
  @GET('_apis/work/accountmyworkrecentactivity')
  Future<ListResponse<WorkItem>> workRecentActivity();

  /// GET https://dev.azure.com/{organization}/_apis/projects?stateFilter={stateFilter}&$top={$top}&$skip={$skip}&continuationToken={continuationToken}
  /// - `stateFilter`: Filter on team projects in a specific team project state (default: WellFormed).
  /// - `top`: The maximum number of projects to return
  /// - `skip`: The number of projects to skip
  /// - `continuationToken`: A continuation token from a previous request, to retrieve the next page of results
  @GET('/_apis/projects')
  Future<ListResponse<Project>> projects({
    @Query('stateFilter') String? stateFilter,
    @Query('top') int? top,
    @Query('skip') int? skip,
    @Query('continuationToken') String? continuationToken,
  });

  /// GET https://dev.azure.com/{organization}/{project}/_apis/pipelines?orderBy={orderBy}&$top={$top}&continuationToken={continuationToken}
  /// - `orderBy`: A sort expression. Defaults to "name asc"
  /// - `top`: The maximum number of pipelines to return
  /// - `continuationToken`: A continuation token from a previous request, to retrieve the next page of results
  @GET('/{project}/_apis/pipelines')
  Future<ListResponse<Pipeline>> pipelines(
    @Path('project') String project, {
    @Query('orderBy') String? orderBy,
    @Query('top') int? top,
    @Query('continuationToken') String? continuationToken,
  });

  /// GET https://dev.azure.com/{organization}/{project}/_apis/pipelines/{pipelineId}/runs
  @GET('/{project}/_apis/pipelines/{pipelineId}/runs')
  Future<ListResponse<PipelineRun>> pipelineRuns(
    @Path('project') String project,
    @Path('pipelineId') String pipelineId,
  );
}
