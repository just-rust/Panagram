//
//  ConsoleIO.swift
//  Panagram
//
//  Created by cyper on 6/1/16.
//  Copyright © 2016 Moaz Tech. All rights reserved.
//

import Foundation
enum OutputType {
    case Error
    case Standard
}

enum OptionType: String {
    case Palindrome = "p"
    case Anagram = "a"
    case Help = "h"
    case Quit = "q"
    case Unknown
    
    init(value: String) {
        switch value {
        case "a":
            self = .Anagram
        case "p":
            self = .Palindrome
        case "h":
            self = .Help
        case "q":
            self = .Quit
        default:
            self = .Unknown
        }
    }
}

class ConsoleIO {
    class func printUsage(){
        let executableName = (Process.arguments[0] as NSString).lastPathComponent
        
        print("usage:")
        print("\(executableName) -a string1 string2")
        print("or")
        print("\(executableName) -p string")
        print("or")
        print("\(executableName) -h to show usage information")
        print("Type \(executableName) without an option to enter interactive mode.")
        
    }
    
    func getOption(option: String) -> (option: OptionType, value: String) {
        return (OptionType(value: option), option)
    }
    func writeMessage(message: String, to: OutputType = .Standard) {
        switch to {
        case .Standard:
            print("\u{001B}[;m\(message)")
        case .Error:
            fputs("\u{001B}[0;31m\(message)\n", stderr)
        }
    }
    
    func getInput() -> String {
        //1
        let keyboard = NSFileHandle.fileHandleWithStandardInput()
        
        //2
        let inputData = keyboard.availableData
        
        //3
        let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
        
        //4
        return strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
        
    }
}