//
//  SingletonManagerTests.swift
//  SingletonManagerTests
//
//  Created by Kevin Scardina on 6/21/19.
//  Copyright © 2019 DaVita. All rights reserved.
//

import XCTest
@testable import SingletonRegistry

protocol Protocol {}

class SingletonRegistryTests: XCTestCase {
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
        
        
        superObjectNamed.value = SingletonRegistryTests.superObjectName
        objectNamed.value = SingletonRegistryTests.objectName
        otherObjectNamed.value = SingletonRegistryTests.otherObjectName
        anotherObjectNamed.value = SingletonRegistryTests.anotherObjectName
        
        SingletonRegistry.register(superObject)
        SingletonRegistry.register(object)
        SingletonRegistry.register(otherObject)
        SingletonRegistry.register(anotherObject)
        SingletonRegistry.register(superObjectNamed, named: SingletonRegistryTests.superObjectName)
        SingletonRegistry.register(objectNamed, named: SingletonRegistryTests.objectName)
        SingletonRegistry.register(otherObjectNamed, named: SingletonRegistryTests.otherObjectName)
        SingletonRegistry.register(anotherObjectNamed, named: SingletonRegistryTests.anotherObjectName)
        SingletonRegistry.register(differentObjectSameName1, named: SingletonRegistryTests.differentObjectSameName)
        SingletonRegistry.register(differentObjectSameName2, named: SingletonRegistryTests.differentObjectSameName)
        
        XCTAssertEqual(10, SingletonRegistry.count)
        
        XCTAssertTrue(SingletonRegistry.get(SuperObject.self) === superObject)
        XCTAssertTrue(SingletonRegistry.get(Object.self) === object)
        XCTAssertTrue(SingletonRegistry.get(OtherObject.self) === otherObject)
        XCTAssertTrue(SingletonRegistry.get(AnotherObject.self) === anotherObject)
        XCTAssertTrue(SingletonRegistry.get(SuperObject.self, named: SingletonRegistryTests.superObjectName) === superObjectNamed)
        XCTAssertTrue(SingletonRegistry.get(Object.self, named: SingletonRegistryTests.objectName) === objectNamed)
        XCTAssertTrue(SingletonRegistry.get(OtherObject.self, named: SingletonRegistryTests.otherObjectName) === otherObjectNamed)
        XCTAssertTrue(SingletonRegistry.get(AnotherObject.self, named: SingletonRegistryTests.anotherObjectName) === anotherObjectNamed)
        XCTAssertTrue(SingletonRegistry.get(OtherObject.self,
                                               named: SingletonRegistryTests.differentObjectSameName) === differentObjectSameName1)
        XCTAssertTrue(SingletonRegistry.get(AnotherObject.self,
                                               named: SingletonRegistryTests.differentObjectSameName) === differentObjectSameName2)
        
        SingletonRegistry.register(superObjectChanged)
        SingletonRegistry.register(objectChanged)
        SingletonRegistry.register(otherObjectChanged)
        SingletonRegistry.register(anotherObjectChanged)
        SingletonRegistry.register(superObjectNamedChanged, named: SingletonRegistryTests.superObjectName)
        SingletonRegistry.register(objectNamedChanged, named: SingletonRegistryTests.objectName)
        SingletonRegistry.register(otherObjectNamedChanged, named: SingletonRegistryTests.otherObjectName)
        SingletonRegistry.register(anotherObjectNamedChanged, named: SingletonRegistryTests.anotherObjectName)
        SingletonRegistry.register(differentObjectSameName1Changed, named: SingletonRegistryTests.differentObjectSameName)
        SingletonRegistry.register(differentObjectSameName2Changed, named: SingletonRegistryTests.differentObjectSameName)
        
        XCTAssertEqual(10, SingletonRegistry.count)
        
        XCTAssertTrue(SingletonRegistry.get(SuperObject.self) === superObjectChanged)
        XCTAssertTrue(SingletonRegistry.get(Object.self) === objectChanged)
        XCTAssertTrue(SingletonRegistry.get(OtherObject.self) === otherObjectChanged)
        XCTAssertTrue(SingletonRegistry.get(AnotherObject.self) === anotherObjectChanged)
        XCTAssertTrue(SingletonRegistry.get(SuperObject.self, named: SingletonRegistryTests.superObjectName) === superObjectNamedChanged)
        XCTAssertTrue(SingletonRegistry.get(Object.self, named: SingletonRegistryTests.objectName) === objectNamedChanged)
        XCTAssertTrue(SingletonRegistry.get(OtherObject.self, named: SingletonRegistryTests.otherObjectName) === otherObjectNamedChanged)
        XCTAssertTrue(SingletonRegistry.get(AnotherObject.self, named: SingletonRegistryTests.anotherObjectName) === anotherObjectNamedChanged)
        XCTAssertTrue(SingletonRegistry.get(OtherObject.self,
                                               named: SingletonRegistryTests.differentObjectSameName) === differentObjectSameName1Changed)
        XCTAssertTrue(SingletonRegistry.get(AnotherObject.self,
                                               named: SingletonRegistryTests.differentObjectSameName) === differentObjectSameName2Changed)
        
        SingletonRegistry.unregister(SuperObject.self)
        XCTAssertNil(SingletonRegistry.get(SuperObject.self))
        SingletonRegistry.unregister(Object.self)
        XCTAssertNil(SingletonRegistry.get(Object.self))
        SingletonRegistry.unregister(OtherObject.self)
        XCTAssertNil(SingletonRegistry.get(OtherObject.self))
        SingletonRegistry.unregister(AnotherObject.self)
        XCTAssertNil(SingletonRegistry.get(AnotherObject.self))
        SingletonRegistry.unregister(SuperObject.self, named: SingletonRegistryTests.superObjectName)
        XCTAssertNil(SingletonRegistry.get(SuperObject.self, named: SingletonRegistryTests.superObjectName))
        SingletonRegistry.unregister(Object.self, named: SingletonRegistryTests.objectName)
        XCTAssertNil(SingletonRegistry.get(Object.self, named: SingletonRegistryTests.objectName))
        SingletonRegistry.unregister(OtherObject.self, named: SingletonRegistryTests.otherObjectName)
        XCTAssertNil(SingletonRegistry.get(OtherObject.self, named: SingletonRegistryTests.otherObjectName))
        SingletonRegistry.unregister(AnotherObject.self, named: SingletonRegistryTests.anotherObjectName)
        XCTAssertNil(SingletonRegistry.get(AnotherObject.self, named: SingletonRegistryTests.anotherObjectName))
        SingletonRegistry.unregister(OtherObject.self, named: SingletonRegistryTests.differentObjectSameName)
        XCTAssertNil(SingletonRegistry.get(OtherObject.self, named: SingletonRegistryTests.differentObjectSameName))
        SingletonRegistry.unregister(AnotherObject.self, named: SingletonRegistryTests.differentObjectSameName)
        XCTAssertNil(SingletonRegistry.get(AnotherObject.self, named: SingletonRegistryTests.differentObjectSameName))
        SingletonRegistry.unregister(AnotherObject.self, named: SingletonRegistryTests.differentObjectSameName)
        XCTAssertNil(SingletonRegistry.get(AnotherObject.self, named: SingletonRegistryTests.differentObjectSameName))
        
        XCTAssertEqual(0, SingletonRegistry.count)
    }
}

extension SingletonRegistryTests {
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
        var value = SingletonRegistryTests.superObjectValue
    }
    
    class Object: SuperObject {
        override init() {
            super.init()
            value = SingletonRegistryTests.objectValue
        }
    }
    
    class OtherObject: Protocol {
        var value = SingletonRegistryTests.otherObjectValue
    }
    
    class AnotherObject {
        var value = SingletonRegistryTests.anotherObjectValue
    }
}
