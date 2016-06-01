//
//  main.swift
//  Panagram
//
//  Created by cyper on 6/1/16.
//  Copyright © 2016 Moaz Tech. All rights reserved.
//

import Foundation

let panagram = Panagram()
if Process.argc < 2 {
    //Handle interactive mode
} else {
    panagram.staticMode()
}


