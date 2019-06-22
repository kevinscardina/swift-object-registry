# SingletonRegistry

 SingletonRegistry is a class used to store singleton instances within a project.
 It can be used for "Invertion of Control" allowing the singletons to all be stored in
 the SingletonRegistry singleton and then retreived anywhere in the scope of the project by
 getting the singleton from the manager.  A singleton object can be registered in the
 SingletonRegistry based on the object type, and an optional name.
 
 ## Example
 
 ```swift
class Object {
    //...
}

// to make Object a singleton
SingletonRegistry.register(Object())

// to get Object singleton
let object = SingletonRegistry.get(Object.self)

// to make a named instance of object in the registry
SingletonRegistry.register(Object(), named: "Special Object")

// to get the Object named "Special Object"
let specialObject = SingletonRegistry.get(Object.self, named: "Special Object")

// to unregister the Object
SingletonRegistry.unregister(Object.self)

// to unregister the Object named "Special Object"
SingletonRegistry.unregister(Object.self, named: "Special Object")
```
