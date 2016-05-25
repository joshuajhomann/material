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
	[Register ("ProgressView")]
	partial class ProgressView
	{
		[Outlet]
		MaterialControls.MDProgress CircularProgress { get; set; }

		[Outlet]
		MaterialControls.MDProgress LinearProgress { get; set; }
		
		void ReleaseDesignerOutlets ()
		{
			if (LinearProgress != null) {
				LinearProgress.Dispose ();
				LinearProgress = null;
			}

			if (CircularProgress != null) {
				CircularProgress.Dispose ();
				CircularProgress = null;
			}
		}
	}
}
