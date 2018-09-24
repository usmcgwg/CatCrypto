//
//  Helper.swift
//  CatCrypto
//
//  Created by Kcat on 2017/12/22.
//  Copyright © 2017年 imkcat. All rights reserved.
//
// https://github.com/ImKcat/CatCrypto
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//

import Foundation

/// Base result class for encrypt, decrypt, hash or verify.
public class CatCryptoResult {

    public var raw: Any?

    public func boolValue() -> Bool {
        if raw is Bool {
            return (raw as? Bool)!
        }
        return false
    }

    public func stringValue() -> String? {
        if raw is [CUnsignedChar] {
            return String(cString: (raw as? [CUnsignedChar])!)
        }
        return nil
    }

    public func hexStringValue() -> String? {
        if raw is [CUnsignedChar] {
            return (raw as? [CUnsignedChar])?.hexString()
        }
        return nil
    }

    /// Error for result.
    public var error: CatCryptoError?

}

/// Error for descript result.
public class CatCryptoError: LocalizedError {

    /// Code number for error condition.
    public var errorCode: Int = 0

    /// The description string for error.
    public var errorDescription: String?

}
