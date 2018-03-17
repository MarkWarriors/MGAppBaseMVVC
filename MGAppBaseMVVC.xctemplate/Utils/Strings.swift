//___FILEHEADER___

import Foundation

class ___FILEBASENAMEASIDENTIFIER___ {
    
	public static let empty = ""

	static func notNullOrEmpty(_ string: String?) -> Bool{
        return string != nil && string != empty
    }
    
    /* SAMPLE
        struct Errors {
            public static let noInternetConnection = "No internet connection available".localized
            public static let genericError = "An error occurred".localized
        }
    */
}
