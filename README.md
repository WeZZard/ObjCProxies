[![Build Status](https://travis-ci.com/WeZZard/ObjCProxies.svg?branch=master)](https://travis-ci.com/WeZZard/ObjCProxies)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

[中文](./使用說明.md)

Proxy objects with strong/weak ownership to the target. Implemented with
Objective-C and available both in Objective-C and Swift.

## Usage

```swift
import ObjCProxies

let object = NSObject()

let storngProxy = ObjCStrongProxy(target: object)

let weakProxy = ObjCWeakProxy(target: object)
```

## License

MIT
