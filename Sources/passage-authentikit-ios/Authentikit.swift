import UIKit

public class Authentikit {
    
    public let passkey: Passkey
    
    internal static let BASE_PATH = "https://auth-uat.passage.dev"
    
    public init(organizationId: String) {
        self.passkey = Passkey(organizationId: organizationId)
    }
    
}
