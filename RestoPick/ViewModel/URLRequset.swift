//
//  URLRequset.swift
//  RestoPick
//
//  Created by ZML on 2023/06/23.
//

import Foundation
import CoreLocation

class URLRequset:ObservableObject {
    
   
    
    func createURL(lat: String, lng: String,range:Int, count: Int,order:Int) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "webservice.recruit.co.jp"
        urlComponents.path = "/hotpepper/gourmet/v1/"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: "6ca6c3fab7e6adaf"),
            URLQueryItem(name: "lat", value: "\(lat)"),
            URLQueryItem(name: "lng", value: "\(lng)"),
            URLQueryItem(name: "range", value:"\(range)"),
            URLQueryItem(name: "count", value: "\(count)"),
            URLQueryItem(name: "format", value: "json")
        ]
        if order == 0 {
            urlComponents.queryItems?.append(URLQueryItem(name: "order", value: "4"))
        }
        
        return urlComponents.url
    }
    
    func createURL(keyword:String,range:Int, count: Int,order:Int) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "webservice.recruit.co.jp"
        urlComponents.path = "/hotpepper/gourmet/v1/"
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: "6ca6c3fab7e6adaf"),
            URLQueryItem(name: "keyword", value:"\(keyword)"),
            URLQueryItem(name: "range", value:"\(range)"),
            
            URLQueryItem(name: "count", value: "\(count)"),
            URLQueryItem(name: "format", value: "json")
        ]
        if order == 0 {
            urlComponents.queryItems?.append(URLQueryItem(name: "order", value: "4"))
        }
        
        return urlComponents.url
    }

    
    
    
}
