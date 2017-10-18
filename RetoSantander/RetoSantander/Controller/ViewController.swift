//
//  ViewController.swift
//  RetoSantander
//
//  Created by Cesar on 17/10/2017.
//  Copyright © 2017 Accenture, S.L. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    //Array de noticias
    var newsBBC:[NewBBC] = [NewBBC]()
    //Array de noticias filtradas
    var filteredNewsBBC = [NewBBC]()

    //Variable que indica si estamos en modo búsqueda
    var inSearchMode = false
    
    let dataProvider = LocalCoreDataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Asignación de los distintos de delegados necesarios
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
                
        //Método que oculta el teclado cuando se pulsa en cualquier lugar de la pantalla
        self.hideKeyboardWhenTappedAround()
        //Añade sombra a la barra de navegación
        self.addShadowNavigationBar()
        
        loadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Para iOs 11 añade top a la navigation bar para que no solape al resto del contenido
        if #available(iOS 11.0, *) {
            self.additionalSafeAreaInsets.top = 10
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Si estamos en modo búsqueda devolvémos el número de elementos filtrados
        if inSearchMode {
            return filteredNewsBBC.count
        //En caso contrario devolvemos el número de todas las noticias
        } else {
            return newsBBC.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewCell", for: indexPath) as? NewCell {
            //Si estamos en modo búsqueda devolvemos el elemento correspondiente del array de filtrados
            if inSearchMode {
                let newBBC = filteredNewsBBC[indexPath.row]
                cell.configureCell(new: newBBC)
            //En caso contrario, el elemento correspondiente del array de todas las noticias
            } else {
                let newBBC = newsBBC[indexPath.row]
                cell.configureCell(new: newBBC)
            }
            return cell
        } else {
            return NewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var newBBC: NewBBC!
        //Si estamos en modo búsqueda pasamos los datos del elemento filtrado correspondiente
        if inSearchMode {
            newBBC = filteredNewsBBC[indexPath.row]
        //En caso contrario, pasamos los datos del elemento correspondiente
        } else {
            newBBC = newsBBC[indexPath.row]
        }
        performSegue(withIdentifier: "DetailVC", sender: newBBC)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //Si la caja de búsqueda no contiene ningún texto
        if (searchBar.text == nil || searchBar.text == "") {
            inSearchMode = false
            tableView.reloadData()
        //En caso contrario, filtramos por el título de la noticia
        } else {
            inSearchMode = true
            filteredNewsBBC = newsBBC.filter({$0.title!.lowercased().range(of: searchBar.text!.lowercased()) != nil})
            tableView.reloadData()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let detailVC = segue.destination as? DetailVC {
            if let newBBC = sender as? NewBBC {
                detailVC.newBBC = newBBC
            }
        }
    }
    
    func loadData () {
        dataProvider.getBBC_News(localHandler: { news in
            
            if let news = news {
                self.newsBBC = news
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }else {
                
                print("No hay registros en Core Data")
            }
            
        }, remoteHandler: { news in
            if let news = news {
                self.newsBBC = news
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        })
        
    }
    


}


