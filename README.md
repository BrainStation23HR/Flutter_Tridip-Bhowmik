## brain_station_assessment_task 

# How to run the project:
I will push the codebase to a Git repository. To run the project, first clone it from GitHub. After cloning, open a terminal in the project directory and run the command "flutter pub get" to install all the necessary dependencies. Make sure that the Flutter SDK and Dart SDK are properly installed and updated on your system. Once everything is set up, you can run the project using an IDE like Android Studio or Visual Studio Code. Additionally, I will provide an APK file that allows you to run the app directly on your mobile device without setting up the development environment.  

# Environment setup instructions:
Need Dart version 3.8.0, so use updated version of Flutter SDK.

# Flutter and Dart Version Used:
Flutter: 3.32.0
Dart: 3.8.0

# Project architecture:
In this project, I am using the GetX architectural pattern. The project structure is organized as follows: under the lib directory, the main.dart file serves as the entry point of the application. The routes folder contains app_routes.dart and app_pages.dart for defining and managing navigation throughout the app. The modules directory is the core of the project, containing each feature's bindings, controllers, and views—this is where the UI and business logic reside. The network folder includes api_client.dart and api_urls.dart, which handle API requests and endpoint definitions. All API response models are stored in the data directory. Additionally, the core folder holds reusable components such as utility classes, helper functions, custom widgets, and constant values. 

Folder Structure of code:
lib -> main.dart -> routes (app routes, app pages) -> modules (bindings, controller, view) -> network (api client, api urls) -> data (api response model) -> core (utils, helper, widgets, constants)
