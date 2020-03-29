//
//  ReasonRow.swift
//  MenoumeSpiti-MovementSMS
//
//  Created by Orestis Papadopoulos on 26/03/2020.
//  Copyright © 2020 opapadopoulos. All rights reserved.
//

import SwiftUI

struct ReasonRow: View {
    var reason: ReasonModel

    var body: some View {
            VStack(alignment: .leading) {
                Text("\(reason.number). \(reason.title)")
                    .font(.system(size: 20.0))
                    .bold()
                    .foregroundColor(Color("Accent"))
                    .padding(.bottom, 6)
                    .minimumScaleFactor(0.8)
                Text(reason.description)
                    .font(.system(size: 18.0))
                    .foregroundColor(Color("Accent").opacity(0.7))
                    .lineLimit(nil)
                    .minimumScaleFactor(0.8)
            }.padding(.top, 8.0)
                .padding(.bottom, 8.0)
    }
}

struct ReasonRow_Previews: PreviewProvider {
    static var previews: some View {
        ReasonRow(reason: reasons[0])
    }
}
