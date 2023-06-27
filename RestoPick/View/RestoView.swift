//
//  RestoView.swift
//  RestoPick
//
//  Created by ZML on 2023/06/25.
//

import SwiftUI

struct RestoView: View {
    
    var name:String//
    var image: URL!//
    var open:String //
    var address:String //
    var access:String//
    
    
    var body: some View {

       ScrollView {
            VStack {
                Text(name)
                    .font(.title)
                    Divider()
                    AsyncImage(url:image, content: { image in
                    image.resizable().frame(width: 300, height: 300).cornerRadius(10)
                    
                        
                }, placeholder: {
                    ProgressView()
                        .frame(width: 300, height: 300).cornerRadius(10)
                })
                    .padding()
                
                        
                        
                Divider()
                PRView(name: "address", content: address)
                    .padding()
                Divider()
                PRView(name: "access", content: access)
                    .padding()
                Divider()
                PRView(name: "open", content: open)
                    .padding()
                Divider()
                    
                    
                            
            }
        }
            
            
            
                    
                    
                        
                    
                
            
        
            
        
        
        
        
    }
}

struct RestoView_Previews: PreviewProvider {
    static var previews: some View {
        RestoView(name: "和風料理 おかめ", image: URL(string: "https://imgfp.hotp.jp/IMGH/79/17/P033027917/P033027917_168.jpg"),open: "月、火、木～日、祝日、祝前日: 11:30～15:00 （料理L.O. 14:30 ドリンクL.O. 14:30）17:00～20:30 （料理L.O. 20:00 ドリンクL.O. 20:00）", address:"神奈川県厚木市七沢２４６－１" , access: "本厚木駅（イオン横バスセンター）七沢行・広沢寺温泉行バスに乗車。「日向川」「馬場リハビリ」にて下車。バスで30分。")
    }
}

struct PRView: View {
    var name:String
    var content:String
    var body: some View {
        VStack {
            
            HStack {
                Text(name)
                    .padding(.horizontal)
                Spacer()
            }
            HStack {
                Text(content)
                    .padding(.horizontal)
                Spacer()
            }
            
            
        }
    }
}
