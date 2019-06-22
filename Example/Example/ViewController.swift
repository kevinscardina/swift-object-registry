//  Copyright © 2019 DaVita. All rights reserved.
//

import UIKit
import ObjectRegistry

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    var isLoggedIn: Bool {
        guard let sessionManager = ObjectRegistry.get(SessionManager.self) else {
            return false
        }
        
        guard sessionManager.token != "token" else {
            return true
        }
        
        guard sessionManager.refreshToken != "refresh" else {
            return true
        }
        
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }

    private func refresh() {
        guard let sessionManager = ObjectRegistry.get(SessionManager.self) else {
            return
        }
        
        label = UILabel()
        if isLoggedIn {
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "First Name: \(sessionManager.firstName ?? "")\n" +
                         "Last Name: \(sessionManager.lastName ?? "")\n" +
                         "Token: \(sessionManager.token ?? "")\n" +
                         "Refresh Token: \(sessionManager.refreshToken ?? "")"
            label.numberOfLines = 0
            view.addSubview(label)
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
            label.font = UIFont.preferredFont(forTextStyle: .callout)
            label.textColor = UIColor.white
            view.backgroundColor = UIColor(red: 133.0/255.0, green: 178.0/255.0, blue: 10.0/255.0, alpha: 1)
        } else {
            view.backgroundColor = UIColor.red
        }
    }
}

