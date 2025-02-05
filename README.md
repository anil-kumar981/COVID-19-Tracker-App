# COVID-19-Tracker-App

[![forthebadge](https://img.shields.io/badge/Built%20with-Flutter-blueviolet)](https://flutter.dev/)

This is a COVID-19 Tracker App built using Flutter. It provides up-to-date information about the COVID-19 pandemic, including global and country-specific data. 

## Table of Contents

- [Screenshots](#screenshots)
- [Features](#features)
- [UI Elements](#ui-elements)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Screenshots

![Splash Screen](your_image_path/splash_screen.png)  
_Splash Screen: Displays the app logo and name while loading._

![Home Screen](your_image_path/home_screen.png)  
_Home Screen: Shows global statistics and provides access to country-specific data._

![Country List Screen](your_image_path/country_list_screen.png)  
_Country List Screen: Displays a searchable list of countries with their COVID-19 statistics._

![Country Detail Screen](your_image_path/country_detail_screen.png)  
_Country Detail Screen: Displays detailed COVID-19 statistics for a selected country._


## Features

- **Global Data:** Displays total confirmed cases, deaths, and recovered cases worldwide.
- **Country-specific Data:** Provides detailed statistics for each country, including total cases, new cases, total deaths, new deaths, total recovered, active cases, critical cases, and cases per million.
- **Search Functionality:** Allows users to search for a specific country to view its data quickly.
- **Pull to Refresh:** Refreshes the data with the latest information. (If implemented)
- **Dark Mode Support:** Offers a dark mode option for comfortable viewing in low-light conditions. (If implemented)

## UI Elements

### Splash Screen

- **App Logo:** The app's logo is displayed prominently in the center.
- **App Title:** The name of the app, "COVID-19 Tracker," is shown below the logo.

### Home Screen

- **AppBar:** Displays the app title.
- **Global Statistics:**  Displays overall COVID-19 statistics for the world.
    - **Labels:** Text widgets to display the names of the statistics (e.g., "Total Cases," "Deaths").
    - **Values:** Text widgets to display the corresponding numerical data.
- **Track Countries Button:** A button to navigate to the country list screen.

### Country List/Search Screen

- **AppBar:** Displays the screen title ("Search Country") and a back button.
- **Search Bar:**  Allows users to type in a country name to filter the list in real-time.
    - **Text Input Field:** Accepts the country name as input.
- **Country List:** A scrollable list of countries.
    - **ListTiles:** Each ListTile represents a country.
        - **Country Flag:** A small flag icon visually represents each country.
        - **Country Name:** The name of the country.
        - **Cases Count:** The total number of COVID-19 cases in that country.

### Country Detail Screen

- **AppBar:** Displays the name of the selected country.
- **Country Information:**
    - **Country Flag:** A prominent display of the selected country's flag.
    - **Country Name:** The name of the country is clearly shown (likely in the AppBar or as a title).
- **Statistics Display:**  Key COVID-19 data points for the selected country.
    - **Cases:** Total number of confirmed cases.
    - **Recovered:** Total number of recovered cases.
    - **Deaths:** Total number of deaths.
    - **Critical:** Number of critical cases.
    - **Today Recovered:** Number of recoveries reported today (if available).
    - *(Add other relevant statistics as needed)*

## Getting Started

### Prerequisites

- Flutter SDK installed on your machine.
- Android Studio or VS Code with Flutter extension.
- A physical device or emulator for testing.

## Installation

1. Clone the repository: `git clone https://github.com/anil-kumar981/COVID-19-Tracker-App.git`
2. Navigate to the project directory: `cd COVID-19-Tracker-App`
3. Install dependencies: `flutter pub get`

## Usage

1. Connect your device or start an emulator.
2. Run the app: `flutter run`

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

[Choose a license for your project](https://choosealicense.com/)
