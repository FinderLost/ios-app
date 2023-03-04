//
//  AssertionDebug.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 10/2/23.
//

///
/// Prints a message and raises a failure when the code reaches the assertionDebug() function.
///
/// - Parameters:
///     - message: The message to print before raising a failure.
///     - file: The file name where the assertionDebug() function was called. Default is the file name where this function is defined.
///     - line: The line number where the assertionDebug() function was called. Default is the line number where this function is called.
public func assertionDebug(
    _ message: @autoclosure () -> String = String(),
    file: StaticString = #file,
    line: UInt = #line
) {
    assertionFailure(message(), file: file, line: line)
}
