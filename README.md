# flutter_study_googlemap

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

### Generate Google Map API key
Get an API key at https://cloud.google.com/maps-platform/.

#### Android
Specify your API key in the application manifest android/app/src/main/AndroidManifest.xml:

```xml
<meta-data android:name="com.google.android.geo.API_KEY" android:value="YOUR API KEY"/>
```
