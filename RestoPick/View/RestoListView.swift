//
//  RestoListView.swift
//  RestoPick
//
//  Created by ZML on 2023/06/26.
//

import SwiftUI

struct RestoListView: View {
    @ObservedObject var viewModel = RestaurantsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.restaurants) { restaurant in
                    NavigationLink {
                        RestoView(name: restaurant.name,image: URL(string: "\(restaurant.photos.mobile.l)"),open: restaurant.open, address: restaurant.address, access: restaurant.access)
                    } label: {
                        RestoList(logo_image: URL(string: "\(restaurant.logoImage)"), name: restaurant.name,point: restaurant.genre.point)
                        
                    }
                }  .navigationTitle("List")

            }.task {
                await viewModel.fetchData()

        }
        }

    }



struct RestoListView_Previews: PreviewProvider {
    @Binding var url:URL
    static var previews: some View {
        RestoListView()
    }
}
