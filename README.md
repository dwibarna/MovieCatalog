# MovieCatalog

Native iOS application displaying popular movies from The Movie Database (TMDB), built with SwiftUI, Clean Architecture + MVVM, Swift Package Manager, Swinject, and Alamofire.

## Features

- Popular movies list loaded asynchronously from TMDB (`/movie/popular`)
- Movie detail screen with poster preview (`AsyncImage`) and overview
- Clean Architecture layers separating `Domain`, `Data`, `Presentation`, and `DI`
- CoreData persistence stack setup (`CoreDataStack` + `FavoriteMovieEntity`)

## Architecture & Tech Stack

- **UI:** SwiftUI (`MovieListView`, `MovieDetailView`)
- **Presentation:** `@MainActor` `ObservableObject` ViewModel (`MovieViewModel`) using Swift `async/await`
- **Domain:** Pure Swift `Movie` model, `MovieRepository` protocol, and `GetPopularMoviesUseCase`
- **Data:** `MovieService` (`Alamofire` async `serializingDecodable`), `MovieResponse` DTO, `MovieMapper`, `MovieRepositoryImpl`, and `CoreDataStack`
- **Dependency Injection:** `Swinject` container (`AppContainer.swift`)
- **Dependency Management:** Swift Package Manager (`Alamofire 5.10.2`, `Swinject 2.9.1`)

## Project Structure

```text
MovieCatalog/
├── MovieCatalog.xcodeproj/
└── MovieCatalog/
    ├── MovieCatalogApp.swift
    ├── DI/AppContainer.swift
    ├── Domain/
    │   ├── Model/Movie.swift
    │   ├── Repository/MovieRepository.swift
    │   └── UseCase/GetPopularMoviesUseCase.swift
    ├── Data/
    │   ├── Local/CoreDataStack.swift
    │   └── Remote/
    │       ├── API/MovieService.swift
    │       ├── DTO/MovieResponse.swift
    │       ├── Mapper/MovieMapper.swift
    │       └── Repository/MovieRepositoryImpl.swift
    ├── Presentation/
    │   ├── View/
    │   │   ├── MovieListView.swift
    │   │   └── MovieDetailView.swift
    │   └── ViewModel/MovieViewModel.swift
    ├── Utils/Secrets.swift
    └── MovieCatalog.xcdatamodeld/
```

## Prerequisites

- macOS with **Xcode 16+** (`IPHONEOS_DEPLOYMENT_TARGET = 18.5`, Swift `5.0`)
- Swift Package Manager (resolved automatically by Xcode via `Package.resolved`)
- A TMDB v3 API key

## Configuration

`MovieService` reads `TMDB_BASE_URL` and `TMDB_API_KEY` through `Secrets.swift`, which expects an untracked `Secrets.plist` resource in the app bundle (`Secrets.plist` is gitignored).

1. Copy `MovieCatalog/Secrets.plist.example` to `MovieCatalog/Secrets.plist`:
   ```bash
   cp MovieCatalog/Secrets.plist.example MovieCatalog/Secrets.plist
   ```
2. Open `MovieCatalog/Secrets.plist` and replace `your_tmdb_api_key_here` with your TMDB v3 API key (keep the trailing slash on `https://api.themoviedb.org/3/`).
3. Open `MovieCatalog.xcodeproj` in Xcode and confirm `Secrets.plist` appears under the `MovieCatalog` target resources (the project uses an Xcode synchronized root group, so files inside `MovieCatalog/` are normally picked up automatically; check **Target Membership -> MovieCatalog** if needed).

## Build and Run

1. Open `MovieCatalog.xcodeproj` in Xcode.
2. Wait for Swift Package Manager to finish resolving `Alamofire` and `Swinject`.
3. Select an iOS 18.5+ Simulator and click **Run** (`Cmd + R`).
