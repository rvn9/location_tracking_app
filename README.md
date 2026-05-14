# Location Tracking App

A Flutter app that continuously tracks device location in the foreground, background, or terminated. Displaying real-time and last-known position data, also have a toggle button to stop track location.

<img width="289" height="503" alt="image" src="https://github.com/user-attachments/assets/0faaef92-6282-4c21-958f-4dbabcf04981" />


## Features

- **Live location tracking** — streams real-time GPS coordinates (latitude, longitude, accuracy, altitude, speed, heading) as the device moves
- **Background & terminated-state tracking** — continues tracking even when the app is backgrounded or killed, using a native background geolocation service
- **Last known location** — saves and displays the most recent position where the device was stationary; auto-refreshes every 5 seconds
- **Start / stop toggle** — single tap in the app bar starts or stops tracking; a persistent notification appears while tracking is active
- **Auto-restart on boot** — tracking resumes automatically after the device restarts (if it was active before shutdown)

---

## Prerequisites

| Tool | Version | Notes |
|------|---------|-------|
| Flutter | 3.41.6 | Managed via FVM (see below) |
| FVM | any | `dart pub global activate fvm` |
| Xcode | 15+ | iOS builds only (macOS required) |
| Android Studio / SDK | any | Android builds only |
| CocoaPods | any | iOS only — `sudo gem install cocoapods` |

---

## Setup

### 1. Install FVM and the correct Flutter version

```bash
dart pub global activate fvm
fvm install        # reads .fvmrc and installs Flutter 3.41.6
```

### 2. Clone and install dependencies

```bash
git clone <repo-url>
cd location_tracking_app
fvm flutter pub get
```

### 3. Configure the background geolocation license key

The app uses [flutter_background_geolocation](https://pub.dev/packages/flutter_background_geolocation), a commercial plugin. It runs in trial mode without a key (a trial watermark notification is shown), which is fine for testing.

## Running the App

### iOS

```bash
fvm flutter run -d <device-id>
```

On first run, CocoaPods will install automatically. If it fails, run manually:

```bash
cd ios && pod install && cd ..
fvm flutter run
```

### Android

```bash
fvm flutter run -d <device-id>
```

When prompted, grant **"Allow all the time"** location permission for background tracking to work.
