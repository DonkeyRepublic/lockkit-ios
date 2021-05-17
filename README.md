# Donkey Lock Kit

[![CocoaPods compatible](https://img.shields.io/cocoapods/v/DonkeyLockKit.svg)](https://img.shields.io/cocoapods/v/DonkeyLockKit.svg)
[![CocoaPods platforms](https://img.shields.io/cocoapods/p/DonkeyLockKit.svg)](https://img.shields.io/cocoapods/p/DonkeyLockKit.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-success)](https://github.com/Carthage/Carthage)
[![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-success)](https://swift.org/package-manager/)


Donkey Lock Kit is a Swift iOS framework that enables interacting with BLE-enabled locks that [Donkey Republic](https://donkey.bike) vehicles are equipped with.

# Disclaimer

This is the beta version of the framework. It is intended for 3rd parties to evaluate the APIs
and test the integration with Donkey Republic locks. It is not suitable for integration in production environments.
The APIs contained in this releases may change before the official release.


## Prerequisites

Donkey Lock Kit APIs are available after you authenticated with the API token received from Donkey Republic. Contact your representative at Donkey Republic to obtain the API token.

### System requirements

Xcode 12.0 or greater is required to use binaries in XCFramework format. The deployment target of Donkey Lock Kit is iOS 11.0. The Donkey Lock Kit has been tested with Swift 5.3.


## Installation

Donkey Lock Kit is available as a multiplatform framework in the XCFramework format. It does not contain any 3rd party dependencies. It is supported by multiple package managers, but also very easy to integrate manually.

### Manual integration

In the Xcode project, go to your app target's general settings, and scroll down to "Frameworks, Libraries and Embedded Content" section. Drag `DonkeyLockKit.xcframework` to the list. Leave "Embed & Sign" setting as is. You should now be able to use DonkeyLockKit in your project. Verify it by importing DonkeyLockKit in your source code:

    import DonkeyLockKit

At this point the app should compile and link against Donkey Lock Kit, and you would be able to start working with it.

### Swift Package Manager

* Follow the Apple documentation on how to add SPM package to your project.
* Paste the Donkey Lock Kit package URL, https://github.com/DonkeyRepublic/lockkit-ios, into the Choose repository package search bar.
* Use version-based Package Requirements, and set the value to the latest version of the framework.

### CocoaPods

    pod 'DonkeyLockKit'

### Carthage

We support Carthage in platform-independent XCFrameworks mode, which is supported starting from Carthage 0.38.0 and requires Xcode version 12.0 or greater. Add this line to your Cartfile:

    binary "https://developer.donkey.bike/tomp/lockkit/releases/ios/DonkeyLockKit.json"

Then use `carthage update` to pull in Donkey Lock Kit.


## Getting started

The complete API reference is available at https://developer.donkey.bike/tomp/lockkit/docs/ios.

The Donkey Lock Kit framework exposes the `LockKit` class, that handles all the interaction with Donkey Republic bike locks. In your integration you will be using `LockKit.shared` singleton.

### Initialization

In order to interact with bike locks, you must intialize the SDK with the API token provided to you by Donkey Republic:

    LockKit.shared.initializeSDK(apiToken: "MyDonkeyToken", errorHandler: { (error) in
        print("Failed to initialize DonkeyLockKit: \(error)")
    })

This call returns immediately. In case you provided an invalid token, the `errorHandler` would be called with a relevant error. Otherwise, you're authorized to access locks API.

### Unlocking and locking

Donkey Lock Kit provides simple, completion-handler-based API for operating bike locks. Consult the API reference for the relevant documentation of:

* `LockKit.initializeLock(lockName:eKey:commands:)`
* `LockKit.unlock(lockName:onStatusChanged:onResult:)`
* `LockKit.lock(lockName:onStatusChanged:onResult:)`
* `LockKit.endRental(lockName:onStatusChanged:onResult:)`
* `LockKit.finalizeLock(lockName:)`