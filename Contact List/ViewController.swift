//
//  ViewController.swift
//  Contact List
//
//  Created by MacBook Prp on 01/08/2018.
//  Copyright © 2018 Native Brains. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //MARK: - Contact Function Call
        fetchContacts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchContacts(){
        
        print("Attempt Fetching Contacts ")
        
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                print("Error : - \(err)")
            }
            if granted {
                print("acces")
                let keys  = [CNContactGivenNameKey,CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                
                do {
                    try store.enumerateContacts(with: request, usingBlock: { (contact, StopIfYouWantToStopEnum) in
                        
                        print(contact.givenName)
                        print(contact.phoneNumbers.first?.value.stringValue ?? "")
                        
                    })
                    
                }catch let err {
                    
                    print("request error in fetching ",err)
                    
                }
                
                
                
            }else{
                print("denied")
            }
        }
        
        
        
    }


}

