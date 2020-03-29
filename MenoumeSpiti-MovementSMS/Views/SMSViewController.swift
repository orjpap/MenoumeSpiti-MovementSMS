//
//  SMSView.swift
//  MenoumeSpiti-MovementSMS
//
//  Created by Orestis Papadopoulos on 26/03/2020.
//  Copyright © 2020 opapadopoulos. All rights reserved.
//

import SwiftUI
import MessageUI

struct SMSViewController: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    
    let reason: ReasonModel
    let userDetails: UserDetailsModel
    
    func makeCoordinator() -> SMSViewController.Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> MFMessageComposeViewController {
        
        if !MFMessageComposeViewController.canSendText() {
            print("SMS services are not available")
        }
        
        let vc = MFMessageComposeViewController()
        vc.messageComposeDelegate = context.coordinator
        vc.recipients = ["13033"]
        vc.body = "\(reason.number) \(userDetails.fullName) \(userDetails.address)"
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: Context) {
    }
}

extension SMSViewController {
    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {

        var parent: SMSViewController

        init(_ parent: SMSViewController) {
            self.parent = parent
        }

        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
