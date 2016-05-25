
using System;

using Foundation;
using UIKit;
using MaterialControls.Core;
using MaterialControls;

namespace MaterialControls.iOS
{
	public partial class ToastView : BaseView<ToastViewModel>
	{
		public ToastView () : base ("ToastView", null)
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
			
			// Perform any additional setup after loading the view, typically from a nib.
		}

		partial void ButtonClicked (NSObject sender)
		{
			string text = MessageTextField.Text;
			if(String.IsNullOrWhiteSpace(text)){
				MDToast toast = new MDToast("Enter message to text field above",MDToast.DurationShort);
				toast.Show();
			} else {
				MDToast toast = new MDToast(text,MDToast.DurationShort);
				toast.Show();
			}
		}
	}
}

