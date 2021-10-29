# UIView-Pop-Up

ATTENTION: think if you are here.
Why aren't you using the viewController popUp present?

popup UIView with some background on top of UIViewController
after touchesEnded on background, UIView will close or call your clojure

![toGif (1)](https://user-images.githubusercontent.com/47589216/138355621-275f0266-ff51-4bde-b79c-f508549c19e7.gif)

Usage:
in UIViewController

    self.showSubview(upperView: YOUR_UI_VIEW, completion: .close)

or:

    self.showSubview(upperView: offlineMaps, completion: .custom(complition: {
            print("some code")
        }))
