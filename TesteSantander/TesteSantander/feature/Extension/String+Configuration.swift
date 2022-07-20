import UIKit

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    var underLined: NSAttributedString {
        let attr = NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        attr.addAttribute(.link, value: "", range: NSRange(location: 0, length: self.count))
        return attr
    }
    
    func underlined(offBySet: Int) -> NSMutableAttributedString {
        let attr = NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        attr.addAttribute(.link, value: "", range: NSRange(location: 0, length: offBySet))
        return attr
    }
    
    func substring(offBySet: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: offBySet)
        return String(self[..<index])
    }
}
