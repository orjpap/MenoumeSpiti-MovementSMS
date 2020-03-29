//
//  FileManager.swift
//  MenoumeSpiti-MovementSMS
//
//  Created by Orestis Papadopoulos on 26/03/2020.
//  Copyright © 2020 opapadopoulos. All rights reserved.
//

import Foundation

func saveUserDetailsModel(_ model: UserDetailsModel) {
    guard let documentsDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
    
    try? FileManager().createDirectory(at: documentsDirectoryUrl, withIntermediateDirectories: true)
    let filePath = documentsDirectoryUrl.appendingPathComponent("userDetails.json")
    let json = try? JSONEncoder().encode(model)

    do {
         try json!.write(to: filePath)
    } catch {
        print("Failed to write JSON data: \(error.localizedDescription)")
    }
}

func loadUserDetailsModel() -> UserDetailsModel? {
    guard let documentsDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
    
    let filePath = documentsDirectoryUrl.appendingPathComponent("userDetails.json")
    
    do {
        let data = try Data(contentsOf: filePath, options: .mappedIfSafe)
        let jsonResult = try JSONDecoder().decode(UserDetailsModel.self, from: data)
        return jsonResult
    } catch {
       print(error)
       return nil
    }
}
