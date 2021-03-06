//
//  CreateUserWorkerTests.swift
//  POCClean
//
//  Created by Alejandro Rodriguez on 7/5/17.
//  Copyright (c) 2017 Alejandro Rodriguez. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import POCClean
import XCTest

class CreateUserWorkerTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: CreateUserWorker!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupCreateUserWorker()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupCreateUserWorker()
    {
        sut = CreateUserWorker(store: UsersMemStore())
    }
    
    // MARK: Test doubles
    
    // MARK: Tests
    
    
    func testSaveUserShouldSave(){
        
        //Given
        let spy = sut.usersStore as! UsersMemStore
        
        //When
        let request = CreateUser.User.Request(firstName: "Pedro", lastName: "Perez")
        sut.saveUser(request: request) { _ in
            
        }
        
        //Then
        XCTAssertFalse(spy.users.isEmpty, "Users array should not be empty")
    }
    
    func testSaveUsersShouldReturn(){
        
        //Given
        //let spy = sut.usersStore as! UsersMemStoreSpy
        
        //When
        let request = CreateUser.User.Request(firstName: "Pedro", lastName: "Perez")
        let exp = expectation(description: "Wait for save users completion handler to be called")
        sut.saveUser(request: request) { _ in
            exp.fulfill()
        }
        
        
        
        //Then
        waitForExpectations(timeout: (1.1)) {_ in
            XCTAssertTrue(true, "saveUser completion handler has to be called")
        }
    }
}


class UsersMemStoreSpy:UsersMemStore{
    
    
}
