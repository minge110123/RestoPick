//
//  RestaurantListViewModel.swift
//  RestoPick
//
//  Created by ZML on 2023/06/26.
//
import Foundation


class RestaurantsViewModel: ObservableObject,Identifiable{
    
    @Published var restaurants = [Restaurant]()
   
    
    func fetchData(url:URL) async {
        

        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(ApiResponse.self, from: data)
            DispatchQueue.main.async {
                self.restaurants = response.results.shop
            }
        } catch {
            print("Error fetching or decoding JSON: \(error)")
        }
    }

}





