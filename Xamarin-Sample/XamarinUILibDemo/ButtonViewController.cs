
using System;
using CoreGraphics;

using Foundation;
using UIKit;
using iOSUILib;

namespace XamarinUILibDemo
{
	public partial class ButtonViewController : UIViewController
	{
		public ButtonViewController () : base ("ButtonViewController", null)
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

//			RaisedButton.BackgroundColor = MDColor.co

//			RaisedButton.BackgroundColor = UIColor.Blue;
//			MDButton raisedButton = new MDButton (new RectangleF (100, 100, 120, 40), MDButtonType.Raised,null);
//			raisedButton.SetTitle("Raised",UIControlState.Normal);
//			raisedButton.SetTitleColor (UIColor.Black, UIControlState.Normal);
//			View.Add (raisedButton);

//
//			MDButton flatButton = new MDButton (new RectangleF (100, 200, 120, 40), MDButtonType.Flat,UIColor.Orange);
//			flatButton.SetTitle("Flat",UIControlState.Normal);
//			flatButton.SetTitleColor (UIColor.Black, UIControlState.Normal);
//			View.Add (flatButton);
//
//			MDButton floatingButton = new MDButton (new RectangleF (110, 300, 100, 100), MDButtonType.FloatingAction,UIColor.Blue);
//			floatingButton.SetTitle("Floating",UIControlState.Normal);
//			floatingButton.BackgroundColor = UIColor.Red;
//			View.Add (floatingButton);
		}
	}
}

