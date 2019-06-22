//  Copyright © 2019 DaVita. All rights reserved.
//

import Foundation

class SessionManager {
    var firstName: String?
    var lastName: String?
    var token: String?
    var refreshToken: String?

    init(firstName: String? = nil, lastName: String? = nil,
         token: String? = nil, refreshToken: String? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.token = token
        self.refreshToken = refreshToken
    }
}
