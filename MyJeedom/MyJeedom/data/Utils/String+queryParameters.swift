//
//  String+queryParameters.swift
//  CubeInStoreTests
//
//  Created by Johann on 28/11/2017.
//  Copyright © 2017 Johann. All rights reserved.
//

import Foundation



extension String{
    
    func urlEncoded()->String!{
        let allowedQueryParamAndKey =  CharacterSet(charactersIn: ";/?@&=+$, ").inverted
        return self.addingPercentEncoding(withAllowedCharacters: allowedQueryParamAndKey)
    }
    
    private func generateQueryParameters(_ parameters:[String:Any?], startWithQuestionMark:Bool)->String{
        var queryParameters = ""
        var questionMark = startWithQuestionMark
        for (key, value) in parameters{
            if let value = value {
                var encodedValue: String = (value as! CustomStringConvertible).description.urlEncoded()
                if let stringValues = value as? Array<Any>{
                    let encodedStringValues = stringValues.map({ (item) -> String in
                        return (item as! CustomStringConvertible).description.urlEncoded()
                    })
                    encodedValue = String.fromArray(encodedStringValues, separator:"%2C")
                }
                queryParameters = queryParameters + (questionMark ? "?" : "&") + key + "=" + encodedValue.description
                questionMark = false
            }
        }
        return queryParameters
    }
    
    private var hasQuestionMark:Bool{
        return self.contains("?")
    }
    
    func stringByAddingQueryParameter(key:String, value:Any?)->String{
        return stringByAddingQueryParameters([key: value])
    }
    
    mutating func addQueryParameter(key:String, value:Any?){
        addQueryParameters([key:value])
    }
    
    func stringByAddingQueryParameters(_ parameters:[String:Any?])->String{
        return self + generateQueryParameters(parameters, startWithQuestionMark: !self.hasQuestionMark)
    }
    
    mutating func addQueryParameters(_ parameters:[String:Any?]){
        append(generateQueryParameters(parameters, startWithQuestionMark: !self.hasQuestionMark))
    }
    
}
