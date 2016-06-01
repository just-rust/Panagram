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
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .Error)
                } else {
                    consoleIO.writeMessage("Too few arguments for option \(option.rawValue)", to: .Error)
                }
                ConsoleIO.printUsage()
            } else {
                //3
                let first = Process.arguments[2]
                let second = Process.arguments[3]
                
                if first.isAnagramOfString(second) {
                    consoleIO.writeMessage("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.writeMessage("\(second) is not an anagram of \(first)")
                }
            }
        case .Palindrome:
            //4
            if argCount != 3 {
                if argCount > 3 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .Error)
                } else {
                    consoleIO.writeMessage("Too few arguments for option \(option.rawValue)", to: .Error)
                }
                ConsoleIO.printUsage()
            } else {
                //5
                let s = Process.arguments[2]
                let isPalindrome = s.isPalindrome()
                consoleIO.writeMessage("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            }
        //6
        case .Help:
            ConsoleIO.printUsage()
        case .Unknown, .Quit:
            //7
            consoleIO.writeMessage("Unknown option \(value)", to: .Error)
            ConsoleIO.printUsage()
        }
    }
    
    func interactiveMode() {
        //1
        consoleIO.writeMessage("Welcome to Pangram. This program checks if an input string is an anagram or panlindrome.")
        
        //2
        var shouldQuit = false
        while !shouldQuit {
            //3
            consoleIO.writeMessage("Type 'a' to check for anagrams or 'p' for palindromes type 'q' to quit.")
            let (option, value) = consoleIO.getOption(consoleIO.getInput())
            
            switch option {
            case .Anagram:
                //4
                consoleIO.writeMessage("Type the first string:")
                let first = consoleIO.getInput()
                consoleIO.writeMessage("Type the second string:")
                let second = consoleIO.getInput()
                
                //5
                if first.isAnagramOfString(second) {
                    consoleIO.writeMessage("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.writeMessage("\(second) is not an anagram of \(first)")
                }
            case .Palindrome:
                consoleIO.writeMessage("Type a word or sentence:")
                let s = consoleIO.getInput()
                let isPalindrome = s.isPalindrome()
                consoleIO.writeMessage("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            case .Quit:
                shouldQuit = true
            default:
                //6
                consoleIO.writeMessage("Uknow option \(value)", to: .Error)
            }
        }
    }
}