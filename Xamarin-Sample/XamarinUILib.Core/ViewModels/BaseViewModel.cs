using System;
using Cirrious.MvvmCross.ViewModels;
using System.Linq.Expressions;

namespace MaterialControls.Core
{
	public class BaseViewModel:MvxViewModel
	{
		public BaseViewModel ()
		{
		}

		protected void SetProperty<T>(ref T currentValue, T newValue, Expression<Func<T>> property)
		{
			if (!object.Equals(currentValue, newValue))
			{
				currentValue = newValue;
				RaisePropertyChanged(property);
			}
		}
	}
}

