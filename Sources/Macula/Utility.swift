//
//  Utility.swift
//  Macula
//
//  Created by Shon on 8/26/18.
//

import Foundation

func output(file: FileHandle = .standardOutput, _ message: String, _ terminator: String = "\n") {
	let finalMessage = "\(message)\(terminator)"
	if let finalData = finalMessage.data(using: .utf8) {
		file.write(finalData)
	}
}

func output(_ message: String, _ terminator: String = "\n") {
	output(file: .standardOutput, message, terminator)
}
