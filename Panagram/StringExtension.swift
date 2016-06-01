//
//  StringExtension.swift
//  Panagram
//
//  Created by cyper on 6/1/16.
//  Copyright © 2016 Moaz Tech. All rights reserved.
//

import Foundation

extension String {
    func isAnagramOfString(s: String) -> Bool {
        //1
        let lowerSelf = self.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "")
        let lowerOther = s.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "")
        //2
        return lowerSelf.characters.sort() == lowerOther.characters.sort()
    }
    
    func isPalindrome() -> Bool {
        let f = self.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "")
        let s = String(f.characters.reverse())
        
        return f == s
    }
}