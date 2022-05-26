//
//  Climamanager.swift
//  ClimaApp
//
//  Created by Argonza 01 on 25/05/22.
//
//Archivo para manipulación de la API

import Foundation

//protocolo Clima manager
protocol ClimaManagerDelegado {
    func actualizarClima(clima: ClimaModelo)
}

struct ClimaManager {
    
    let climaURL = "https://api.openweathermap.org/data/2.5/weather?&appid=04478d353b2538bb3c8469ee2988f5e8&units=metric&lang=es"
    
    //Quien sea delegado deberá implementar este protocolo
    var delegado: ClimaManagerDelegado?
    
    
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
                    if let objetoClima = self.parsearJSON (datosClima: datosSeguros){
                        //Mandar el objeto al ViewController
                        //let ClimaVC = ViewController()
                        //ClimaVC.actualizarClima(objetoClima: objetoClima)
                        
                        //Designar un delegado
                        self.delegado?.actualizarClima(clima: objetoClima)
                    }
                        
                }
            }
            
            tarea.resume()
        }
    }
    
    func parsearJSON(datosClima: Data) -> ClimaModelo? {
        //Crear decoficador JSON para ordenar los datos
        let decodificador = JSONDecoder()
        do {
            let datosDecodificados = try decodificador.decode(ClimaDatos.self, from: datosClima)
            //Imprimir los datos de API en un formato específico
            let id = datosDecodificados.weather[0].id
            let ciudad = datosDecodificados.name
            let temp = datosDecodificados.main.temp
            
            //Objeto Clima
            let objetoClima = ClimaModelo(temp: temp, nombreCiudad:  ciudad, id: id)
            
            //Objeto para cambiar de imagen
            print(objetoClima.condicionClima)
            print(objetoClima.temp)
            
            return objetoClima
            
        } catch  {
            print ("Error al decodificar datos de JSON: \(error.localizedDescription)")
            return nil
        }
    }
    
}
