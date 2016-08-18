import UIKit
import RealmSwift

class ChatViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var SendChatTextField: UITextField!
    @IBOutlet weak var NavigationLabel: UINavigationItem!
    @IBOutlet weak var MessageTextFieldLabel: UITextField!
    
    let realm = try! Realm()
    var friend = Friend()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(friend)
        self.CollectionView.dataSource = self
        self.CollectionView.delegate = self
        self.NavigationLabel.title =  friend.firstname
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // telling the controller to use the reusuable 'receivecell' from chatCollectionViewCell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ReceiveCell",
            forIndexPath: indexPath) as! ChatCollectionViewCell
        
        // use this cell for all received chats
        cell.receiveChatLabel.layer.cornerRadius = 5
        cell.receiveChatLabel.layer.masksToBounds = true
        
        // use this cell for chats user sends
        // cell.sendChatLabel.layer.cornerRadius = 5
        // cell.sendChatLabel.layer.masksToBounds = true
        
        // sample chat
        cell.receiveChatLabel.text = "YOO0000000000 WHATS GOING ON"
        return cell
    }
 
    @IBAction func sendButtonTapped(sender: AnyObject) {
        let message = Message()
        message.text = self.MessageTextFieldLabel.text!
        message.receiver = "jae"
        
        try! realm.write {
            realm.add(message)
            let sent = realm.objects(Message)
            print(sent)
        }
    }
    
  }
