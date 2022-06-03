//
//  ViewController.swift
//  ClimaApp
//
//  Created by Argonza 01 on 24/05/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ClimaManagerDelegado {

    
    var climaManager = ClimaManager( )
    
//UITextFieldDelegate es  un protocolo para identificar cuando el usuario realiza una busqueda
    @IBOutlet weak var txtCiudad: UITextField!
    @IBOutlet weak var condicionClimaImageView: UIImageView!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var ciudadLabel: UILabel!
    @IBOutlet weak var txtDescription: UILabel!
    @IBOutlet weak var ImageViewFondo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Establecer esta clase como el delegado del ClimaManager
        climaManager.delegado = self
        txtCiudad.delegate = self
    }
 
//Método para el boton buscar
    
    @IBAction func buscarButton(_ sender: UIButton) {
        //Ocultar teclado virtual
        txtCiudad.endEditing(true)
        print(txtCiudad.text!)
    }

//Métodos del delegado
    //Método que se activa cuando el usuario busca un texto y presiona en el teclado
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Ocultar teclado virtual
        //imprime el texto
        txtCiudad.endEditing(true)
        print(txtCiudad.text!)
        //Realizar búsqueda con la Api
        return true
    }
    
    //Metodo que identifica cuando el usuario deja de escribir
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if txtCiudad.text != "" {
            return true
        } else {
            txtCiudad.placeholder = "Ingresa una ciudad ..."
            return false
        }
    }

    //Metodo para limpiar el textfield cuando el usuario completa la búsqueda
    func textFieldDidEndEditing(_ textField: UITextField) {
        climaManager.buscarClima(ciudad: txtCiudad.text! )
        txtCiudad.text = ""
    }
    
    //Actualizar Clima e Interface de usuario 
    func actualizarClima(clima: ClimaModelo) {
        
        DispatchQueue.main.async {
            //Agregar datos a la pantalla del usuario
            self.temperaturaLabel.text = clima.tempString
            self.ciudadLabel.text = clima.nombreCiudad
            self.condicionClimaImageView.image = UIImage(systemName: clima.condicionClima)
            self.txtDescription.text = clima.description
            
            self.ImageViewFondo.image = UIImage(named: clima.condicionClima2)
        }
    }
}

