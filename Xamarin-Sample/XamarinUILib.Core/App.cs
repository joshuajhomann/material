using System;
using Cirrious.MvvmCross.ViewModels;
using Cirrious.CrossCore;

namespace MaterialControls.Core
{
	public class App:MvxApplication
	{
		public App ()
		{
			var appStart = new MvxAppStart<MainViewModel>();
			Mvx.RegisterSingleton<IMvxAppStart>(appStart);
		}
	}
}

