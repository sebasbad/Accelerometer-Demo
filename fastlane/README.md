fastlane documentation
================
# Installation
```
sudo gem install fastlane
```
# Available Actions
## iOS
### ios test
```
fastlane ios test
```
Runs all the tests
### ios bump_patch
```
fastlane ios bump_patch
```
Bump patch
### ios bump_minor
```
fastlane ios bump_minor
```
Bump minor
### ios bump_major
```
fastlane ios bump_major
```
Bump major
### ios bump_build
```
fastlane ios bump_build
```
Bump build
### ios crashlytics_beta
```
fastlane ios crashlytics_beta
```
Build and distribute build to Crashlytics

This will also make sure the profile is up to date
### ios testflight_beta
```
fastlane ios testflight_beta
```
Submit a new Beta Build to Apple TestFlight

This will also make sure the profile is up to date

----

This README.md is auto-generated and will be re-generated every time to run [fastlane](https://fastlane.tools).
More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [GitHub](https://github.com/fastlane/fastlane/tree/master/fastlane).