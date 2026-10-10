<h1 align="center">🕌 My Prayer</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/GetX-8A2BE2?style=for-the-badge" />
</p>

<p align="center">
An Islamic companion app in Flutter: prayer times, Azkar, a digital Sebha, the Qibla direction and a Hijri calendar, in a clean and calm design.
</p>

## ✨ Features

- 🕐 **Prayer times** with a highlighted next-prayer card and a full daily grid.
- 📿 **Azkar** organised by category, with a details screen and a counter for each zikr.
- 🔢 **Sebha**: a digital tasbih counter.
- 🧭 **Qibla** compass screen.
- 📅 **Hijri calendar** with a week strip and a monthly grid.
- 👋 **Onboarding** and a splash screen.
- ⚙️ **Settings** saved on the device, with localization support.

## 🧱 Project Structure

```
lib/
├── api/              data layer
├── getx_controller/  prayer times, azkar, sebha, qibla, settings, navigation
├── models/           prayer time, zikr, azkar category, hijri date
├── preferences/      local settings
├── screen/           home, azkar, sebha, qibla, calendar, settings, onboarding, splash
├── utils/            colors, text styles, dimensions, routes, theme, transitions
└── widget/           reusable UI components
```

## 🛠️ Tech Stack

- **Flutter & Dart**
- **GetX** for state management, routing and dependency injection
- **shared_preferences** for local settings
- **flutter_svg** for icons

## 🚀 Getting Started

```bash
git clone https://github.com/Mohammed1Karam/my_prayer.git
cd my_prayer
flutter pub get
flutter run
```

## 👨‍💻 Author

**Mohammed Karam**, Flutter Developer · [GitHub](https://github.com/Mohammed1Karam)
