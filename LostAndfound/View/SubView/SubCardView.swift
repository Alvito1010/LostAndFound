//
//  SubSelesaiView.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 20/07/23.
//

import SwiftUI
struct SubCardView: View {
    var arrayTrack: [ComponentTrack]

    var body: some View {
        
//        NavigationView{
        ScrollView{
            LazyVStack(){
                HStack{
                    Text("Nomor Laporan: LB140720230408")
                        .foregroundColor(.accentColor)
                        .fontWeight(.semibold)
                        .font(.system(size: 16))
                    Spacer()
                }
                .padding()
                .background(.white)
                .cornerRadius(12)
                .padding(.top,16)
                .padding(.bottom,10)
                LazyVStack(spacing: 0){
                    ForEach(arrayTrack, id: \.trackingTitle) { track in
                        ComponentTrack(dateMonth: track.dateMonth, time: track.time, trackingColor: track.trackingColor, trackingTitle: track.trackingTitle, trackingDescription: track.trackingDescription, trackingIcon: track.trackingIcon, trackingStatus: track.trackingStatus)
                    }
                }.padding()
                    .padding(.vertical, 8)
                    .background(.white)
                    .cornerRadius(12)
                Spacer()
                
            }
            Spacer()
        }.padding(.horizontal)
            .background(.gray.opacity(0.2))
            
        

    }
}

//struct SubSelesaiView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubCardView(arrayTrack: <#[ComponentTrack]#>)
//    }
//}
