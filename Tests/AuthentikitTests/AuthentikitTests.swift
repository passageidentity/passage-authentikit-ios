import XCTest
@testable import Authentikit

final class AuthentikitTests: XCTestCase {
    
    static let VALID_KEY = "q2sff2MGjWzSOfMAW9fXODoi"
    static let INVALID_KEY = "INVALID_KEY"
    
    override class func setUp() {
        super.setUp()
        Authentikit.BASE_PATH = "https://auth-uat.passage.dev"
    }
    
    override class func tearDown() {
        super.tearDown()
        let authentikit = Authentikit(clientSideKey: AuthentikitTests.VALID_KEY)
        authentikit.passkey.clearLastEvaluationDate()
    }
    
    func testValidClientKeySucceeds() async throws {
        let authentikit = Authentikit(clientSideKey: AuthentikitTests.VALID_KEY)
        try await authentikit.passkey.evaluateReadiness()
        authentikit.passkey.clearLastEvaluationDate()
    }
    
    func testInvalidClientKeyFails() async {
        let authentikit = Authentikit(clientSideKey: AuthentikitTests.INVALID_KEY)
        do {
            try await authentikit.passkey.evaluateReadiness()
            XCTFail("evaluateReadiness should fail with PasskeyEvaluationException")
        } catch {
            XCTAssertTrue(error is PasskeyEvaluationException)
        }
    }
}
