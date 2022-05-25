//
//  Climamanager.swift
//  ClimaApp
//
//  Created by Argonza 01 on 25/05/22.
//
//Archivo para manipulación de la API

import Foundation

struct ClimaManager {
    let climaURL = "https://api.openweathermap.org/data/2.5/weather?&appid=04478d353b2538bb3c8469ee2988f5e8"
    
    func buscarClima (ciudad: String){
        let urlString = "\(climaURL)&q=\(ciudad)"
        realizarSolicitud(urlString: urlString)
    }
    
    func realizarSolicitud(urlString: String){
        
    }
}
