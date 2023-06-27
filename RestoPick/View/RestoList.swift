//
//  RestoList.swift
//  RestoPick
//
//  Created by ZML on 2023/06/25.
//

import SwiftUI

struct RestoList: View {
    
     var logo_image: URL!
     var name: String
     var point:String
    
   
    
    var body: some View {
        HStack {
            
            AsyncImage(url:logo_image, content: { image in
                image.resizable()
                    .frame(width: 60, height: 60).cornerRadius(10)
            }, placeholder: {
                ProgressView().frame(width: 60, height: 60)
            })
                    
                    
            VStack {
                
                HStack {
                    Text("\(name)")
                        .font(.title2)
                    Spacer()
                }
                       
                    
                        
                    
                
                HStack {
                    Text(point)
                        .font(.body)
                    .foregroundColor(.gray)
                    Spacer()
                }
            }

               
            
            }
            

    }
    
}
struct RestoList_Previews: PreviewProvider {
    
 
    
    static var previews: some View {
        
        
        RestoList(logo_image: URL(string: "https://imgfp.hotp.jp/IMGH/84/58/P033028458/P033028458_69.jpg")!, name:"和風料理 おかめ", point: "地元の新鮮食材♪ 観光帰りに是非")
    }
}

