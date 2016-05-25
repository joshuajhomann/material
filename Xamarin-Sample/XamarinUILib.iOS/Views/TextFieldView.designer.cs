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
	[Register ("TextFieldView")]
	partial class TextFieldView
	{
		[Outlet]
		MaterialControls.MDTextField LimitedLengthTextField { get; set; }

		[Outlet]
		MaterialControls.MDTextField MultiLineTextField { get; set; }

		[Outlet]
		UIKit.UITextField TestText { get; set; }

		[Outlet]
		MaterialControls.MDTextField TextField { get; set; }

		[Action ("change:")]
		partial void change (Foundation.NSObject sender);
		
		void ReleaseDesignerOutlets ()
		{
			if (TestText != null) {
				TestText.Dispose ();
				TestText = null;
			}

			if (LimitedLengthTextField != null) {
				LimitedLengthTextField.Dispose ();
				LimitedLengthTextField = null;
			}

			if (MultiLineTextField != null) {
				MultiLineTextField.Dispose ();
				MultiLineTextField = null;
			}

			if (TextField != null) {
				TextField.Dispose ();
				TextField = null;
			}
		}
	}
}
