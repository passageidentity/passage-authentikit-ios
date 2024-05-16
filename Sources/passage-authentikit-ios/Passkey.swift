import UIKit

public class Passkey {
    
    private let organizationId: String
    private let userDefaults = UserDefaults.standard
    private let lastEvaluationKey = "lastEvaluationDate"
    
    init(organizationId: String) {
        self.organizationId = organizationId
    }
 
    public func evaluateReadiness() {
        guard canEvaluateReadiness() else {
            print("❌ Evaluate readiness can only be called once in 24 hours.")
            return
        }
        let device = UIDevice.current
        let deviceId = device.identifierForVendor?.uuidString ?? ""
        let supportsPassekeys = Utilities.deviceOSSupportsPasskeys
        let requestHeaders: [String : String] = [
            "app_identifier": Bundle.main.bundleIdentifier ?? "",
            "device_os": device.systemName,
            "device_os_version": device.systemVersion,
            "Content-Type": "application/json"
        ]
        let requestBody: [String : Any] = [
            "device_id": deviceId,
            "security_key": supportsPassekeys,
            "platform": supportsPassekeys,
            "cloud_synced": supportsPassekeys,
            "cross_platform": supportsPassekeys,
            "conditional_ui": supportsPassekeys,
        ]
        let urlString = "\(Authentikit.BASE_PATH)/v1/organizations/\(organizationId)/analytics/passkey-readiness"
        guard let url = URL(string: urlString) else {
            print("❌ Failed evaluate passkey readiness.")
            return
        }
        Task {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            for (key, value) in requestHeaders {
                request.setValue(value, forHTTPHeaderField: key)
            }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: requestBody, options: [])
                request.httpBody = jsonData
                let (data, response) = try await URLSession.shared.data(for: request)
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode)
                else {
                    print("❌ Failed evaluate passkey readiness.")
                    return
                }
                updateLastEvaluationDate()
                print("✅ Successfully evaluated passkey readiness.")
            } catch {
                print("❌ Failed evaluate passkey readiness.")
            }
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
    
}
