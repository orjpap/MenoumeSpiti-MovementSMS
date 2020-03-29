//
//  ContentView.swift
//  LoginPageSwiftUITutorial

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct UserDetailsModel: Codable {
    var fullName: String = ""
    var address: String = ""
}

struct ContentView : View {
    @State var userDetails: UserDetailsModel
    
    var continueButtonIsDisabled: Bool {
        return userDetails.address.isEmpty || userDetails.fullName.isEmpty
    }
    var buttonColor: Color {
        return continueButtonIsDisabled ? .gray : Color("Accent")
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background").edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    WelcomeText()
                        .padding()
                    CustomTextField (
                        placeholder: Text("Ονοματεπώνυμο").foregroundColor(.gray),
                        text: $userDetails.fullName)
                    CustomTextField (
                        placeholder: Text("Διεύθυνση κατοικίας").foregroundColor(.gray),
                        text: $userDetails.address)
                    HStack(alignment: .center, spacing: 0) {
                        Spacer()
                        NavigationLink(destination: ReasonView(userDetails: userDetails)) {
                            Text("Συνέχεια")
                                .font(.body)
                                .padding(8.0)
                                .frame(width: 100, height: 40)
                                .foregroundColor(Color("Background"))
                                .background(buttonColor)
                                .cornerRadius(18.0)
                        }.disabled(continueButtonIsDisabled)
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }.padding(.leading, 14.0).padding(.trailing, 14.0)
                .navigationBarTitle(Text("Αίτηση Μετακίνησης").foregroundColor(Color("Accent")))
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(userDetails: UserDetailsModel())
    }
}
#endif

struct WelcomeText : View {
    var body: some View {
        return Text("Συμπλήρωσε το ονοματεπώνυμο σου και την διεύθυνση κατοικίας σου.")
            .font(.body)
            .fontWeight(.semibold)
            .padding(.bottom, 8.0)
            .padding(.leading, -15)
            .foregroundColor(Color("Accent"))
    }
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit).autocapitalization(.allCharacters)
        }
        .padding()
        .background(lightGreyColor)
        .cornerRadius(5.0)
        .foregroundColor(.black)
    }
}
