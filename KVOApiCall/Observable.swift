//
//  Observable.swift
//  KVOApiCall
//
//  Created by Naga Divya Bobbara on 17/08/22.
//

import Foundation
class Observable<T>{
    var value : T? {
        didSet{
            listener?(value)
        }
    }
    
    
    init(_ value : T?)
    {
        self.value = value
    }
    private var listener : ((T?) -> Void)?
    func bind(_ listener : @escaping(T?)->Void){
        self.listener = listener
    }
    
    
}

