import '../models/recycler.dart';
import '../services/api_service.dart';
import '../services/connectivity_service.dart';
import '../services/database_service.dart';

class RecyclerResult {
  final List<Recycler> recyclers;
  final bool isOffline;
  final String? errorMessage;

  RecyclerResult({
    required this.recyclers,
    required this.isOffline,
    this.errorMessage,
  });
}

/// Repository managing e-waste recyclers data and proximity matching.
/// Follows the offline-first architecture with SQLite caching.
class RecyclerRepository {
  final DatabaseService _dbService;
  final ApiService _apiService;
  final ConnectivityService _connectivityService;

  RecyclerRepository({
    DatabaseService? dbService,
    ApiService? apiService,
    ConnectivityService? connectivityService,
  })  : _dbService = dbService ?? DatabaseService.instance,
        _apiService = apiService ?? RemoteApiService(),
        _connectivityService = connectivityService ?? ConnectivityService.instance;

  Future<RecyclerResult> fetchMatchingRecyclers({
    String? categoryId,
    bool forceRefresh = false,
  }) async {
    final isOnline = await _connectivityService.isConnected();

    if (isOnline && forceRefresh) {
      try {
        final apiResponse = await _apiService.fetchMatchingRecyclers(categoryId: categoryId);
        if (apiResponse.success && apiResponse.data != null) {
          await _dbService.insertRecyclers(apiResponse.data!);
          return RecyclerResult(recyclers: apiResponse.data!, isOffline: false);
        }
      } catch (_) {
        // Fallback to local SQLite cache
      }
    }

    // Local SQLite retrieval
    try {
      List<Recycler> localRecyclers;
      if (categoryId != null && categoryId.isNotEmpty && categoryId != 'all') {
        localRecyclers = await _dbService.getMatchingRecyclers(categoryId);
      } else {
        localRecyclers = await _dbService.getRecyclers();
      }

      // If local cache is empty, fetch from API or seed initial benchmark dataset
      if (localRecyclers.isEmpty) {
        final apiResponse = await _apiService.fetchMatchingRecyclers(categoryId: categoryId);
        if (apiResponse.success && apiResponse.data != null) {
          await _dbService.insertRecyclers(apiResponse.data!);
          localRecyclers = apiResponse.data!;
        }
      }

      // Rank/sort recyclers: Authorized first, then by ascending distance
      localRecyclers.sort((a, b) {
        if (a.isAuthorized != b.isAuthorized) {
          return a.isAuthorized ? -1 : 1;
        }
        return a.distanceKm.compareTo(b.distanceKm);
      });

      return RecyclerResult(
        recyclers: localRecyclers,
        isOffline: !isOnline,
      );
    } catch (e) {
      return RecyclerResult(
        recyclers: [],
        isOffline: !isOnline,
        errorMessage: e.toString(),
      );
    }
  }

  Future<Recycler?> getRecyclerById(String id) async {
    return _dbService.getRecyclerById(id);
  }

  Future<List<Recycler>> getMatchingRecyclers({String? category}) async {
    final res = await fetchMatchingRecyclers(categoryId: category);
    return res.recyclers;
  }

  Future<void> saveRecyclersLocally(List<Recycler> recyclers) async {
    await _dbService.insertRecyclers(recyclers);
  }
}
