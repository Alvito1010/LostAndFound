//
//  HasilView.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 21/07/23.
//

import SwiftUI

struct HasilView: View {
    var body: some View{
        VStack {
            ZStack {
                Color.gray.opacity(0.3)
            }
            
            ZStack {
                Color.white.frame(height: 8)
                HStack {
                    Spacer().frame(width: UIScreen.main.bounds.width * 0.49)
                    Circle().foregroundColor(.blue).frame(width: 5,height: 5)
                    Spacer()
                }
            }
        }
    }
}

struct HasilView_Previews: PreviewProvider {
    static var previews: some View {
        HasilView()
    }
}
