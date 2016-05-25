// WARNING
//
// This file has been generated automatically by Xamarin Studio to store outlets and
// actions made in the UI designer. If it is removed, they will be lost.
// Manual changes to this file may not be handled correctly.
//
using Foundation;
using System.CodeDom.Compiler;

namespace MaterialControls.iOS
{
	[Register ("ToastView")]
	partial class ToastView
	{
		[Outlet]
		UIKit.UITextField MessageTextField { get; set; }

		[Action ("ButtonClicked:")]
		partial void ButtonClicked (Foundation.NSObject sender);
		
		void ReleaseDesignerOutlets ()
		{
			if (MessageTextField != null) {
				MessageTextField.Dispose ();
				MessageTextField = null;
			}
		}
	}
}
