# DailyPosts

DailyPosts is a SwiftUI app that fetches and displays a list of posts from a network service. It allows users to view post details and gracefully handles network errors.

## Features

- Display a list of posts fetched from a network service.
- Show post details when a post is selected.
- Handle network errors and display an alert to the user.

## Technologies Used

- SwiftUI: Used for building the user interface.
- Combine: Used for asynchronous programming and handling data flow.
- UIKit: Used for making network requests.

## Installation

1. Clone the repository to your local machine:

```bash
git clone <repository-url>
Open the project in Xcode:

- cd DailyPosts
- open DailyPosts.xcodeproj
- Build and run the project in Xcode.

## Usage
- Upon launching the app, you will see a list of posts.
- Tap on a post to view its details.
- If there's a network error while fetching posts, an alert will be displayed with the localised error message.

## Code Structure
- The project structure is organized as follows:

- Models: Contains the data models used in the app.
- Services: Contains network service implementations for fetching data.
- ViewModels: Contains view models that manage the presentation logic for views.
- Views: Contains SwiftUI views for displaying the user interface.
- Utilities: Contains utility classes and helpers used throughout the app.
