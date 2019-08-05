//
//  String.swift
//  Common
//
//  Created by Anshu Raghuvansi on 22/07/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation

public extension String{
    
    func localized(bundle:Bundle = Bundle.main,
                   tableName:String = "Localizable")->String{
        return NSLocalizedString(self,
                                 tableName: tableName,
                                 bundle: bundle,
                                 value: self,comment: "")
    }
}
