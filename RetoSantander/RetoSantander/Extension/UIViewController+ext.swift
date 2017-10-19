//
//  UIViewController+Ext.swift
//  SharePointEndesa
//
//  Created by iOSDev2 on 18/10/2017.
//  Copyright © 2017 José Ignacio Sanz García. All rights reserved.
//

import UIKit

extension UIViewController: UISearchBarDelegate {
    
    //Oculta el teclado cuando se pulsa en cualquier lugar de la pantalla
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    //Añade sombra en la barra de navegación
    func addShadowNavigationBar() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 5.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        //self.navigationController?.navigationBar.setTitleVerticalPositionAdjustment(-5, for: .default)  
    }
    
    
    //Oculta el teclado
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    //Oculta el teclado cuando pulsamos en el submit botón del teclado abierto para la barra de búsqueda
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
    }
}

