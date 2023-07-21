//
//  BatalView.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 21/07/23.
//

import SwiftUI

struct BatalView: View {
    var body: some View{
        VStack {
            ZStack(alignment: .top) {
                Color.gray.opacity(0.2)
                VStack{
//                    ScrollView{
                        SubBatalView()
//                    }
                }
            }
            ZStack {
                Color.white.frame(height: 8)
                HStack {
                    Spacer().frame(width: UIScreen.main.bounds.width * 0.892)
                    Circle().foregroundColor(.blue).frame(width: 5,height: 5)
                    Spacer()
                }
            }
        }
    }
}

struct BatalView_Previews: PreviewProvider {
    static var previews: some View {
        BatalView()
    }
}
