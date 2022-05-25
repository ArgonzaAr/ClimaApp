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
        //Creación de URL con variable segura
        if let url = URL(string: urlString){
            //Crear URLSession
            let session = URLSession(configuration: .default)
            //Asignación de tarea a urlsession
            let tarea = session.dataTask(with: url){
                (datos, respuesta, error) in
                if error != nil{
                    print("Error al obtener los datos \(error!)")
                    return
                }
                
                if let datosSeguros = datos {
                    //Método para parsear JSON
                    self.parsearJSON (datosClima: datosSeguros)
                }
            }
            
            tarea.resume()
        }
    }
    
    func parsearJSON(datosClima: Data){
        //Crear decoficador JSON para ordenar los datos
        let decodificador = JSONDecoder()
        do {
            let datosDecodificados = try decodificador.decode(ClimaDatos.self, from: datosClima)
            //Imprimir los datos de API en un formato específico
            print("La ciudad buscada es: \(datosDecodificados.name)")
            print ("La temperatura es de: \(datosDecodificados.main.temp)")
            print ("La descripción es: \(datosDecodificados.weather[0].description)")
        } catch  {
            print ("Error al decodificar datos de JSON: \(error.localizedDescription)")
        }
    }
}
