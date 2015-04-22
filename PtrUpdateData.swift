//
//  PtrUpdateData.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-22.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import Foundation
class PtrUpdaeData<T>: NSObject {
    var Type:UpdateType
    var Data:[T]
    
    init(Type:UpdateType ,Data:[T]){
        self.Type = Type
        self.Data = Data
    }
}