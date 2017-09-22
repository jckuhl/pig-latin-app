//
//  Pig Latin.swift
//  Pig Latin
//
//  Created by Jonathan Kuhl on 9/21/17.
//  Copyright © 2017 Jonathan Kuhl. All rights reserved.
//

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

    func stringToCharacter(from string: String) -> [Character] {
        return [Character](string.characters)
    }

    func isVowel(_ c: Character) -> Bool {
        let vowels: [Character] = stringToCharacter(from: "aeiouAEIOU")
        return vowels.contains(c)
    }
    
    func isSpecial(_ c: Character) -> Bool {
        return false
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









