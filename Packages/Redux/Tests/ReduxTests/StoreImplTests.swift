//
//  StoreImplTests.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/3/23.
//

import Redux

import XCTest

final class StoreImplTests: XCTestCase {
    var initialState: ReduxMock.State!
    var store: Store<ReduxMock>!

    override func setUp() {
        super.setUp()
        initialState = .init(module: .idle)
        store = Store<ReduxMock>(
            initialState: initialState,
            reducer: ReduxMock.reduce,
            context: ReduxMock.context
        )
    }

    func testInitialState() {
        XCTAssertEqual(store.state, initialState)
    }

    func testDispatch() {
        XCTAssertEqual(store.state.module, .idle)

        store.dispatch(.module(.getUUID))
        XCTAssertEqual(store.state.module, .loading)
    }

    func testHandler() {
        store.use(ModuleMock.HandlerImpl())

        XCTAssertEqual(store.state.module, .idle)

        store.dispatch(.module(.getUUID))
        XCTAssertNotEqual(store.state.module, .idle)
    }
}
