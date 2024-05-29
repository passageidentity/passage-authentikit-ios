<img src="https://storage.googleapis.com/passage-docs/passage-logo-gradient.svg" alt="Passage logo" style="width:250px;"/>

## About

This package contains the code required to evaluate the passkey readiness of a user's iOS device. Results gathered by this package can be viewed at the [Passkey Readiness Tool page](https://console-uat.passage.dev/passkey-readiness) in Passage Console.

## Usage

### Installation

You can import Authentikit via the Swift Package Manager. Simply search SPM for this url:
```
https://github.com/passageidentity/passage-authentikit-ios
```

Or you can import it using CocoaPods by add this pod to your app's Podfile:
```
pod 'PassageAuthentikit'
```

### Example
And you can use it like this:
```swift
import Authentikit

let authentikit = Authentikit(clientSideKey: clientSideKey)
try await authentikit.passkey.evaluateReadiness()
```
<br>
