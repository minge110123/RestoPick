//
//  RestoListView.swift
//  RestoPick
//
//  Created by ZML on 2023/06/26.
//

import SwiftUI

struct RestoListView: View {
    @ObservedObject var viewModel:RestaurantsViewModel
    @Binding var isSheetPresented:Bool
    
    var body: some View {
        VStack {
            
            NavigationView {
                List {
                              ForEach(viewModel.restaurants) { restaurant in
                                  NavigationLink(destination: RestoView(name: restaurant.name, image: URL(string: "\(restaurant.photos.mobile.l)"), open: restaurant.open, address: restaurant.address, access: restaurant.access)) {
                                      RestoList(logo_image: URL(string: "\(restaurant.logoImage)"), name: restaurant.name, point: restaurant.genre.point)
                                  }
                              }
                              .onDelete(perform: delete)
                          }
                
                .navigationTitle("Resto")
                
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                isSheetPresented = false
                            } label: {
                                
                            HStack {
                                
                                Image(systemName: "chevron.backward")
                                    
                                Text("Back")
                            }
                                
                            }

                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                                            EditButton()
                                        }
                
            }
            
            
            
            }
            
            
            Button {
                
            }label: {
                Text("Pick")
                    .font(.largeTitle)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                    
            }
            

        }
        
        
    }
    func delete(at offsets: IndexSet) {
            viewModel.restaurants.remove(atOffsets: offsets)
       }

    
    struct RestoListView_Previews: PreviewProvider {
        @Binding var url:URL
        static var previews: some View {
            RestoListView(viewModel: RestaurantsViewModel(), isSheetPresented: .constant(false))
        }
    }
}
