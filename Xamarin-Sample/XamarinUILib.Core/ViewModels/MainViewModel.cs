using System;
using Cirrious.MvvmCross.ViewModels;
using System.Collections.ObjectModel;

namespace MaterialControls.Core
{
	public class MainViewModel:BaseViewModel
	{
		public readonly string[] Controls = { "Button", "TextField", "ProgressBar", "Switch", "TableViewCell", 
			"CollectionViewCell", "DatePicker", "DatePickerDialog", "TimePickerDialog", "TabBar", 
			"TabBarViewController", "Snackbar", "Toast", "Slider"
		};

		public MainViewModel ()
		{
			
		}

		public override void Start ()
		{
			base.Start ();
			Titles = new ObservableCollection<string> (Controls);
			Title = "Test title";
		}

		ObservableCollection<string> titles;
		public ObservableCollection<string> Titles 
		{
			get { return titles;}
			set { SetProperty (ref titles, value, () => Titles);}
		}

		string title;
		public string Title
		{
			get { return title;}
			set {SetProperty (ref title, value, () => Title);}
		}

		MvxCommand<string> itemSelectedCommand;
		public MvxCommand<string> ItemSelectedCommand 
		{
			get {
				itemSelectedCommand = itemSelectedCommand ?? new MvxCommand<string> (itemSelected);
				return itemSelectedCommand;
			}
		}

		private void itemSelected(string item) {
			if (item.Equals ("TextField")) {
				ShowViewModel<TextFieldViewModel> ();
			} if (item.Equals ("Button")) {
				ShowViewModel<ButtonViewModel> ();
			} if (item.Equals ("ProgressBar")) {
				ShowViewModel<ProgressViewModel> ();
			} if (item.Equals ("Switch")) {
				ShowViewModel<SwitchViewModel> ();
			} if (item.Equals ("TableViewCell")) {
				ShowViewModel<TableViewViewModel> ();
			} if (item.Equals ("CollectionViewCell")) {
				ShowViewModel<CollectionViewViewModel> ();
			} if (item.Equals ("DatePicker")) {
				ShowViewModel<DatePickerViewModel> ();
			} if (item.Equals ("DatePickerDialog")) {
				ShowViewModel<DatePickerDialogViewModel> ();
			} if (item.Equals ("TimePickerDialog")) {
				ShowViewModel<TimePickerDialogViewModel> ();
			} if (item.Equals ("TabBar")) {
				ShowViewModel<TabBarViewModel> ();
			} if (item.Equals ("TabBarViewController")) {
				ShowViewModel<TabBarViewControllerViewModel> ();
			} if (item.Equals ("Snackbar")) {
				ShowViewModel<SnackBarViewModel> ();
			} if (item.Equals ("Toast")) {
				ShowViewModel<ToastViewModel> ();
			} if (item.Equals ("Slider")) {
				ShowViewModel<SliderViewModel> ();
			} 
		}
	}
}

