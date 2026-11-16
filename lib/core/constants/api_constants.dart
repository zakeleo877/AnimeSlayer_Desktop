// مستوحى من AnimeSlayer_ReverseEngineering_Spec.md - قسم 7
class ApiConstants {
  static const String baseUrl = 'https://anslayer.com/anime/public/';
  
  // Auth (AuthEndpoint)
  static const String login = 'oauth/login';
  static const String googleLogin = 'oauth/google-login';
  static const String twitterLogin = 'oauth/twitter-login';
  static const String logout = 'oauth/logout';
  static const String refreshToken = 'oauth/refresh-token';
  static const String forgotPassword = 'oauth/forgot-password';
  static const String changePassword = 'oauth/change-password';
  static const String googleLink = 'oauth/google-link';
  static const String twitterLink = 'oauth/twitter-link';
  static const String restoreFb = 'oauth/restore-fb';

  // Configuration
  static const String checkServer = 'configs/check-server';
  static const String getAndroidConfig = 'configs/get-android-config';

  // Series
  static const String getAnimeDetails = 'anime/get-anime-details';
  static const String getAnimeStatus = 'anime/get-anime-status';
  static const String saveAnimeRating = 'anime/save-anime-rating';
  
  static const String saveToFavorites = 'anime/save-anime-to-favorites';
  static const String saveToWatching = 'anime/save-anime-to-watching';
  static const String saveToWatched = 'anime/save-anime-to-watched';
  static const String saveToPlanToWatch = 'anime/save-anime-to-plan-to-watch';
  static const String saveToOnHold = 'anime/save-anime-to-on-hold';
  static const String saveToDropped = 'anime/save-anime-to-dropped';
  
  static const String deleteFromFavorites = 'anime/delete-anime-from-favorites';
  static const String deleteFromWatching = 'anime/delete-anime-from-watching';
  static const String deleteFromWatched = 'anime/delete-anime-from-watched';
  static const String deleteFromPlanToWatch = 'anime/delete-anime-from-plan-to-watch';
  static const String deleteFromOnHold = 'anime/delete-anime-from-on-hold';
  static const String deleteFromDropped = 'anime/delete-anime-from-dropped';

  static const String getPublishedAnimes = 'animes/get-published-animes';
  static const String getAnimeDropdowns = 'animes/get-anime-dropdowns';
  static const String getAnimeStats = 'animes/get-anime-stats';
  static const String getAnimeCharacters = 'animes/get-anime-characters';
  static const String getCharactersDetails = 'animes/get-characters-details';
  static const String getActorsDetails = 'animes/get-actors-details';
  static const String addContentRating = 'animes/add-content-rating';
  static const String removeContentRating = 'animes/remove-content-rating';
  static const String favoriteCharacter = 'animes/favorite-character';
  static const String unFavoriteCharacter = 'animes/un-favorite-character';
  static const String getFavoriteCharacters = 'animes/get-favorite-characters';
  static const String getTopFavoriteCharacters = 'animes/get-top-favorite-characters';

  static const String getEpisodes = 'episodes/get-episodes';
  static const String getEpisodesNew = 'episodes/get-episodes-new';
  static const String saveEpisodeRating = 'episode/save-episode-rating';
  static const String saveEpisodeToHistory = 'episode/save-episode-to-watched-history';
  static const String deleteEpisodeFromHistory = 'episode/delete-episode-from-watched-history';

  // Comments
  static const String animeComments = 'anime-comments/';
  static const String episodeComments = 'episode-comments/';

  // News
  static const String getPublishedNews = 'news/get-published-news';

  // Recommendations
  static const String getPublishedRecommendations = 'recommendations/get-published-recommendations';
  static const String createRecommendation = 'recommendations/create-recommendation';
  static const String animeRecommendationLike = 'recommendations/anime-recommendation-like';

  // Custom Lists
  static const String getCustomLists = 'animes/get-custom-lists';
  static const String createCustomList = 'animes/create-custom-list';
  static const String updateCustomList = 'animes/update-custom-list';
  static const String addToCustomList = 'animes/add-to-custom-list';

  // User
  static const String createUser = 'user/create-user';
  static const String getUser = 'user/get-user';
  static const String updateUser = 'user/update-user';
  static const String updateProfile = 'user/update-profile';
  static const String updateProfileV2 = 'user/update-profilev2';
  static const String updateEmail = 'user/update-email';
  static const String changeUsername = 'user/change-username';
  static const String checkUsername = 'user/check-username';
  static const String isUserAlreadyExists = 'user/is-user-already-exists';
  static const String sendActivationCode = 'user/send-activation-code';
  static const String getUserStatus = 'user/get-user-status';
  static const String getUserNotifications = 'user/get-user-notifications';
  static const String updateUserNotification = 'user/update-user-notification';
  static const String getTopContributors = 'user/get-top-contributors';
  static const String syncFcmToken = 'user/sync-fcm-token';
  static const String deleteUserImage = 'user/delete-user-image';
  static const String getUsersLists = 'animes/get-users-lists';
  static const String blockUser = 'users/block-user';
  static const String getBlockedUsers = 'users/get-blocked-users';
  static const String profileImageFlag = 'users/profile-image-flag';
}
