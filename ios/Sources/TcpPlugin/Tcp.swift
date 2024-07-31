import Foundation

@objc public class Tcp: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
