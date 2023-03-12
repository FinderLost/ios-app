//
//  TriggerAssertionFailure.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 10/2/23.
//

/// Global variable that holds the Swift `assertionFailure` function.
public var triggerAssertionFailure = Swift.assertionFailure

/// Custom implementation of `assertionFailure` that calls the global `triggerAssertionFailure` function.
///
/// - Parameters:
///   - message: An optional message to include in the assertion failure. Defaults to an empty string.
///   - file: The file name where the assertion occurred. Defaults to the current file.
///   - line: The line number where the assertion occurred. Defaults to the current line.
public func triggerAssertionFailure(
    _ message: @autoclosure () -> String = String(),
    file: StaticString = #file,
    line: UInt = #line
) {
    triggerAssertionFailure(message(), file, line)
}
