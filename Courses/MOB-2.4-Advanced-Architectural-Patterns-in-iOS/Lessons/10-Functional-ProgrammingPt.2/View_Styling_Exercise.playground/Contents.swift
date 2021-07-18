import UIKit
import PlaygroundSupport
precedencegroup ForwardApplication
{
    associativity: left
    higherThan: AssignmentPrecedence
}
precedencegroup ForwardComposition
{
    associativity: left
    higherThan: ForwardApplication
}
infix operator |>: ForwardApplication
infix operator >>>: ForwardComposition
func |> <A, B>(a: A, f: (A) -> B) -> B
{
    return f(a)
}
func >>> <A, B, C>(f: @escaping (A) -> B,
                   g: @escaping (B) -> C) -> ((A) -> C)
{
    return { a in
        a |> f |> g
    }
}
func applyable<T>(_ fnc: @escaping (T) -> Void) -> (T) -> T
{
    return { fnc($0); return $0 }
}
struct ViewStyle
{
    typealias Styling = (UIView) -> UIView
    static func style(color: UIColor,
                      frame: CGRect,
                      enabled: Bool) -> Styling
    {
        return {
            $0 |> applyable { $0.backgroundColor = color}
                >>> applyable { $0.frame = frame }
                >>> applyable { $0.isUserInteractionEnabled = enabled }
        }
    }
    static var style2: Styling {
        return style(color: .blue,
                     frame: CGRect(x: 10, y: 10, width: 30, height: 30),
                     enabled: true)
    }
}
class MyViewController : UIViewController
{
    override func loadView()
    {
        let view = UIView()
        view.backgroundColor = .white
        let myBtn = UIButton() |> ViewStyle.style(color: .red, frame: CGRect(x: 50, y: 10, width: 30, height: 30), enabled: true)
        let otherBtn = UIButton() |> ViewStyle.style2
        view.addSubview(myBtn)
        view.addSubview(otherBtn)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
