# API Endpoints - مرجع كامل

Base: `https://anslayer.com/anime/public/`

## Auth
- `POST oauth/login` {email,password}
- `POST oauth/google-login` {idToken}
- `POST oauth/twitter-login`
- `POST oauth/logout`
- `POST oauth/refresh-token` {refresh_token}
- `POST oauth/forgot-password`
- `POST oauth/change-password`
- `POST oauth/restore-fb`

## Configuration
- `GET configs/check-server`
- `GET configs/get-android-config`

## Series
- `POST anime/get-anime-details` {anime_id}
- `POST anime/get-anime-status` {anime_id}
- `POST anime/save-anime-rating`
- `POST anime/save-anime-to-favorites` etc (6 lists)
- `POST anime/delete-anime-from-*`
- `POST animes/get-published-animes` {page, filters}
- `POST animes/get-anime-dropdowns`
- `POST animes/get-anime-stats`
- `POST animes/get-anime-characters`
- `POST animes/get-characters-details`
- `POST animes/get-actors-details`
- `POST animes/add-content-rating`
- `POST episodes/get-episodes` {anime_id}
- `POST episodes/get-episodes-new`
- `POST episode/save-episode-rating`
- `POST episode/save-episode-to-watched-history`

## Comments
- `POST anime-comments/get`
- `POST anime-comments/create`
- `POST anime-comments/like`, `dislike`, `update`, `flag`
- نفسها لـ `episode-comments/`

## News
- `POST news/get-published-news`

## Recommendations
- `POST recommendations/get-published-recommendations`
- `POST recommendations/create-recommendation`
- `POST recommendations/anime-recommendation-like`

## Custom Lists
- `POST animes/get-custom-lists`
- `POST animes/create-custom-list`
- `POST animes/update-custom-list`
- `POST animes/add-to-custom-list`

## User
- `POST user/create-user`, `get-user`, `update-profile`, `update-profilev2`
- `POST user/get-user-status`, `get-user-notifications`
- `POST user/get-top-contributors`
- `POST user/sync-fcm-token`
- `POST animes/get-users-lists`
- `POST users/block-user`, `get-blocked-users`

> كل الطلبات تستخدم Dio مع Bearer token في Header.
