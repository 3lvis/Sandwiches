# 🍞 Sandwiches (SwiftUI Sample, Modernized)

This project is a **modernized version** of the classic [WWDC20 session 10119: *Introduction to SwiftUI*](https://developer.apple.com/videos/play/wwdc2020/10119/).  
Back then, the app demonstrated SwiftUI with `@StateObject`, `ObservableObject`, and `@Published`.  
In this update, we refactored it to use Apple’s **new [Observation framework](https://developer.apple.com/documentation/observation)** introduced at WWDC23, replacing the old property wrappers.

---

## ✨ Features
- Browse a list of delicious sandwiches with images and ingredient counts.
- Tap a sandwich to see details with zoomable images.
- Spicy sandwiches show a banner with an animated transition.
- Add, delete, and reorder sandwiches with smooth list animations.
- Navigation works seamlessly across iOS, iPadOS, and macOS.
- Built with **modern SwiftUI data flow primitives**:
  - `@Observable` for the shared store
  - `@State` for source-of-truth ownership
  - `@Bindable` for passing editable models down the view tree
  - `@Binding` for row-level editing

---

## 🆚 What Changed from WWDC20
| WWDC20 (2020)                 | Updated (2025)                   |
|-------------------------------|-----------------------------------|
| `ObservableObject` + `@Published` | `@Observable` (Observation framework) |
| `@StateObject` / `@ObservedObject` | `@State` (source of truth) + `@Bindable` |
| `NavigationView`               | `NavigationStack`                |
| `edgesIgnoringSafeArea`        | `ignoresSafeArea`                |

---

## 🛠️ Requirements
- Xcode 16+
- iOS 18+, macOS 15+, iPadOS 18+
- Swift 5.10+

---

## 🚀 Getting Started
1. Clone the repo
   ```bash
   git clone https://github.com/your-username/sandwiches-observation.git
   cd sandwiches-observation
