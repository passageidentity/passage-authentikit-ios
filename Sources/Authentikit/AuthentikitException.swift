import Foundation

public class AuthentikitException: Error, CustomStringConvertible {
    public var message: String

    public init(_ message: String) {
        self.message = message
    }
    
    public var description: String {
        return message
    }
}

public class PasskeyException: AuthentikitException {}

public class PasskeyEvaluationException: PasskeyException {}
