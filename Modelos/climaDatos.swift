//
//  climaDatos.swift
//  ClimaApp
//
//  Created by UNAM FCA 01 on 25/05/22.
//

import Foundation


//Protocolo Decodable para decodificar datos externos
struct ClimaDatos: Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
    
}

struct Main: Decodable{
    let temp: Double
}

struct Weather: Decodable{
    let description: String
    let id: Int
    
}

