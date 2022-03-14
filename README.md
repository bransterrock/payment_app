# Payment App
This sample app collects data from an external api and displays different payment options to the user while caching the info for offline use.
## Build Instructions For Windows

1. Install [Flutter](https://flutter.dev/docs/get-started/install) SDK on local machine. (The Flutter stable channel was used in the making of this project)
2. Make sure you've installed Android Studio or VScode with their respective flutter plugins.
3. Clone the repo
4. Run the following commands
```engine='sh'
cd path/to-your-project
flutter pub get 
flutter run --release
```
## Build Instruction for iOS Development

1. Install [Flutter](https://flutter.dev/docs/get-started/install) SDK on local machine *Ensure to get Flutter version 1.22.6*
2. Install [XCode](https://developer.apple.com/xcode/resources/) on local machine *Ensure to install Xcode version 12.3*
3. Clone the repo
4. Install [Cocoapods](https://medium.com/p-society/cocoapods-on-apple-silicon-m1-computers-86e05aa10d3e)
5. Set up project using:

```engine='sh'
cd path/your-project
flutter pub get 
cd ios
pod install
cd ..
flutter run --release
```

**Note**: You need an emulator or a device connected to use **flutter run**
**Attention**: In order to run an android emulator on an M1 silicon Mac you will need to install: [Standalone Android Emulator](https://github.com/google/android-emulator-m1-preview)

### To run app in regular/default mode

```sh
flutter run
```
## Design Pattern 
The design pattern currently being use is based on the **Domain Driven Design (DDD)** where features are grouped under a single domain and this helps our code to be more:

1. **Maintainability**: no messed code, no cross-referencing between segments.
2. **Scalability**: You can add new functionality more easily
3. **Testability**: You can mock dependencies.

## Project Structure #

The project consist of a **core**, **domain**, **pages**, and **router** folder at a high level and is broken down as shown below

**Core** consist of functions, features and widgets that will be used thoughtout the app.

 **Domain** consist of features folders and each of these folder has the following folders:
- **Models**: Defines the structure of the data
- **Providers**: Provides data to views, update view states
- **Repository**: Contains classes that is use fetches data from a both local and remote sources
 
**Pages** this holds views/widget that has a navigation route associated with them in the app of the project and are grouped based on domain

**Router** contains the routing for all pages

## Testing

To run all tests in the test folder use this command:
```flutter test```
## Directory structure # 
    .             
    ├── libs                    
    │   ├── core                
    │   ├── domain
    │   │   └── feature   
    │   │       ├── models      
    │   │       ├── providers   
    │   │       └── repository  # classes that pulls data remotely or locally
    │   ├── router              # definition of navigation routes in the app
    │   ├── pages               # contains widget that has a route to them          
    └── test                    # unit test
