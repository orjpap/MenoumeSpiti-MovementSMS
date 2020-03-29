//
//  Util.swift
//  MenoumeSpiti-MovementSMS
//
//  Created by Orestis Papadopoulos on 26/03/2020.
//  Copyright © 2020 opapadopoulos. All rights reserved.
//

import Foundation
import UIKit
import Firebase

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

func hasDownTime() -> Bool {
    let remoteConfig = RemoteConfig.remoteConfig()
    return remoteConfig.configValue(forKey: "hasDownTime").boolValue
}

func remoteConfigSetup() {
    // 1. Configure for dev mode if we need it, otherwise a 1 hour expiration duration
    let remoteConfig = RemoteConfig.remoteConfig()
    #if DEBUG
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    #else
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 3600
        remoteConfig.configSettings = settings
    #endif

    // 2. Set our default values and keys
    remoteConfig.setDefaults([
        "hasDownTime": false as NSObject
    ])

    // 3. Activate any fetched values before we read anything back
    remoteConfig.activate(completionHandler: nil) 

    // 5. Perform the next fetch so that it's ready when we re-launch
    remoteConfig.fetch(withExpirationDuration: 3600){ status, _ in
        print("[Config] Fetch completed with status:", status, "(\(status.rawValue))")
    }
}
