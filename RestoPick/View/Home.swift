//
//  Home.swift
//  RestoPick
//
//  Created by ZML on 2023/06/25.
//

import SwiftUI

struct Home: View {
    var urlRequest = URLRequset()
    @StateObject private var locationManager = LocationManager()
    @State private var keyword: String = ""
    @State private var resultQuantity: Int = 10
    @State private var order:Int = 0
   
    @State var isSheetPresented = false
    @State private var selectedOptionIndex = 2
    
    
    
    let distanceOptions = [ "300M", "500M","1000M","2000M", "3000M"]

    let SortOrder = ["距离顺序","推荐顺序"]
        

    var body: some View {
        VStack {
            Group{
                titleSection()
                Divider()
                locationSection()
                Divider()
                distancePickerSection()
                Divider()
                resultQuantitySection()
                Divider()
            }
            
            sortOrderSection()
            Divider().padding()
            searchButton()
            Spacer()
        }
    }
    
    // Title section with RestoPick text
    private func titleSection() -> some View {
        HStack {
            Text("RestoPick")
                .font(.title)
                .bold()
                .padding()
            Spacer()
        }
    }
    
    // Location input section
    private func locationSection() -> some View {
        HStack {
            Text("地点")
                .padding()
            TextField("当前地点", text: $keyword)
        }
    }
    
    // Distance picker section
    private func distancePickerSection() -> some View {
        HStack {
            Text("範囲")
                .padding(.horizontal)
            Spacer()
            Picker("Options", selection: $selectedOptionIndex) {
                ForEach(0..<5) { index in
                    Text(distanceOptions[index])
                }
            }
            .padding(.horizontal)
            .pickerStyle(.automatic)
        }
    }
    
    
    private func resultQuantitySection() -> some View {
        HStack {
            Text("显示数量")
                .padding()
            Stepper(value: $resultQuantity, in: 1...100) {
                Text("\(resultQuantity)")
            }
            .padding()
        }
    }
    
    
    private func sortOrderSection() -> some View {
        HStack {
            Text("显示顺序")
                .padding()
            Picker(selection: $order, label: Text("")) {
                ForEach(0..<2) { index in
                    Text(SortOrder[index])
                }
            }
            .pickerStyle(.segmented)
            .padding()
        }
    }
    
    
    private func searchButton() -> some View {
        Button {
            // Handle search button action here
            isSheetPresented = true
            if keyword == "" {
                locationManager.requestLocation()
              var  url = urlRequest.createURL(lat: locationManager.latitude, lng: locationManager.longitude, range: selectedOptionIndex+1, count: resultQuantity,order: order)!
                print(url)
            }else{
             var   url = urlRequest.createURL(keyword: keyword, range: selectedOptionIndex+1, count: resultQuantity, order: order)!
                print(url)
                
            }
           
            
            
        } label: {
            Text("检索")
                .font(.largeTitle)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(10)
                .shadow(radius: 3)
                .padding()
        }
        .sheet(isPresented: $isSheetPresented) {
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
