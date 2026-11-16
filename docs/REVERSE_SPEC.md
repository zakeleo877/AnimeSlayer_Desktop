# Anime Slayer (أنمي سلاير) — Reverse Engineering Specification

> Source APK: `AnimeSlayyer-1.5.10.apk` (package `com.anslayer`, versionCode 47, versionName 1.5.10)
> Reverse-engineered with the `rea` methodology (decompiled via apktool 2.9.3 + androguard).
> Purpose: blueprint for building a 1:1 desktop replica in **Flutter/Dart** (same features & UI).

---

## 1. App Identity

| Field | Value |
|---|---|
| Package | `com.anslayer` |
| App name | Anime Slayer (أنمي سلاير) |
| Version code / name | 47 / 1.5.10 |
| minSdk / targetSdk / compileSdk | 23 / 29 / 35 |
| Main activity | `com.anslayer.ui.splash.SplashActivity` |
| Application class | `com.anslayer.App` |
| Theme (app) | `@style/Theme.Anime.Light` (with DarkBlue / DarkGray / Amoled variants) |
| RTL | `supportsRtl=false` (app is LTR Arabic UI) |
| Cleartext traffic | enabled (`usesCleartextTraffic=true`) |

## 2. Tech Stack (original)

- Language: **Kotlin** (coroutines, Flow)
- DI: Koin (`AppModule`)
- Networking: **Retrofit** + OkHttp, Gson converter, coroutine suspend endpoints
- Base URL: `https://anslayer.com/anime/public/`
- DB/Cache: Room (`MultiInstanceInvalidationService`), WorkManager
- Push: Firebase Cloud Messaging (`CloudMessagingService`)
- Ads: Unity Ads (AdUnit activities), Google AdMob (AD_MANAGER_APP)
- Image loading: Glide/Picasso (avatar widget `SlayerAvatar`)
- Auth: Google Sign-In, Twitter, Facebook restore, email/password
- Video player: custom `ayp_*` player UI + WebView player (`WebViewPlayerActivity`)
- Crash/Analytics: Firebase Crashlytics, Firebase Analytics, Remote Config

## 3. Permissions

Internet, network/wifi state, external storage (read/write), foreground service, wake lock, battery optimizations, install packages, phone state, boot completed, query all packages, post notifications, ad services (topics/attribution/ad-id), Google AD_ID, FCM receive.

## 4. Screens / Activities

| Activity | Purpose |
|---|---|
| `SplashActivity` | Splash / routing |
| `MainActivity` | Host: Drawer + AppBar (Toolbar + TabLayout) + content frame |
| `SeriesActivity` | Anime details (series) |
| `CommentActivity` | Anime comments |
| `NotificationActivity` | Comment notifications |
| `AuthSelectionActivity` / `AuthActivity` | Login/register selection & forms |
| `Search.FilterActivity` | Search & filters |
| `NewsDetailsActivity` | News article |
| `RecommendActivity` / `ComposerActivity` | Recommendations list & composer |
| `ServerActivity` / `WebViewPlayerActivity` | Server selection & video playback |
| `SettingsActivity` / `AboutActivity` / `DisclaimerActivity` / `WordsBlockingActivity` | Settings |
| `ProfileActivity` (self) / `PeopleProfileActivity` | User profiles |
| `EditProfileActivity` / `UserSettingsActivity` | Edit profile & user settings |
| `BlockedUsersActivity` | Blocked users |
| `TopContributorsActivity` | Top contributors |
| `CharacterDetailsActivity` / `CharacterStaffBrowseActivity` | Character details & staff |
| `ActorDetailsActivity` / `ActorAnimeCharacterBrowseActivity` | Voice actor details |
| `CharacterSearchActivity` | Character search |
| `SeasonArchiveActivity` | Season archive |
| `CustomListDetailsActivity` / `CreateCustomListActivity` / `AddToCustomListActivity` | Custom lists |
| `BrowsePeopleAnimesActivity` | Person's anime list |
| `FullscreenImageActivity` / `FullscreenVideoActivity` | Fullscreen media |
| `WebViewActivity` | Generic webview |

## 5. Main Navigation (Drawer)

Groups:
1. Main: Latest episodes, Anime list, Anime season
2. Rankings: MAL ranking, AS ranking
3. User: My list (manage), Custom list, My favourites, Fav characters, My history, My downloads
4. Others: Top characters, Recommendations, Schedule
5. Settings

Bottom/Tab bar lives in `MainActivity` AppBar (`TabLayout` id `tabs`) over `contentFrame`.

## 6. Features

- Browse latest episodes, anime list, seasons
- Anime details: overview, episodes, characters/staff, trailer, related news, suggestions, stats, ratings (story/art/characters/ost), content rating, MAL info
- Episode playback via multiple servers & qualities, download
- Comments & replies on anime & episodes (like/dislike/flag, edit)
- Recommendations (create, list, like)
- News list & details
- Search with filters (genre, status, season, sort, etc.)
- User profiles, edit profile, avatar, stats
- My lists: watching, completed, on-hold, dropped, plan-to-watch, favourites, fav characters, history, downloads
- Custom lists (create/edit/add anime)
- Rankings: MAL & AS top anime/movies/series/airing
- Top characters
- Schedule (airing schedule)
- Character & voice actor details
- Season archive
- Notifications (comment notifications)
- Settings: theme (Light/DarkBlue/DarkGray/Amoled), words blocking, about, disclaimer, account
- Content rating, spoiler handling
- Downloads (offline)
- FCM push notifications
- Ads (Unity + AdMob)

## 7. API Endpoints (base: https://anslayer.com/anime/public/)

### Auth (`AuthEndpoint`)
- oauth/login, oauth/google-login, oauth/twitter-login
- oauth/logout, oauth/refresh-token
- oauth/forgot-password, oauth/change-password
- oauth/google-link, oauth/twitter-link
- oauth/restore-fb

### Configuration (`ConfigurationEndpoint`)
- configs/check-server, configs/get-android-config

### Series (`SeriesEndpoint`)
- anime/get-anime-details, anime/get-anime-status, anime/save-anime-rating
- anime/save-anime-to-{favorites,watching,watched,plan-to-watch,on-hold,dropped}
- anime/delete-anime-from-{favorites,watching,watched,plan-to-watch,on-hold,dropped}
- animes/get-published-animes, animes/get-anime-dropdowns, animes/get-anime-stats
- animes/get-anime-characters, animes/get-characters-details, animes/get-actors-details
- animes/add-content-rating, animes/remove-content-rating
- animes/favorite-character, animes/un-favorite-character, animes/get-favorite-characters, animes/get-top-favorite-characters
- episodes/get-episodes, episodes/get-episodes-new
- episode/save-episode-rating, episode/save-episode-to-watched-history, episode/delete-episode-from-watched-history

### Comments
- anime-comments/* (create, reply, like/dislike, flag, get, update)
- episode-comments/* (same set)

### News (`NewsEndpoint`)
- news/get-published-news

### Recommendations (`RecommendationEndpoint`)
- recommendations/get-published-recommendations, recommendations/create-recommendation
- recommendations/anime-recommendation-like

### Custom Lists (`CustomListEndPoint`)
- animes/get-custom-lists, animes/create-custom-list, animes/update-custom-list, animes/add-to-custom-list
- animes/get-published-animes (reuse)

### User (`UserEndpoint`)
- user/create-user, user/get-user, user/update-user, user/update-profile, user/update-profilev2, user/update-email, user/change-username, user/check-username
- user/is-user-already-exists, user/send-activation-code
- user/get-user-status, user/get-user-notifications, user/update-user-notification
- user/get-top-contributors, user/sync-fcm-token, user/delete-user-image
- animes/get-users-lists
- users/block-user, users/get-blocked-users, users/profile-image-flag

## 8. Themes / Colors (key tokens)

Themes: `Theme.Anime.Light`, `Theme.Anime.DarkBlue`, `Theme.Anime.DarkGray`, `Theme.Anime.Amoled`, plus `Theme.Splash`, `Theme.Player`, `Theme.ImageViewer`, `Theme.Transparent.ImagePicker`.

Key colors:
- Primary (light): `#fafafa` (`colorPrimary`), Dark: `#252e39` (DarkBlue) / `#242529` (DarkGray) / `#000000` (Amoled)
- PrimaryDark: `#e0e0e0` (light) / `#182128` / `#202125`
- Accent: `#ff9800` (`colorAccent`), StateBlue `#0091ea`, StateGreen `#00c853`, StateOrange `#ff6d00`, StateRed `#c62828`, Active `#f84235`
- Text (light): dark `#424242`, secondary `#757575`; (dark): light `#f5f5f5`
- Background light: `#fafafa` (`md_grey_50`); dark blue primary `#252e39`

Dimensions: see `res/values/dimens.xml`. Nav header height `nav_header_height`, avatar size `avatar_size`.

## 9. Data Models (top-level packages)

`com.anslayer.model.*`:
- media: `Series`, `Episode`, `ActorDetails`, `CharacterDetails`, `AnimeCharactersStaff`, `SeriesStats`, `SeriesStatus`
- container: `Container`, `Data`, `CharactersMoreDataContainer`, `StaffMoreDataContainer`, `ActorAnimeCharactersMoreDataContainer`
- filter: `FilterOption`
- chart: `AnimeStats`
- media: `ListContentRating`
- comment models (in comment packages)
- user/profile models

## 10. Assets

`assets/` contains bundled files (fonts, html, etc.) — copy as-is for the Flutter app. `lib/` contains native libs (`.so`) — not needed for Flutter (use plugins). `res/raw`, `res/font`, `res/anim`, `res/drawable*`, `res/mipmap*` provide images/icons — export and convert to Flutter assets.

## 11. Layouts (app-specific)

See `apk_decompiled/res/layout/` — 299 layouts total (incl. framework). App-specific layouts listed in reverse-engineering notes; key ones:
- `activity_main.xml`, `content_main.xml`, `activity_splash.xml`
- `series_activity.xml`, `fragment_series_detail.xml`
- `server_activity.xml`, `content_server.xml`, `web_view_player_activity.xml`
- `people_profile_activity.xml`, `profile_activity.xml`, `edit_profile_activity.xml`, `user_settings_activity.xml`
- `auth_selection_activity.xml`, `fragment_login.xml`, `fragment_register.xml`
- `character_details.xml`, `voice_actor_details_fragment.xml`
- `season_archive_activity.xml`, `news_details_activity.xml`
- `custom_list_details_activity.xml`, `create_custom_list_activity.xml`
- `top_contributers_activity.xml`, `words_blocking_activity.xml`, `settings_activity.xml`, `about`/`disclaimer`

## 12. Flutter/Dart Rebuild Notes

- Map each Activity → a Flutter route/screen (go_router).
- Bottom/Tab navigation in `MainActivity` → use `NavigationRail`/`BottomNavigationBar` or drawer + tabs.
- State management: Riverpod/Bloc; mirror Koin modules → providers.
- Networking: `dio` + `retrofit` (or `chopper`) pointing to same base URL & endpoints.
- Models: generate Dart classes from API JSON (freezed/json_serializable).
- Theming: implement 4 themes (Light/DarkBlue/DarkGray/Amoled) using the color tokens above; Material 3.
- Video: use `video_player` / `chewie` or `media_kit`; keep server selection.
- Images: `cached_network_image`.
- Offline downloads: `dio` download + local storage.
- Push: `firebase_messaging`.
- Auth: Google Sign-In (`google_sign_in`), Twitter, Facebook.
- Ads: Unity Ads / AdMob Flutter plugins.
- RTL: app UI is Arabic but `supportsRtl=false`; keep LTR layout with Arabic text.
- Keep all strings (Arabic) from `res/values/strings.xml` (default locale) — copy values.

## 13. Deliverable

This file is the reverse-engineering spec. Use it to scaffold the Flutter project. All source assets (layouts, drawables, strings) are in `apk_decompiled/`.

---

*Generated from `AnimeSlayyer-1.5.10.apk`.*
