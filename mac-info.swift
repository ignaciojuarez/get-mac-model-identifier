//  Created by Ignacio Juarez on 7/7/23
//  Copyright © 2023 Ignacio Juarez. All rights reserved.
//
//  Usage:
//  getMacModelIdentifier() -> String: MacModel Idenfifier
//  swift mac-info.swift    -> String: MacModel Idenfifier
//
//  Desc:
// This function returns the model identifier of the Mac

import Foundation


private func getMacModelIdentifier() -> String {
    let process = Process()
    let pipe = Pipe()

    process.standardOutput = pipe
    process.launchPath = "/usr/sbin/sysctl"
    process.arguments = ["-n", "hw.model"]

    process.launch()
    process.waitUntilExit()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)

    return output?.trimmingCharacters(in: .whitespacesAndNewlines)??"Unknown"
}

print (getMacModelIdentifier())