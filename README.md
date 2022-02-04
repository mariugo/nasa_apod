# NASA Apod

## 📱Screens 
  <div align="center">
    <p>Online/offline light theme</p>
   <img src="assets/images/gif1.gif"></img>
   <img src="assets/images/gif2.gif"></img>
  </div>
  </br>
  <div align="center">
  <p>Online/offline dark theme</p>
   <img src="assets/images/gif3.gif"></img>
   <img src="assets/images/gif4.gif"></img>
  </div>

## 🛠 Technology 🚀

This project was developed using the following libraries and technology:

- <a href="https://flutter.dev/">Flutter 2.10.1</a>
- <a href="https://pub.dev/packages/google_fonts">google_fonts</a>
- <a href="https://pub.dev/packages/http">http</a>
- <a href="https://pub.dev/packages/cached_network_image">cached_network_image</a>
- <a href="https://pub.dev/packages/shared_prefences">shared_prefences</a>
- <a href="https://pub.dev/packages/connectivity_plus">connectivity_plus</a>
- <a href="https://pub.dev/packages/flutter_dotenv">flutter_dotenv</a>

## ⚠️ Attention

You need to register at <a href="https://api.nasa.gov/">NASA APIs</a> to get your token.
Once you have it, there's a file called **.env copy** you should replace it with your token and
**rename it** to *.env*, then run:

```bash
flutter pub get
flutter run
```

## 💻 About

This app that uses **NASA APOD API** for requests and **Shared Preferences/CachedNetworkImage** 
for the storing the apis' results. It returns either a list of apods or a selected apod by date.

It features both **light** and **dark** mode!

Offline usage does not allow you to search for apods.

It was build using principles of **Clean Architecture**, **SOLID** and **TDD**.

It has also unit tests for the API calls.

- [APK Download](https://drive.google.com/file/d/1EtfTlavKlLukbzJA8Y2XcL7bDcGhjEX7/view?usp=sharing) - APK download link from Google Drive.

---
Made with ♥ by Mariugo 🚀