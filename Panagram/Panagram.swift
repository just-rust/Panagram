//
//  Panagram.swift
//  Panagram
//
//  Created by cyper on 6/1/16.
//  Copyright © 2016 Moaz Tech. All rights reserved.
//

import Foundation

class Panagram {
    let consoleIO = ConsoleIO()
    func staticMode() {
        //1
        let argCount = Process.argc
        //2
        let argument = Process.arguments[1]
        //3
        let (option, value) = consoleIO.getOption(argument.substringFromIndex(argument.startIndex.advancedBy(1)))
        //4
        //print("Argument count: \(argCount) Option: \(option) value: \(value)")
        switch option {
        case .Anagram:
            //2
            if argCount != 4 {
                if argCount > 4 {
                    print("Too many arguments for option \(option.rawValue)")
                } else {
                    print("Too few arguments for option \(option.rawValue)")
                }
                ConsoleIO.printUsage()
            } else {
                //3
                let first = Process.arguments[2]
                let second = Process.arguments[3]
                
                if first.isAnagramOfString(second) {
                    print("\(second) is an anagram of \(first)")
                } else {
                    print("\(second) is not an anagram of \(first)")
                }
            }
        case .Palindrome:
            //4
            if argCount != 3 {
                if argCount > 3 {
                    print("Too many arguments for option \(option.rawValue)")
                } else {
                    print("Too few arguments for option \(option.rawValue)")
                }
                ConsoleIO.printUsage()
            } else {
                //5
                let s = Process.arguments[2]
                let isPalindrome = s.isPalindrome()
                print("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            }
        //6
        case .Help:
            ConsoleIO.printUsage()
        case .Unknown:
            //7
            print("Uknown option \(value)")
            ConsoleIO.printUsage()
        }
    }
}