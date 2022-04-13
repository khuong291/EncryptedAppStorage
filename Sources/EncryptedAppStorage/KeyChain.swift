//
//  File.swift
//  
//
//  Created by KhuongPham on 13/04/2022.
//

import Foundation
import Security

class KeyChain {
    @discardableResult
    class func saveData(_ data: Data, with key: String) -> OSStatus {
        let query = [
            String(kSecClass): kSecClassGenericPassword as String,
            String(kSecAttrAccount): key,
            String(kSecValueData): data
        ] as CFDictionary

        SecItemDelete(query)

        return SecItemAdd(query, nil)
    }

    class func loadData(with key: String) -> Data? {
        let query = [
            String(kSecClass): kSecClassGenericPassword,
            String(kSecAttrAccount): key,
            String(kSecReturnData): kCFBooleanTrue!,
            String(kSecMatchLimit): kSecMatchLimitOne
        ] as CFDictionary

        var dataTypeRef: AnyObject?

        let status = SecItemCopyMatching(query, &dataTypeRef)

        if status == noErr, let data = dataTypeRef as? Data {
            return data
        } else {
            return nil
        }
    }

    @discardableResult
    class func removeValue(with key: String) -> OSStatus {
        let query = [
          kSecClass: kSecClassGenericPassword,
          kSecAttrAccount: key
        ] as CFDictionary

        return SecItemDelete(query)
    }
}
