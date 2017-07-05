//
//  CreateUserViewControllerTests.swift
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

class CreateUserViewControllerTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: CreateUserViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        window = UIWindow()
        setupCreateUserViewController()
    }
    
    override func tearDown()
    {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupCreateUserViewController()
    {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "CreateUserViewController") as! CreateUserViewController
    }
    
    func loadView()
    {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    // MARK: Tests
    
    func testShouldCallInteractorWhenButtonTapped(){
        
        //Given 
        let spy = InteractorSpy()
        sut.interactor = spy
        
        //When
        //Button is tapped
        sut.didPressSave(self)
        
        //Then 
        XCTAssertTrue(spy.saveUserWasCalled, "Save user has to be called after the user taps on the save button")
        
        
    }
}

class InteractorSpy:CreateUserBusinessLogic{
    
    var saveUserWasCalled = false
    
    func saveUser() {
        saveUserWasCalled = true
    }
    
}