using System;
using Cirrious.MvvmCross.Platform;
using Cirrious.MvvmCross.Touch.Platform;
using Cirrious.MvvmCross.Touch.Views.Presenters;
using Cirrious.MvvmCross.ViewModels;
using MaterialControls.Core;
using MaterialControls;

namespace MaterialControls.iOS
{
	public class Setup:MvxTouchSetup
	{
		public Setup (MvxApplicationDelegate appDelegate, IMvxTouchViewPresenter presenter)
			: base(appDelegate, presenter)
		{
		}

		protected override IMvxApplication CreateApp ()
		{
			return new App();
		}
	}
}

