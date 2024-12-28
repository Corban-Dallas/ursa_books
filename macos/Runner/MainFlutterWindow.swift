import Cocoa
import FlutterMacOS

 class MainFlutterWindow: NSWindow {
    
     override func awakeFromNib() {
         let flutterViewController = FlutterViewController.init()
         let windowFrame = self.frame
         self.contentViewController = flutterViewController
         self.setFrame(windowFrame, display: true)
         RegisterGeneratedPlugins(registry: flutterViewController)
         super.awakeFromNib()
     }
    
     override func toggleFullScreen(_ sender: Any?) {
         toolbar?.isVisible = styleMask.contains(.fullScreen)
         super.toggleFullScreen(sender)
     }
 }
