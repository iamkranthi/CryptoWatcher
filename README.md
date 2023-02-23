
![Logo](https://user-images.githubusercontent.com/75005151/220852533-11f188d9-b7ad-48af-bb47-1973008986cf.png)


# Crypto Watcher

CryptoWatcher is a cross platform application built using Flutter and Dart programming languages that allows users to monitor and analyze cryptocurrency data. The app utilizes the CoinGecko API to fetch the data and shared preferences to store it locally, providing users with quick and easy access to market trends and insights.




## Features
- Real-time updates on cryptocurrency prices, volumes, and market capitalizations.
- Detailed page viewe for each cryptocurrencies
- Can track upto 100+ crypto cryptocurrencies with dynamic refreshing.
- Allows easy tracking of favorite cryptocurrencies with one-click addition to favorites page.
- Local data storage using shared preferences, enabling faster data retrieval and reducing reliance on network requests.


## Screenshots

## Screenshots

<div style="display:flex;flex-wrap:wrap">
  <img src="https://user-images.githubusercontent.com/75005151/220852904-e954414f-46ef-43ba-84c4-86e663b31b3e.png" width="38%" />
  <img src="https://user-images.githubusercontent.com/75005151/220852922-4f5bf7f0-2206-47ed-aa22-f4557f221079.png" width="38%" />
  <img src="https://user-images.githubusercontent.com/75005151/220852885-a147138e-aafd-44c3-a7e5-a146718cd9e2.png" width="38%" />
  <img src="https://user-images.githubusercontent.com/75005151/220852876-fc0069a2-e0c6-4003-94a4-7146cfbf6971.png" width="38%" />
</div>



## Installation
- CryptoWatcher is available for Linux users to download and install via Snapcraft.
 - To install via Snapcraft visit [CryptoWatcher](https://snapcraft.io/crypto-watcher) 
- To install the application, using a terminal and enter the following command:
```bash
  sudo snap install crypto-watcher
```
- Once installed, the app can be launched from the application menu or by entering the following command:
```bash
  crypto-watcher
```
- Note that the commands above assume you are using a Debian-based Linux distribution, such as Ubuntu. If you are using a different Linux distribution, the commands may be slightly different.

## Run locally

To run CryptoWatcher on your local machine, please follow these steps:
- Clone the repository by running the command
```bash
  git clone https://github.com/iamkranthi/CryptoWatcher.git
```
- Navigate to the cloned repository by running the command:
```bash
  cd CryptoWatcher
```
- Run flutter pub get to install dependencies
- Run the app on an emulator or physical device by running the command:
```bash
  flutter run
```

## Tech Stack

- Flutter
- Dart
- State management - Provider
- CoinGecko API (API for fetching cryptocurrency data)
- Shared preferences (Package for storing data locally on the device)


## Feedback

If you have any feedback, please reach out to us at kranthicodes@gmail.com

