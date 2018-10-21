import UIKit

class CellDescViewController: UIViewController {

    
    @IBOutlet var Name: UITextField!
    @IBOutlet var Desc: UITextView!
    @IBOutlet var Loc:  UITextField!
    @IBOutlet var Prior: UISegmentedControl!
    @IBOutlet var Cat: UISegmentedControl!
    @IBOutlet var Update: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Name.text = taskMgr.tasks[selectedCellNumber].name
        Desc.text = taskMgr.tasks[selectedCellNumber].desc
        Loc.text = taskMgr.tasks[selectedCellNumber].loc
        
        Prior.selectedSegmentIndex = taskMgr.tasks[selectedCellNumber].priority
        
        if taskMgr.tasks[selectedCellNumber].cat == "Home" {
            Cat.selectedSegmentIndex = 0
        }
        else if taskMgr.tasks[selectedCellNumber].cat == "School" {
            Cat.selectedSegmentIndex = 1
        }
        else {
            Cat.selectedSegmentIndex = 2
        }
        
    }
    
    //Update
    @IBAction func buttonUpdate_Click(sender: UIButton) {
        
        let prior = Prior.titleForSegment(at: Prior.selectedSegmentIndex)
        var priorNum = 0
        if prior == "Low" {
            priorNum = 0
        }
        else if prior == "Medium" {
            priorNum = 1
        }
        else {
            priorNum = 2
        }
        let category = Cat.titleForSegment(at: Cat.selectedSegmentIndex)
        
        taskMgr.updateTask(name: Name.text!, desc: Desc.text!, loc: Loc.text!, priority: priorNum, cat: category!, index: selectedCellNumber)
        
    }
    
    
    //go back to tasj list
    @IBAction func goToTaskList(sender: AnyObject) {
        performSegue(withIdentifier: "DetailsToList", sender: self)
    }
}
