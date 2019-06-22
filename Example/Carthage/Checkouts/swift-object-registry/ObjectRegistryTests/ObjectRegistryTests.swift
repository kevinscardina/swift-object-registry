//
//  SingletonManagerTests.swift
//  SingletonManagerTests
//
//  Created by Kevin Scardina on 6/21/19.
//  Copyright © 2019 DaVita. All rights reserved.
//

import XCTest
@testable import ObjectRegistry

protocol Protocol {}

class ObjectRegistryTests: XCTestCase {
    func testSingletonManager() {
        let superObject = SuperObject()
        let object = Object()
        let otherObject = OtherObject()
        let anotherObject = AnotherObject()
        let superObjectNamed = SuperObject()
        let objectNamed = Object()
        let otherObjectNamed = OtherObject()
        let anotherObjectNamed = AnotherObject()
        let differentObjectSameName1 = OtherObject()
        let differentObjectSameName2 = AnotherObject()
        let superObjectChanged = SuperObject()
        let objectChanged = Object()
        let otherObjectChanged = OtherObject()
        let anotherObjectChanged = AnotherObject()
        let superObjectNamedChanged = SuperObject()
        let objectNamedChanged = Object()
        let otherObjectNamedChanged = OtherObject()
        let anotherObjectNamedChanged = AnotherObject()
        let differentObjectSameName1Changed = OtherObject()
        let differentObjectSameName2Changed = AnotherObject()
        
        
        superObjectNamed.value = ObjectRegistryTests.superObjectName
        objectNamed.value = ObjectRegistryTests.objectName
        otherObjectNamed.value = ObjectRegistryTests.otherObjectName
        anotherObjectNamed.value = ObjectRegistryTests.anotherObjectName
        
        ObjectRegistry.register(superObject)
        ObjectRegistry.register(object)
        ObjectRegistry.register(otherObject)
        ObjectRegistry.register(anotherObject)
        ObjectRegistry.register(superObjectNamed, named: ObjectRegistryTests.superObjectName)
        ObjectRegistry.register(objectNamed, named: ObjectRegistryTests.objectName)
        ObjectRegistry.register(otherObjectNamed, named: ObjectRegistryTests.otherObjectName)
        ObjectRegistry.register(anotherObjectNamed, named: ObjectRegistryTests.anotherObjectName)
        ObjectRegistry.register(differentObjectSameName1, named: ObjectRegistryTests.differentObjectSameName)
        ObjectRegistry.register(differentObjectSameName2, named: ObjectRegistryTests.differentObjectSameName)
        
        XCTAssertEqual(10, ObjectRegistry.count)
        
        XCTAssertTrue(ObjectRegistry.get(SuperObject.self) === superObject)
        XCTAssertTrue(ObjectRegistry.get(Object.self) === object)
        XCTAssertTrue(ObjectRegistry.get(OtherObject.self) === otherObject)
        XCTAssertTrue(ObjectRegistry.get(AnotherObject.self) === anotherObject)
        XCTAssertTrue(ObjectRegistry.get(SuperObject.self, named: ObjectRegistryTests.superObjectName) === superObjectNamed)
        XCTAssertTrue(ObjectRegistry.get(Object.self, named: ObjectRegistryTests.objectName) === objectNamed)
        XCTAssertTrue(ObjectRegistry.get(OtherObject.self, named: ObjectRegistryTests.otherObjectName) === otherObjectNamed)
        XCTAssertTrue(ObjectRegistry.get(AnotherObject.self, named: ObjectRegistryTests.anotherObjectName) === anotherObjectNamed)
        XCTAssertTrue(ObjectRegistry.get(OtherObject.self,
                                               named: ObjectRegistryTests.differentObjectSameName) === differentObjectSameName1)
        XCTAssertTrue(ObjectRegistry.get(AnotherObject.self,
                                               named: ObjectRegistryTests.differentObjectSameName) === differentObjectSameName2)
        
        ObjectRegistry.register(superObjectChanged)
        ObjectRegistry.register(objectChanged)
        ObjectRegistry.register(otherObjectChanged)
        ObjectRegistry.register(anotherObjectChanged)
        ObjectRegistry.register(superObjectNamedChanged, named: ObjectRegistryTests.superObjectName)
        ObjectRegistry.register(objectNamedChanged, named: ObjectRegistryTests.objectName)
        ObjectRegistry.register(otherObjectNamedChanged, named: ObjectRegistryTests.otherObjectName)
        ObjectRegistry.register(anotherObjectNamedChanged, named: ObjectRegistryTests.anotherObjectName)
        ObjectRegistry.register(differentObjectSameName1Changed, named: ObjectRegistryTests.differentObjectSameName)
        ObjectRegistry.register(differentObjectSameName2Changed, named: ObjectRegistryTests.differentObjectSameName)
        
        XCTAssertEqual(10, ObjectRegistry.count)
        
        XCTAssertTrue(ObjectRegistry.get(SuperObject.self) === superObjectChanged)
        XCTAssertTrue(ObjectRegistry.get(Object.self) === objectChanged)
        XCTAssertTrue(ObjectRegistry.get(OtherObject.self) === otherObjectChanged)
        XCTAssertTrue(ObjectRegistry.get(AnotherObject.self) === anotherObjectChanged)
        XCTAssertTrue(ObjectRegistry.get(SuperObject.self, named: ObjectRegistryTests.superObjectName) === superObjectNamedChanged)
        XCTAssertTrue(ObjectRegistry.get(Object.self, named: ObjectRegistryTests.objectName) === objectNamedChanged)
        XCTAssertTrue(ObjectRegistry.get(OtherObject.self, named: ObjectRegistryTests.otherObjectName) === otherObjectNamedChanged)
        XCTAssertTrue(ObjectRegistry.get(AnotherObject.self, named: ObjectRegistryTests.anotherObjectName) === anotherObjectNamedChanged)
        XCTAssertTrue(ObjectRegistry.get(OtherObject.self,
                                               named: ObjectRegistryTests.differentObjectSameName) === differentObjectSameName1Changed)
        XCTAssertTrue(ObjectRegistry.get(AnotherObject.self,
                                               named: ObjectRegistryTests.differentObjectSameName) === differentObjectSameName2Changed)
        
        ObjectRegistry.unregister(SuperObject.self)
        XCTAssertNil(ObjectRegistry.get(SuperObject.self))
        ObjectRegistry.unregister(Object.self)
        XCTAssertNil(ObjectRegistry.get(Object.self))
        ObjectRegistry.unregister(OtherObject.self)
        XCTAssertNil(ObjectRegistry.get(OtherObject.self))
        ObjectRegistry.unregister(AnotherObject.self)
        XCTAssertNil(ObjectRegistry.get(AnotherObject.self))
        ObjectRegistry.unregister(SuperObject.self, named: ObjectRegistryTests.superObjectName)
        XCTAssertNil(ObjectRegistry.get(SuperObject.self, named: ObjectRegistryTests.superObjectName))
        ObjectRegistry.unregister(Object.self, named: ObjectRegistryTests.objectName)
        XCTAssertNil(ObjectRegistry.get(Object.self, named: ObjectRegistryTests.objectName))
        ObjectRegistry.unregister(OtherObject.self, named: ObjectRegistryTests.otherObjectName)
        XCTAssertNil(ObjectRegistry.get(OtherObject.self, named: ObjectRegistryTests.otherObjectName))
        ObjectRegistry.unregister(AnotherObject.self, named: ObjectRegistryTests.anotherObjectName)
        XCTAssertNil(ObjectRegistry.get(AnotherObject.self, named: ObjectRegistryTests.anotherObjectName))
        ObjectRegistry.unregister(OtherObject.self, named: ObjectRegistryTests.differentObjectSameName)
        XCTAssertNil(ObjectRegistry.get(OtherObject.self, named: ObjectRegistryTests.differentObjectSameName))
        ObjectRegistry.unregister(AnotherObject.self, named: ObjectRegistryTests.differentObjectSameName)
        XCTAssertNil(ObjectRegistry.get(AnotherObject.self, named: ObjectRegistryTests.differentObjectSameName))
        ObjectRegistry.unregister(AnotherObject.self, named: ObjectRegistryTests.differentObjectSameName)
        XCTAssertNil(ObjectRegistry.get(AnotherObject.self, named: ObjectRegistryTests.differentObjectSameName))
        
        XCTAssertEqual(0, ObjectRegistry.count)
    }
}

extension ObjectRegistryTests {
    static let superObjectValue = "SuperObject"
    static let objectValue = "Object"
    static let otherObjectValue = "OtherObject"
    static let anotherObjectValue = "AnotherObject"
    static let superObjectName = "SuperObjectName"
    static let objectName = "ObjectName"
    static let otherObjectName = "OtherObjectName"
    static let anotherObjectName = "AnotherObjectName"
    static let differentObjectSameName = "SameNameObject"
    
    class SuperObject: Protocol {
        var value = ObjectRegistryTests.superObjectValue
    }
    
    class Object: SuperObject {
        override init() {
            super.init()
            value = ObjectRegistryTests.objectValue
        }
    }
    
    class OtherObject: Protocol {
        var value = ObjectRegistryTests.otherObjectValue
    }
    
    class AnotherObject {
        var value = ObjectRegistryTests.anotherObjectValue
    }
}
