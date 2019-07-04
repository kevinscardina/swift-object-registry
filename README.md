[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# ObjectRegistry

 ObjectRegistry is a class used to store singleton instances within a project.
 It can be used for "Invertion of Control" allowing the singletons to all be stored in
 the ObjectRegistry and then retreived anywhere in the scope of the project by
 getting the singleton from the ObjectRegistry.  A singleton object can be registered in the
 ObjectRegistry based on the object type, and an optional name.
 
 ## Usage
 
 ```swift
class Object {
    //...
}

// to make Object a singleton
ObjectRegistry.register(Object())

// to get Object singleton
let object = ObjectRegistry.get(Object.self)

// to make a named instance of object in the ObjectRegistry
ObjectRegistry.register(Object(), named: "Special Object")

// to get the Object named "Special Object"
let specialObject = ObjectRegistry.get(Object.self, named: "Special Object")

// to unregister the Object
ObjectRegistry.unregister(Object.self)

// to unregister the Object named "Special Object"
ObjectRegistry.unregister(Object.self, named: "Special Object")
```

## Installing with Carthage

[Here is a great how-to on install with Carthage.](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos)  

Add this to the Cartfile

```
github "kevinscardina/swift-object-registry" ~> 1.0.0
```

The frameworks name is:

```
ObjectRegistry.framework
```
