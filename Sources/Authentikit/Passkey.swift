import UIKit

public class Passkey {
    
    private let clientSideKey: String
    private let userDefaults = UserDefaults.standard
    private let lastEvaluationKey = "lastEvaluationDate"
    
    init(clientSideKey: String) {
        self.clientSideKey = clientSideKey
    }
 
    public func evaluateReadiness() async throws {
        guard canEvaluateReadiness() else {
            return
        }
        let device = await UIDevice.current
        let bundleId = Bundle.main.bundleIdentifier ?? ""
        let requestHeaders: [String : String] = await [
            "app_identifier": bundleId,
            "device_os": device.systemName,
            "device_os_version": device.systemVersion,
            "origin": bundleId,
            "Content-Type": "application/json",
            "Passage-Version": "Passage Authentikit iOS \(Authentikit.PACKAGE_VERSION)",
            "X-API-KEY": clientSideKey,
        ]
        let deviceId = await device.identifierForVendor?.uuidString ?? ""
        let supportsPassekeys = Utilities.deviceOSSupportsPasskeys
        let requestBody: [String : Any] = [
            "cloud_synced": supportsPassekeys,
            "conditional_ui": supportsPassekeys,
            "cross_platform": supportsPassekeys,
            "device_id": deviceId,
            "platform": supportsPassekeys,
            "security_key": supportsPassekeys,
        ]
        let urlString = "\(Authentikit.BASE_PATH)/v1/analytics/passkey-readiness"
        print(urlString)
        print(requestHeaders)
        print(requestBody)
        guard let url = URL(string: urlString) else {
            throw PasskeyEvaluationException("Could not initialize URL.")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        for (key, value) in requestHeaders {
            request.setValue(value, forHTTPHeaderField: key)
        }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody, options: [])
            request.httpBody = jsonData
            let (_, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
                throw PasskeyEvaluationException("Network request failed.")
            }
            updateLastEvaluationDate()
            return
        } catch {
            throw PasskeyEvaluationException(error.localizedDescription)
        }
        
    }
    
    private func canEvaluateReadiness() -> Bool {
        if let lastEvaluationDate = userDefaults.object(forKey: lastEvaluationKey) as? Date {
            return Date().timeIntervalSince(lastEvaluationDate) > 24 * 60 * 60
        }
        return true
    }
    
    private func updateLastEvaluationDate() {
        userDefaults.set(Date(), forKey: lastEvaluationKey)
    }
    
    internal func clearLastEvaluationDate() {
        userDefaults.set(nil, forKey: lastEvaluationKey)
    }
    
}
