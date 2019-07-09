//
//  ViewController.swift
//  UserInterface
//
//  Created by Will Nickson on 09/07/2019.
//  Copyright © 2019 find-my-face. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    private var documents: [DocumentSnapshot] = []
    public var photographers: [Photographer] = []
    private var listener : ListenerRegistration!
    
    fileprivate func baseQuery() -> Query {
        return Firestore.firestore().collection("Photographers").limit(to: 5)
    }
    
    fileprivate var query: Query? {
        didSet {
            if let listener = listener {
                listener.remove()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.query = baseQuery()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
    }
    
    @objc func handleLogout() {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.listener.remove()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.listener =  query?.addSnapshotListener { (documents, error) in
            guard let snapshot = documents else {
                print("Error fetching documents results: \(error!)")
                return
            }
            
            let results = snapshot.documents.map { (document) -> Photographer in
                if let photographer = Photographer(dictionary: document.data(), id: document.documentID) {
                    return photographer
                } else {
                    fatalError("Unable to initialize type \(Photographer.self) with dictionary \(document.data())")
                }
            }
            
            self.photographers = results
            self.documents = snapshot.documents
            self.tableView.reloadData()
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photographers.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = photographers[indexPath.row]
        
        cell.textLabel!.text = item.username
        
        return cell
    }
    
}





