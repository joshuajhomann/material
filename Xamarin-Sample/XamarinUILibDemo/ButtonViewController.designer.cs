// WARNING
//
// This file has been generated automatically by Xamarin Studio to store outlets and
// actions made in the UI designer. If it is removed, they will be lost.
// Manual changes to this file may not be handled correctly.
//
using Foundation;
using System.CodeDom.Compiler;

namespace XamarinUILibDemo
{
	[Register ("ButtonViewController")]
	partial class ButtonViewController
	{
		[Outlet]
		iOSUILib.MDButton FlatButton { get; set; }

		[Outlet]
		iOSUILib.MDButton FloatingButton { get; set; }

		[Outlet]
		iOSUILib.MDButton RaisedButton { get; set; }
		
		void ReleaseDesignerOutlets ()
		{
			if (FlatButton != null) {
				FlatButton.Dispose ();
				FlatButton = null;
			}

			if (FloatingButton != null) {
				FloatingButton.Dispose ();
				FloatingButton = null;
			}

			if (RaisedButton != null) {
				RaisedButton.Dispose ();
				RaisedButton = null;
			}
		}
	}
}
