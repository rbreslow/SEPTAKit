# SEPTAKit

SEPTAKit is an iOS framework, written in Swift, to communicate with [SEPTA's Hackathon API](www3.septa.org). **This is still under active development and isn't near completion.**

## Why?

SEPTA's API is a mess. It's inconsistant, clunky, and at times does not conform to JSON specification. This framework strives to achieve the dirty work in interfacing with SEPTA's API so you don't have to.

## Usage

Import the SEPTAKit framework into your project after cloning this repository. *As the repository nears completion this process will be automated via Cocoapods.*

```swift
import SEPTAKit
```

If you'd like to get real time data of the locations of all of SEPTA's Regional Rail trains you could call their API endpoint [/TrainView/](http://www3.septa.org/hackathon/TrainView/). 

To get this data using this framework, start by conforming your ViewController to the TrainViewDelegate protocol.

```swift
class ViewController: UIViewController, TrainViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
```

Implement the TrainViewDelegate protocol's methods.

```swift
class ViewController: UIViewController, TrainViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didLoadData(trains: [Train]) {
        for train in trains {
          println("\(train.dest) #\(train.trainNo)")
          println("Next Stop: \(train.nextStop)")
        }
    }
    
}
```

We can make the API call by running
```swift
SEPTAKit.trainView(self)
```
