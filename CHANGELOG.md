# Changelog

## v1.4.3 - 2026-06-03

* Fixed `unlock(...)`, `lock(...)` and `prepareEndRental(...)` not invoking
  their `onResult` handler when an operation completed.
* Linka locks: `unlock`/`lock`/`prepareEndRental` and `finalizeLock` now
  resolve the lock correctly. Previously a lock-name/lock-id mismatch could
  make a Linka lock be reported as unrecognized.
* Linka locks: failed operations now report the failure to `onResult` instead
  of never completing, and successful operations complete immediately.

## v1.4.2 - 2026-06-02

* Fix a crash (`EXC_BAD_ACCESS` during `initializeSDK`) caused by
  ComposableArchitecture and swift-dependencies being embedded twice in the
  `DonkeyLockKit.xcframework` binary. The duplicated ObjC classes registered
  at two addresses, so an internal cast could hit the wrong copy. The
  framework now embeds each dependency exactly once.

## v1.4.1 - 2026-05-28

* CocoaPods: `pod 'DonkeyLockKit'` now installs a prebuilt xcframework
  instead of source files. There are no transitive pod dependencies; the
  consumer Podfile line is unchanged.

## v1.4.0 - 2026-05-18

* Added support for Linka locks
* Internal dependency updates

## v1.1.1 - 2022-07-25

* Expose methods for setting `LogLevel` and `ServerEnvironment` individually

## v1.1.0 - 2021-11-10

* Implemented waiting for `CBCentralManager` to transition into a known state during `initializeSDK`

## v1.0.2 - 2021-11-01

* Added `BLEError.unknownManagerState` case

## v1.0.1 - 2021-11-01

* Improved logging for `CBManagerState`

## v1.0.0 - 2021-09-15

### API Changes

* (Renamed) `LockKit.initializeSDK(apiToken:onResult:)` -> 
`LockKit.initializeSDK(sdkToken:onResult:)`
* Fixed an issue where eKey wouldn't be properly cleared on `LockKit.finalizeLock`
* Fixed an issue where calling `LockKit.finalizeLock` during an ongoing lock action would
  prevent the ongoing action result from being delivered

## v0.5.4 - 2021-08-20

* Fix an internal bluetooth manager wouldn't be properly initialized on
`LockKit.initializeSDK(apiToken:)` call.

## v0.5.3 - 2021-08-20

* Improve edge-case error reporting by adding `LockError.unknown(message: String)` case.

## v0.5.2 - 2021-08-19

* Fix "Unauthorized Bluetooth use" error reporting

## v0.5.1 - 2021-08-13

* Change the minimum iOS requirement to 11.0

## v0.5.0 - 2021-08-03

### API Changes

* `StatusUpdate.waitingForUserAction` is not called when unlocking. This was
  here to support old lock hardware that is no longer in use.
* Improved `LockKit.initializeSDK(apiToken:)` by using a full `onResult` handler
  instead of just an error handler.

## v0.4.0 - 2021-06-30

### API Changes

* (Renamed) `LockKit.endRental(lockName:onStatusChanged:onResult:)` ->
  `LockKit.prepareEndRental(lockName:onStatusChanged:onResult:)` to clearly
  indicate that the method does not actually end a rental.
* (Removed) `LockError.invalidCommand` which at this time wasn't reported at all.

## v0.3.0 - 2021-06-22

### API Changes

* (Renamed) `LockKit.initializeLock(lockName:eKey:commands:)`
  -> `LockKit.initializeLock(lockName:eKey:passkey:)`. It now takes a single
  string as `passkey`, instead of a list of strings, and manages commands
  parsing internally.
* (Renamed) `LockKit` namespace was removed from the following enums and structs:
  - `ServerEnvironment`
  - `LogLevel`
  - `StatusUpdate`
  - `InitializeSDKError`
  - `InitializeLockError`
  - `FinalizeLockError`
  - `LockError`

## v0.2.0 - 2021-06-11

* Require the first unlock to be performed while online.
* Add `LockKitConfiguration.environment` to select between live and test
  environment.
* Ensure that Donkey Lock Kit storage is properly cleared in the event
  of the host app reinstallation.

## v0.1.3 - 2021-05-31

* Fixed a memory leak occurring when calling lock/unlock/endRental
* Fixed a crash occurring after finalizing the lock

## v0.1.2 - 2021-05-19

* Test release to verify automation pipeline

## v0.1.1 - 2021-05-17

* Add more verbose debug logging


## v0.1.0 - 2021-05-14

* first beta release of the Donkey Lock Kit
