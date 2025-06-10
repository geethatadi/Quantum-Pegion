import Foundation
import UIKit

class CreateChannelViewModel {
    
    var channel = ChannelModel(name: "", description: "", tags: "", imageData: nil)
    
    func isFormValid() -> Bool {
        return !channel.name.isEmpty
    }

    func submitChannel(completion: (Bool) -> Void) {
        // Here you’d typically send data to an API
        if isFormValid() {
            print("Channel Created: \(channel)")
            completion(true)
        } else {
            completion(false)
        }
    }
}
