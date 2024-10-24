![passage-authentikit-ios](https://storage.googleapis.com/passage-docs/github-md-assets/passage-authentikit-ios.png)

![SPM Version](https://img.shields.io/github/v/release/passageidentity/passage-authentikit-ios?style=flat&label=Swift%20Package)
![Cocoapods Version](https://img.shields.io/github/v/release/passageidentity/passage-authentikit-ios?style=flat&label=CocoaPods)
![Language](https://img.shields.io/badge/Swift-informational?style=flat&logo=swift&logoColor=white&color=FA7343)
![License](https://img.shields.io/github/license/passageidentity/passage-authentikit-ios.svg?style=flat) ![Static Badge](https://img.shields.io/badge/Built_by_1Password-grey?logo=1password)

## About

[Passage by 1Password](https://1password.com/product/passage) unlocks the passwordless future with a simpler, more secure passkey authentication experience. Passage handles the complexities of the [WebAuthn API](https://blog.1password.com/what-is-webauthn/), and allows you to implement passkeys with ease.

Use [Passkey Flex](https://docs.passage.id/flex) to add passkeys to an existing authentication experience.

Use [Passkey Complete](https://docs.passage.id/complete) as a standalone passwordless auth solution.

Use [Passkey Ready](https://docs.passage.id/passkey-ready) to determine if your users are ready for passkeys.

### In passage-authentikit-ios

Use passage-authentikit-ios to implement Passkey Ready in your Swift application to gather data on your users' passkey readiness.

| Product                                                                                                                                  | Compatible                                                                                             |
| ---------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| ![Passkey Flex](https://storage.googleapis.com/passage-docs/github-md-assets/passage-passkey-flex-icon.png) Passkey **Flex**             | ✖️ For Passkey Flex, check out [passage-flex-ios](https://github.com/passageidentity/passage-flex-ios) |
| ![Passkey Complete](https://storage.googleapis.com/passage-docs/github-md-assets/passage-passkey-complete-icon.png) Passkey **Complete** | ✖️ For Passkey Complete, check out [passage-swift](https://github.com/passageidentity/passage-swift)   |
| ![Passkey Ready](https://storage.googleapis.com/passage-docs/github-md-assets/passage-passkey-ready-icon.png) Passkey **Ready**          | ✅                                                                                                     |
|                                                                                                                                          |

## Getting Started

### Check Prerequisites

<p>
 You'll need a free Passage account and Organization set up via <a href="https://console.passage.id/">Passage Console</a> to get started. <br />
 <sub><a href="https://docs.passage.id/home#passage-console">Learn more about Passage Console →</a></sub>
</p>

### Install

Via Swift Package Manager - enter this url Xcode's Swift Package Manager's search bar:

```
https://github.com/passageidentity/passage-authentikit-ios
```

Via CocoaPods - add this dependency to your Podfile:

```swift
pod 'PassageAuthentikit'
```

### Import

```swift
import Authentikit
```

### Initialize

```swift
let authentikit = Authentikit(clientSideKey: clientSideKey)
```

### Go Passwordless

Find all core functions, user management details, and more implementation guidance on our [Passkey Ready Documentation](https://docs.passage.id/passkey-ready) page.

## Support & Feedback

We are here to help! Find additional docs, the best ways to get in touch with our team, and more within our [support resources](https://github.com/passageidentity/.github/blob/main/SUPPORT.md).

<br />

---

<p align="center">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://storage.googleapis.com/passage-docs/github-md-assets/passage-by-1password-dark.png">
      <source media="(prefers-color-scheme: light)" srcset="https://storage.googleapis.com/passage-docs/github-md-assets/passage-by-1password-light.png">
      <img alt="Passage by 1Password Logo" src="https://storage.googleapis.com/passage-docs/github-md-assets/passage-by-1password-light.png">
    </picture>
</p>

<p align="center">
    <sub>Passage is a product by <a href="https://1password.com/product/passage">1Password</a>, the global leader in access management solutions with nearly 150k business customers.</sub><br />
    <sub>This project is licensed under the MIT license. See the <a href="LICENSE">LICENSE</a> file for more info.</sub>
</p>
