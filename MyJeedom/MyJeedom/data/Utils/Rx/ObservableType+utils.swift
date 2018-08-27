//
//  ObservableType+utils.swift
//  CubeInStore
//
//  Created by Johann on 30/07/2018.
//  Copyright © 2018 Johann. All rights reserved.
//

import Foundation

import RxSwift

class CError:Error{
    
}

public protocol OptionalType {
    associatedtype Wrapped
    
    var optional: Wrapped? { get }
}

extension Optional: OptionalType {
    public var optional: Wrapped? { return self }
}

// Unfortunately the extra type annotations are required, otherwise the compiler gives an incomprehensible error.
extension Observable where Element: OptionalType {
    func errorOnNil() -> Observable<Element.Wrapped> {
        
        return flatMap { value in
            
            value.optional.map { Observable<Element.Wrapped>.just($0) } ??  Observable<Element.Wrapped>.error(CError())
        }
    }
}


