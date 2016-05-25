using System;
using ObjCRuntime;

namespace MaterialControls {

	public enum MDButtonType : uint {
		Raised,
		Flat,
		FloatingAction
	}

	[Native]
	public enum MDCalendarMonthSymbolsFormat : long /* nint */ {
		Short = 0,
		Full = 1,
		ShortUppercase = 2,
		FullUppercase = 3
	}

	[Native]
	public enum MDCalendarCellStyle : long /* nint */ {
		Circle = 0,
		Rectangle = 1
	}

	[Native]
	public enum MDCalendarCellState : long /* nint */ {
		Normal = 0,
		Selected = 1,
		Placeholder = 1 << 1,
		Disabled = 1 << 2,
		Today = 1 << 3,
		Weekend = 1 << 4,
		WeekTitle = 1 << 5,
		MonthTitle = 1 << 6,
		Button = 1 << 7
	}

	[Native]
	public enum MDCalendarTheme : long /* nint */ {
		Light = 1,
		Dark = 2
	}

	public enum MDProgressStyle : uint {
		Circular,
		Linear
	}

	public enum MDProgressType : uint {
		Indeterminate,
		Determinate,
		Buffer,
		QueryIndeterminateAndDeterminate
	}

	public enum ViewState : uint {
		NORMAL,
		HIGHLIGHT,
		ERROR,
		DISABLED
	}

	[Native]
	public enum MDCalendarTimeMode : long /* nint */ {
		MDCalendarTimeMode12H,
		MDCalendarTimeMode24H
	}

	[Native]
	public enum MDFontFamilySize : long /* nint */ {
		Regular = 0,
		Bold = 1,
		Light = 2,
		Medium = 3,
		Thin = 4,
		Black = 5
	}

	[Native]
	public enum MDFontFamilyType : long /* nint */ {
		Bold = 1,
		Italic = 2
	}
}

