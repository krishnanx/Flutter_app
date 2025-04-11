# Junior Flutter Developer Task | Lascade

This project is a "mobile e-commerce application" built using Flutter, showcasing integration with the Fake Store API to display product listings, details, and cart functionalities.

The app retrieves product data dynamically from the API and presents it in a clean, responsive UI. State management is handled using Riverpod, enabling a scalable and reactive architecture with clear separation of logic and UI.

Future Implementation: User authentication, order history tracking, payment gateway integration, and persistent local cart using shared preferences or Hive.


## Instruction to run locally
  ```bash
    git clone https://github.com/krishnanx/Flutter_app.git

  ```
  ```bash
    cd Flutter_app
  ```
  ```bash
    flutter pub get  
  ```
  ```bash
    flutter run
  ```
## To get apk
  ```bash
    flutter build apk --release
  ```
## Dependencies used
  - flutter:	Core SDK for building cross-platform apps using Dart.
  - flutter_riverpod:	Robust and scalable state management solution.
  - dio:	Powerful HTTP client for making API requests.
  - flutter_svg:	Renders SVG images directly in Flutter widgets.

## State Management Approach
  This project uses Riverpod for state management. Even though it is similar to the Provider state mangement,
  Riverpod is selected for its Async support where it provides FutureProvider and StreamProvider to handle API calls and real-time data.
  
## Tech Stack
  - Flutter
  - Riverpod
  - Dios
  - Dart

## Demo Video
  - [https://youtube.com/shorts/tdLRFUfpZV4](https://youtube.com/shorts/tdLRFUfpZV4)




