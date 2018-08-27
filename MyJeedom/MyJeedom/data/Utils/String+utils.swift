//
//  String+utils.swift
//  CubeInStore
//
//  Created by Johann on 10/05/2016.
//  Copyright © 2016 Johann. All rights reserved.
//

import Foundation


extension String{
    func contains (_ string: String) -> Bool{
        return self.range(of: string) != nil
    }
    
    
    static func fromArray(_ strings:[String], separator:String = "")->String{
        var res: String?
        for string in strings{
            if res != nil {
                res?.append(separator + string)
            } else {
                res = string
            }
            
        }
        return res ?? ""
    }
    
    
    
    func stringByReplacingHTMLCharacters() -> String {
        let string = self.replacingOccurrences(of: "<br/>", with: "\n").replacingOccurrences(of: "<br/ >", with: "\n").replacingOccurrences(of: "<br>", with: "\n")
        
        guard let data = string.data(using: .utf8) else {
            return self
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
            NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return self
        }
        
        return attributedString.string
    }
    
    func fromDDMMYYYY()->Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        if let date = formatter.date(from: self) {
            return date
        } else {
            formatter.dateFormat = "yyyy/MM/dd"
            if let date = formatter.date(from: self) {
                return date
            }
        }
        return Date()
    }

    
    
    func stringByReplacingCharactersInRange(_ range: NSRange, withString replacement: String) -> String{
        let nsString = self as NSString
        return nsString.replacingCharacters(in: range,
                                                                    with: replacement)
    }

    func substring(to index:Int)->String?{
        let index = self.index(self.startIndex, offsetBy: index)
        return String(self[..<index])
    }
    
    func removingWhitespaces()->String{
        //let result = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return components(separatedBy: .whitespacesAndNewlines).joined()
        // return result
    }
    
    func trim()->String{
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isNumeric: Bool{
        let numberCharacters = CharacterSet.decimalDigits.inverted
        return self.rangeOfCharacter(from: numberCharacters) == nil
    }
    
    func appendIfNotNil(_ string:String?, separator:String = "")->String{
        guard let string = string else{
            return self
        }
        return self + separator + string
    }
    
    var length: Int{
        return count
    }
    
    var empty: Bool{
        return length == 0
    }
    
    
    func safeSubstringToIndex(_ index:Int)->String{
        guard index < self.length else{
            return self
        }
        let endIndex: String.Index = self.index(self.startIndex, offsetBy: index)
        return String(self[..<endIndex])
        
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    static func notNilNorEmpty(_ string:String?) -> String?{
        if let string = string, string.isEmpty == false {
            return string
        }
        return nil
    }
}
