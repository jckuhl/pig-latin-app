//
//  Pig Latin.swift
//  Pig Latin
//
//  Created by Jonathan Kuhl on 9/21/17.
//  Copyright © 2017 Jonathan Kuhl. All rights reserved.
//

//enum Vowels: Character {
//    case a = "a"
//    case A = "A"
//    case e = "e"
//    case E = "E"
//    case i = "i"
//    case I = "I"
//    case o = "o"
//    case O = "O"
//    case u = "u"
//    case U = "U"
//}

import Foundation

enum PigLatinError: Error {
    case emptyString
    case invalidString
    case defaultError
    
    static func stringIsInvalid(_ string: String) -> Bool {
        if Int(string) != nil {
            return true
        } else {
            return false
        }
    }
}



class PigLatinTranslator {
    let string: String
    
    init?(string: String?) throws {
        if let string = string {
            if string.isEmpty {
                throw PigLatinError.emptyString
            } else if PigLatinError.stringIsInvalid(string) {
                throw PigLatinError.invalidString
            } else {
                self.string = string
            }
        } else {
            throw PigLatinError.defaultError
        }
    }

    

    func isVowel(_ c: Character) -> Bool {
//        switch c {
//        case Vowels.A.rawValue,
//             Vowels.a.rawValue,
//             Vowels.E.rawValue,
//             Vowels.e.rawValue,
//             Vowels.e.rawValue,
//             Vowels.I.rawValue,
//             Vowels.i.rawValue,
//             Vowels.O.rawValue,
//             Vowels.o.rawValue,
//             Vowels.U.rawValue,
//             Vowels.u.rawValue: return true
//        default: return false
        let vowels: CharacterSet = CharacterSet(charactersIn: "aeiouAEIOU")
        if vowels.contains(UnicodeScalar(c)){
            return true
        } else {
            return false
        }
    }
    
    func isSpecial(_ c: Character) -> Bool {
        return false
    }
    
    func stringToCharacter(from string: String) -> [Character] {
        return [Character](string.characters)
    }
    
    func translate() -> String {
        var translatedString: String = ""
        let wordsInString:[String] = string.components(separatedBy: " ")
        for wordInString in wordsInString {
            var characters = stringToCharacter(from: wordInString)
            var subString: [Character] = []
            for c in characters {
                if isVowel(c) || isSpecial(c) {
                    break
                } else {
                    subString.append(c)
                }
            }
            let upperBound = subString.count - 1
            if upperBound >= 0 {
                characters.removeSubrange(0...upperBound)
            }
            characters += stringToCharacter(from: "-") + subString + stringToCharacter(from: "ay ")
            translatedString += String(characters)
        }
        return translatedString
    }

}









