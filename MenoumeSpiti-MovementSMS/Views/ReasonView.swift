//
//  ReasonView.swift
//  MenoumeSpiti-MovementSMS
//
//  Created by Orestis Papadopoulos on 26/03/2020.
//  Copyright © 2020 opapadopoulos. All rights reserved.
//

import SwiftUI
import MessageUI

struct ReasonView: View {
    let userDetails: UserDetailsModel
    @State private var isPresented = false
    @State var selectedReason: ReasonModel = reasons[0]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
            VStack {
                ZStack {
                    Color("Background").edgesIgnoringSafeArea(.all)
                    List {
                        Section (header: ListHeader()) {
                            ForEach(0..<reasons.count) { reasonIndex in
                                ReasonRow(reason: reasons[reasonIndex]).onTapGesture {
                                    self.selectedReason = reasons[reasonIndex]
                                    self.isPresented = true
                                }.listRowBackground(Color("Background"))
                            }}.sheet(isPresented: $isPresented) {
                                if MFMessageComposeViewController.canSendText() {
                                    SMSViewController(reason: self.selectedReason, userDetails: self.userDetails)
                                } else {
                                    Text("Η συσκευή σας δεν έχει τη δυνατότητα αποστολής SMS")
                                }
                            }
                    }.listStyle(GroupedListStyle())
                }
                
            }.onAppear {saveUserDetailsModel(self.userDetails)}
            .background(Color("Background"))
            .navigationBarTitle("Αίτηση Μετακίνησης", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack(spacing: 4.0) {
                        Image(systemName: "arrow.left").accentColor(Color("Accent"))
                        Text("Πίσω").foregroundColor(Color("Accent"))
                    }
                }
        )
    }
}

struct ListHeader: View {
    var body: some View {
        return HStack {
            Spacer()
            Text("Επέλεξε τον λόγο μετακίνησης").foregroundColor(Color("Accent").opacity(0.7))
            Spacer()
        }.padding()
    }
}

struct ReasonView_Previews: PreviewProvider {
    static var previews: some View {
        ReasonView(userDetails: UserDetailsModel(fullName: "Τζίμης Πανούσης", address: "Αιόλου 35"))
    }
}
