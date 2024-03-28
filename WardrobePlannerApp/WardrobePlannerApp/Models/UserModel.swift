import Foundation

struct User {
    enum Process {
        case none
        case registration
        case authorization
    }
    
    var proccess: Process = .none
    
    var email: String = ""
    var verificationCode: String = ""
    var password: String = ""
    var name: String = ""
    var id: Int = -1
    
    var imageBase64String: String = ""
}
