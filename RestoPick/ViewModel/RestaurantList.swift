//
//  RestaurantListViewModel.swift
//  RestoPick
//
//  Created by ZML on 2023/06/26.
//
import Foundation


class RestaurantsViewModel: ObservableObject,Identifiable{
    
    @Published var restaurants = [Restaurant]()
   
    
    func fetchData() async {
        
        let urlString = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=6ca6c3fab7e6adaf&lat=35.46&lng=133.32&range=5&order=4&count=2&format=json"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL string.")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(ApiResponse.self, from: data)
            self.restaurants = response.results.shop
        } catch {
            print("Error fetching or decoding JSON: \(error)")
        }
    }

}





