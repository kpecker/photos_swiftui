//
//  StringExt.swift
//  Verimi
//
//  Created by Kishore Vaddadi on 31.07.24.
//

import Foundation

extension String {
    var capitalizedSentence: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }
}
