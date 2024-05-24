import UIKit

public class Authentikit {
    
    public let passkey: Passkey
    
    internal static var BASE_PATH = "https://auth.passage.id"
    internal static let PACKAGE_VERSION = "0.1.0"
    
    public init(clientSideKey: String) {
        self.passkey = Passkey(clientSideKey: clientSideKey)
    }
    
}
