//
//  ViewController.swift
//  CoreDataSaveString
//
//  Created by Chien on 4/24/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            let context = try AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity]
            inputTextField.text = context?.last?.myString
        } catch  {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        let entity = Entity(context: AppDelegate.context)
        entity.myString = inputTextField.text
        AppDelegate.saveContext()
    }
    

}

