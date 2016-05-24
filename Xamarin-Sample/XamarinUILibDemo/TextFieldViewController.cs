
using System;

using Foundation;
using UIKit;
using iOSUILib;
using CoreGraphics;
using System.Diagnostics;

namespace XamarinUILibDemo
{
	public partial class TextFieldViewController : UIViewController
	{
		public TextFieldViewController () : base ("TextFieldViewController", null)
		{
		}

		public override void DidReceiveMemoryWarning ()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning ();
			
			// Release any cached data, images, etc that aren't in use.
		}

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			TextField.SecureTextEntry = true;
			TextField.SingleLine = true;
		}
		public override void ViewDidAppear (bool animated)
		{
			base.ViewDidAppear (animated);
		}
	}
}

