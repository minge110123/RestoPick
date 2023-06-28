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
    
    @StateObject private var viewModel = RestaurantsViewModel()
    
    
    
    let distanceOptions = [ "300M", "500M","1000M","2000M", "3000M"]

    let SortOrder = ["おススメ順","距離順"]
        

    var body: some View {
        VStack {
            Group{
                titleSection()
                Divider()
                locationSection()
                Divider()
                rangeSection()
                Divider()
                countSection()
                Divider()
            }
            
            sortOrderSection()
            Divider().padding()
            searchButton()
            Spacer()
        }
        .onAppear {
            locationManager.requestLocation()

        }

    }
    
    
    private func titleSection() -> some View {
        HStack {
            Text("RestoPick")
                .font(.title)
                .bold()
                .padding()
            Spacer()
        }
    }
    
    
    private func locationSection() -> some View {
        HStack {
            Text("場所")
                .padding()
            TextField("現在地", text: $keyword)
        }
    }
    
    
    private func rangeSection() -> some View {
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
    
    
    private func countSection() -> some View {
        HStack {
            Text("検索数量")
                .padding()
            Stepper(value: $resultQuantity, in: 1...100) {
                Text("\(resultQuantity)")
            }
            .padding()
        }
    }
    
    
    private func sortOrderSection() -> some View {
        HStack {
            Text("ソート順")
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
            var urlre:URL
                        if keyword == "" {
                           
                            urlre = urlRequest.createURL(lat: String(format: "%.3f", locationManager.latitude), lng: String(format: "%.3f", locationManager.longitude), range: selectedOptionIndex+1, count: resultQuantity, order: order)!
                            
                            print(urlre)
                        } else {
                            urlre = urlRequest.createURL(keyword: keyword, range: selectedOptionIndex+1, count: resultQuantity, order: order)!
                        }
            
                        Task {
                        await viewModel.fetchData(url: urlre)
                            
                            print(viewModel.restaurants.count)
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
            RestoListView(viewModel: viewModel, isSheetPresented: $isSheetPresented)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
