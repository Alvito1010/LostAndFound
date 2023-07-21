//
//  PencarianView.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 21/07/23.
//

import SwiftUI

struct PencarianView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.gray.opacity(0.3)
            }
            
            ZStack {
                Color.white.frame(height: 8)
                HStack {
                    Spacer().frame(width: UIScreen.main.bounds.width * 0.288)
                    Circle().foregroundColor(.blue).frame(width: 5,height: 5)
                    Spacer()
                }
            }
        }
    }
}

struct PencarianView_Previews: PreviewProvider {
    static var previews: some View {
        PencarianView()
    }
}
