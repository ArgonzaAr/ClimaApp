//
//  ClimaModelo.swift
//  ClimaApp
//
//  Created by UNAM FCA 03 on 26/05/22.
//

import Foundation

struct ClimaModelo{
    let temp: Double
    let nombreCiudad: String
    let id: Int
    
    //Propiedades calculadas, calcula un parametro y lo asigna al objeto
    var tempString: String{
        return String(format:"%.1f", temp)
    }
    
    
    var condicionClima: String{
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.hail"
        case 500...531:
            return "cloud.sleet"
        case 600...622:
            return "snow"
        case 701...781:
            return "sun.dust"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.sun"
        default:
            return "cloud"
            
        }
    }
    
    //Fin de propiedades calculadas
}
