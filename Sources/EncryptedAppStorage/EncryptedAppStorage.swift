import SwiftUI

@propertyWrapper
public struct EncryptedAppStorage<Value: Codable>: DynamicProperty {
    let key: String
    @State private var value: Value?

    init(wrappedValue: Value? = nil, _ key: String) {
        self.key = key
        // Set default value
        var initialValue = wrappedValue

        // Retrieve value from Keychain
        if let data = KeyChain.loadData(with: key),
           let decoded = try? JSONDecoder().decode(Value.self, from: data) {
            // Assign value from keychain
            initialValue = decoded
        } else if let jsonData = try? JSONEncoder().encode(value) {
            // If there is no value in KeyChain associated with this key,
            // save the default value data to KeyChain
            KeyChain.saveData(jsonData, with: key)
        }

        self._value = State<Value?>(initialValue: initialValue)
    }

    public var wrappedValue: Value? {
        get { value }

        nonmutating set {
            value = newValue

            if value == nil { // Remove item
                KeyChain.removeValue(with: key)
            } else { // Update item
                guard let data = try? JSONEncoder().encode(value) else {
                    return
                }
                KeyChain.saveData(data, with: key)
            }
        }
    }

    public var projectedValue: Binding<Value?> {
        .init(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }
}
