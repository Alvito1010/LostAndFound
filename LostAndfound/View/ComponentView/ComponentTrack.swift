//
//  ComponentTrack.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 20/07/23.
//

import SwiftUI

struct ComponentTrack: View {
    var dateMonth: String
    var time: String
    var trackingColor: String
    var trackingTitle: String
    var trackingDescription: String
    var trackingIcon: String
    var trackingStatus: Bool
    
    var body: some View {
        
        HStack(alignment: .top){
            VStack(alignment: .leading){
                HStack{
                    Text("\(dateMonth)")
                    Spacer()
                }
                HStack{
                    Text("\(time)")
                    Spacer()
                }
            }
            .foregroundColor(.gray)
            .font(.system(size: 13))
            .frame(minWidth: 50 , maxWidth: 50)
            HStack(spacing: 16){
                VStack(alignment: .center, spacing: 0 ){
                    Image(systemName: trackingIcon == "" ? "circlebadge.fill" : "\(trackingIcon)")
                        .font(.system(size: 22))
                        .foregroundColor(trackingColor == "red" ? .red : (trackingColor == "green" ? .green : .gray.opacity(0.3)))
                        
                    Rectangle()
                        .frame(width: 2,height: .infinity)
                        .foregroundColor(trackingStatus ? .green : .gray.opacity(0.3))
                }
                .frame(minWidth: 25 , maxWidth: 25)
                VStack(alignment: .leading, spacing: 6){
                    HStack{
                        Text("\(trackingTitle)")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(trackingColor == "red" ? .red : (trackingColor == "green" ? .green : .black.opacity(0.6)))
                        Spacer()
                    }
                    HStack{
                        Text("\(trackingDescription)")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                            
                        Spacer()
                    }
                    
                    
                    Spacer()
                    
                }
            }
            
        }
    }
}

struct ComponentTrack_Previews: PreviewProvider {
    static var previews: some View {
        ComponentTrack(dateMonth: "16 Jul", time: "15:30", trackingColor: "red", trackingTitle: "Barang Tidak Ditemukan", trackingDescription: "Mohon maaf  barang tidak  ditemukan di seluruh area Stasiun MRT Jakarta.", trackingIcon: "x.circle.fill", trackingStatus: false)
    }
}
