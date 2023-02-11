//
//  AssertionDebug.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 10/2/23.
//

@inlinable
public func assertionDebug(
    _ message: @autoclosure () -> String = String(),
    file: StaticString = #file,
    line: UInt = #line
) {
    debugPrint(message())
//    assertionFailure(message(), file: file, line: line)
}
