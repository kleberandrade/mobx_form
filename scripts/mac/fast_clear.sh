fvm flutter clean
fvm flutter pub get
find . -name \*.g.dart -type f -delete
find . -type d -empty -delete
fvm flutter packages pub run build_runner build --delete-conflicting-outputs