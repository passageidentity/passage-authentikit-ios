import UIKit

public class Authentikit {
    
    public let passkey: Passkey
    
    internal static let BASE_PATH = "https://auth-uat.passage.dev"
    internal static let PACKAGE_VERSION = "0.1.0"
    
    public init(clientSideKey: String) {
        self.passkey = Passkey(clientSideKey: clientSideKey)
    }
    
}
