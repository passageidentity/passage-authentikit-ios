import AuthenticationServices

internal struct Utilities {
    
    internal static var deviceOSSupportsPasskeys: Bool {
        #if os(iOS)
        if #available(iOS 16, *) {
            return true
        } else {
            return false
        }
        #elseif os(macOS)
        if #available(macOS 12.0, *) {
            return true
        } else {
            return false
        }
        #elseif os(tvOS)
        if #available(tvOS 16.0, *) {
            return true
        } else {
            return false
        }
        #elseif os(visionOS)
        return true
        #else
        return false
        #endif
    }
    
}
