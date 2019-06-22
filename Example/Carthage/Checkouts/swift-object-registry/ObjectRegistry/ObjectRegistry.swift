//  Copyright © 2019 DaVita. All rights reserved.
//

import Foundation

/// ObjectRegistry is a class used to store singleton instances within a project.
/// It can be used for "Invertion of Control" allowing the singletons to all be stored in
/// the ObjectRegistry singleton and then retreived anywhere in the scope of the project by
/// getting the singleton from the manager.  A singleton object can be registered in the
/// ObjectRegistry based on the object type, and an optional name.
public class ObjectRegistry {
    // MARK: - private
    private init() {}
    private var registry = [(String?, AnyObject)]()
}

extension ObjectRegistry {
    // MARK: - internal properties
    /// Count is the number of objects registered with the registry
    var count: Int { return registry.count }
    
    // MARK: - internal functions
    /// Registers with the registry, once registered the same instance can be retreived by requesting the type
    /// - parameters:
    ///     - object: the object one would like to register
    ///     - named: a value to register with the object for Multiton option, nil will return the default instance
    func register<T: AnyObject>(_ object: T, named: String?) {
        guard let idx = registry.firstIndex(where: { named == $0.0 && type(of: $0.1) is T.Type }) else {
            print("added a value")
            registry.append((named, object))
            return
        }
        print("changed a value")
        registry[idx] = (named, object)
    }
    
    /// Unregisters with the registry based on type
    /// - parameters:
    ///     - ofType: type the object one would like to unregister
    ///     - named: an optional value to unregister a named object
    func unregister<T: AnyObject>(_ ofType: T.Type, named: String?) {
        guard let idx = registry.firstIndex(where: { named == $0.0 && type(of: $0.1) == ofType }) else {
            return
        }
        registry.remove(at: idx)
    }
    
    /// Unregisters with the registry
    /// - parameters:
    ///     - ofType: type the object one would like to get the single instance of
    ///     - named: what the object to get is named if object was registred with a name
    func get<T: AnyObject>(_ ofType: T.Type, named: String?) -> T? {
        return registry.filter { named == $0.0 && type(of: $0.1) == ofType }.last?.1 as? T
    }
}

public extension ObjectRegistry {
    // MARK: - internal static properties
    /// singleton instance of the registry used by the static functions
    static let shared = ObjectRegistry()
    
    // MARK: - public static properties
    /// Count is the number of objects registered with the registry
    public static var count: Int {
        return ObjectRegistry.shared.count
    }
    
    // MARK: - public static functions
    /// Registers with the registry, once registered the same instance can be retreived by requesting the type
    /// - parameters:
    ///     - object: the object one would like to register
    ///     - named: an optional value to register with the object for Multiton option
    public static func register<T: AnyObject>(_ object: T, named: String? = nil) {
        ObjectRegistry.shared.register(object, named: named)
    }
    
    /// Unregisters with the registry based on type
    /// - parameters:
    ///     - ofType: type the object one would like to unregister
    ///     - named: an optional value to unregister a named object
    public static func unregister<T: AnyObject>(_ ofType: T.Type, named: String? = nil) {
        ObjectRegistry.shared.unregister(ofType, named: named)
    }
    
    /// Unregisters with the registry
    /// - parameters:
    ///     - ofType: type the object one would like to get the single instance of
    ///     - named: what the object to get is named if object was registred with a name
    public static func get<T: AnyObject>(_ ofType: T.Type, named: String? = nil) -> T? {
        return ObjectRegistry.shared.get(ofType, named: named)
    }
}
