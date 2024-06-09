import SwiftUI

///   Enum of Animation type of Loading View
///   standard    -  Standard Activity Indicator Provided by iOS Framework
///   circleArc  -  Show the Circle Arc fill Animation
///   circleFill  -  Show the Circle Fill Animation

public enum iOSLoaderActivityIndicatorType: Int{
    case standard
    case circleArc
    case circleFill
}

@available(iOS 14, macOS 11.0, *)
public struct iOSLoader<Content>: View where Content: View  {
    @Binding var isAnimating: Bool
    public typealias ViewContent = () -> Content
    var content: ViewContent
    fileprivate var loaderSize = CGSize(width: 150, height: 150)
    fileprivate var activityType: iOSLoaderActivityIndicatorType
    
    public init(show: Binding<Bool>, type: iOSLoaderActivityIndicatorType = .standard, @ViewBuilder content: @escaping ViewContent) {
        _isAnimating = show
        self.activityType = type
        self.content = content
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.content()
                    .disabled(self.isAnimating)
                    .blur(radius: self.isAnimating ? 3 : 0)

                VStack(alignment: .center) {
                    SwiftUIActivityView(activityIndicator: self.activityType, isAnimating: _isAnimating).frame(width: 40, height: 40)
                    Text("Loading...")
                }
                .frame(width: loaderSize.width,
                       height: loaderSize.height)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isAnimating ? 1 : 0)
            }
        }
    }
}

