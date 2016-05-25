using System;
using System.Drawing;

using UIKit;
using Foundation;
using ObjCRuntime;
using CoreGraphics;
using System.ComponentModel;
using CoreAnimation;

namespace MaterialControls {

	// @interface MDButton : UIButton
	[BaseType (typeof (UIButton))]
	interface MDButton {

		// -(id)initWithFrame:(CGRect)frame type:(enum MDButtonType)buttonType rippleColor:(UIColor *)rippleColor;
		[Export ("initWithFrame:type:rippleColor:")]
		IntPtr Constructor (CGRect frame, MDButtonType buttonType, UIColor rippleColor);

		// @property (nonatomic) UIColor * rippleColor;
		[Export ("rippleColor")]
		UIColor RippleColor { get; set; }

		// @property (nonatomic) int type;
		[Export ("type")]
		int Type { get; set; }

		// @property (nonatomic) enum MDButtonType mdButtonType;
		[Export ("mdButtonType")]
		MDButtonType MdButtonType { get; set; }

		// @property (nonatomic, getter = isEnabled) BOOL enabled;
		[Export ("enabled")]
		bool Enabled { [Bind ("isEnabled")] get; set; }
	}

	// @protocol MDCalendarDateHeaderDelegate
	[Protocol, Model]
	[BaseType (typeof (NSObject))]
	interface MDCalendarDateHeaderDelegate {

		// @required -(void)didSelectCalendar;
		[Export ("didSelectCalendar")]
		[Abstract]
		void DidSelectCalendar ();

		// @required -(void)didSelectYear;
		[Export ("didSelectYear")]
		[Abstract]
		void DidSelectYear ();
	}

	// @interface MDCalendarDateHeader : UIView
	[BaseType (typeof (UIView))]
	interface MDCalendarDateHeader {

		// @property (nonatomic) UILabel * labelDayName;
		[Export ("labelDayName")]
		UILabel LabelDayName { get; set; }

		// @property (nonatomic) UILabel * labelMonthName;
		[Export ("labelMonthName")]
		UILabel LabelMonthName { get; set; }

		// @property (nonatomic) UILabel * labelDate;
		[Export ("labelDate")]
		UILabel LabelDate { get; set; }

		// @property (nonatomic) UILabel * labelYear;
		[Export ("labelYear")]
		UILabel LabelYear { get; set; }

		// @property (assign, nonatomic) MDCalendarTheme theme;
		[Export ("theme", ArgumentSemantic.UnsafeUnretained)]
		MDCalendarTheme Theme { get; set; }

		// @property (nonatomic) UIColor * textColor;
		[Export ("textColor")]
		UIColor TextColor { get; set; }

		// @property (nonatomic) UIColor * headerColor;
		[Export ("headerColor")]
		UIColor HeaderColor { get; set; }

		// @property (nonatomic) UIColor * headerBackgroundColor;
		[Export ("headerBackgroundColor")]
		UIColor HeaderBackgroundColor { get; set; }

		// @property (nonatomic) MDCalendarMonthSymbolsFormat monthFormat;
		[Export ("monthFormat")]
		MDCalendarMonthSymbolsFormat MonthFormat { get; set; }

		// @property (nonatomic) NSDate * date;
		[Export ("date")]
		NSDate Date { get; set; }

		// @property (nonatomic) NSDateFormatter * dateFormatter;
		[Export ("dateFormatter")]
		NSDateFormatter DateFormatter { get; set; }

		// @property (nonatomic, weak) id<MDCalendarDateHeaderDelegate> delegate;
		[Export ("delegate", ArgumentSemantic.Weak)]
		[NullAllowed]
		NSObject WeakDelegate { get; set; }

		// @property (nonatomic, weak) id<MDCalendarDateHeaderDelegate> delegate;
		[Wrap ("WeakDelegate")]
		MDCalendarDateHeaderDelegate Delegate { get; set; }

		// -(void)showYearSelector;
		[Export ("showYearSelector")]
		void ShowYearSelector ();

		// -(void)showCalendar;
		[Export ("showCalendar")]
		void ShowCalendar ();
	}

	// @protocol MDCalendarDelegate <NSObject>
	[Protocol, Model]
	[BaseType (typeof (NSObject))]
	interface MDCalendarDelegate {

		// @required -(void)calendar:(MDCalendar *)calendar didSelectDate:(NSDate *)date;
		[Export ("calendar:didSelectDate:")]
		[Abstract]
		void DidSelectDate (MDCalendar calendar, NSDate date);
	}

	// @interface MDCalendar : UIView <UIAppearance>
	[BaseType (typeof (UIView))]
	interface MDCalendar : IUIAppearance {

		// @property (nonatomic, weak) MDCalendarDateHeader * dateHeader;
		[Export ("dateHeader", ArgumentSemantic.Weak)]
		MDCalendarDateHeader DateHeader { get; set; }

		// @property (nonatomic, weak) id<MDCalendarDelegate> delegate;
		[Export ("delegate", ArgumentSemantic.Weak)]
		[NullAllowed]
		NSObject WeakDelegate { get; set; }

		// @property (nonatomic, weak) id<MDCalendarDelegate> delegate;
		[Wrap ("WeakDelegate")]
		MDCalendarDelegate Delegate { get; set; }

		// @property (assign, nonatomic) BOOL showPlaceholder;
		[Export ("showPlaceholder", ArgumentSemantic.UnsafeUnretained)]
		bool ShowPlaceholder { get; set; }

		// @property (copy, nonatomic) NSDate * currentDate;
		[Export ("currentDate", ArgumentSemantic.Copy)]
		NSDate CurrentDate { get; set; }

		// @property (copy, nonatomic) NSDate * selectedDate;
		[Export ("selectedDate", ArgumentSemantic.Copy)]
		NSDate SelectedDate { get; set; }

		// @property (copy, nonatomic) NSDate * currentMonth;
		[Export ("currentMonth", ArgumentSemantic.Copy)]
		NSDate CurrentMonth { get; set; }

		// @property (assign, nonatomic) MDCalendarTheme theme;
		[Export ("theme", ArgumentSemantic.UnsafeUnretained)]
		MDCalendarTheme Theme { get; set; }

		// @property (assign, nonatomic) NSUInteger firstWeekday;
		[Export ("firstWeekday", ArgumentSemantic.UnsafeUnretained)]
		nuint FirstWeekday { get; set; }

		// @property (nonatomic, strong) NSMutableDictionary * backgroundColors;
		[Export ("backgroundColors", ArgumentSemantic.Retain)]
		NSMutableDictionary BackgroundColors { get; set; }

		// @property (nonatomic, strong) NSMutableDictionary * titleColors;
		[Export ("titleColors", ArgumentSemantic.Retain)]
		NSMutableDictionary TitleColors { get; set; }

		// -(void)reloadData;
		[Export ("reloadData")]
		void ReloadData ();
	}

	// @interface MDCalendarHeader : UIView
	[BaseType (typeof (UIView))]
	interface MDCalendarHeader {

		// @property (assign, nonatomic) CGFloat scrollOffset;
		[Export ("scrollOffset", ArgumentSemantic.UnsafeUnretained)]
		nfloat ScrollOffset { get; set; }

		// @property (copy, nonatomic) NSString * dateFormat;
		[Export ("dateFormat")]
		string DateFormat { get; set; }

		// @property (nonatomic, weak) UIColor * titleColor;
		[Export ("titleColor", ArgumentSemantic.Weak)]
		UIColor TitleColor { get; set; }

		// @property (nonatomic, weak) UIFont * titleFont;
		[Export ("titleFont", ArgumentSemantic.Weak)]
		UIFont TitleFont { get; set; }

		// @property (assign, nonatomic) UICollectionViewScrollDirection scrollDirection;
		[Export ("scrollDirection", ArgumentSemantic.UnsafeUnretained)]
		UICollectionViewScrollDirection ScrollDirection { get; set; }

		// -(void)reloadData;
		[Export ("reloadData")]
		void ReloadData ();
	}

	// @interface MDDatePicker : UIView
	[BaseType (typeof (UIView))]
	interface MDDatePicker {
		// -(instancetype)initWithFrame:(CGRect)frame;
		[Export ("initWithFrame:")]
		IntPtr Constructor (CGRect frame);

		// @property (nonatomic, weak) id<MDCalendarDelegate> delegate;
		[Export ("delegate", ArgumentSemantic.Weak)]
		[NullAllowed]
		NSObject WeakDelegate { get; set; }

		// @property (nonatomic, weak) id<MDCalendarDelegate> delegate;
		[Wrap ("WeakDelegate")]
		MDCalendarDelegate Delegate { get; set; }
	}

	// @protocol MDDatePickerDialogDelegate <NSObject>
	[Protocol, Model]
	[BaseType (typeof (NSObject))]
	interface MDDatePickerDialogDelegate {

		// @required -(void)datePickerDialogDidSelectDate:(NSDate *)date;
		[Export ("datePickerDialogDidSelectDate:")]
		[Abstract]
		void DatePickerDialogDidSelectDate (NSDate date);
	}


	// @interface MDDatePickerDialog : UIButton
	[BaseType (typeof (UIButton))]
	interface MDDatePickerDialog {

		// @property (nonatomic) id<MDDatePickerDialogDelegate> delegate;
		[Export ("delegate")]
		[NullAllowed]
		NSObject WeakDelegate { get; set; }

		// @property (nonatomic) id<MDDatePickerDialogDelegate> delegate;
		[Wrap ("WeakDelegate")]
		MDDatePickerDialogDelegate Delegate { get; set; }

		// -(void)show;
		[Export ("show")]
		void Show ();
	}

	// @interface MDCollectionViewCell : UICollectionViewCell
	[BaseType (typeof (UICollectionViewCell))]
	interface MDCollectionViewCell {

		// @property (nonatomic) UIColor * rippleColor;
		[Export ("rippleColor")]
		UIColor RippleColor { get; set; }
	}

	// @interface MDDeviceHelper : NSObject
	[BaseType (typeof (NSObject))]
	interface MDDeviceHelper {

		// +(UIView *)getMainView;
		[Static, Export ("getMainView")]
		UIView GetMainView ();
	}

	// @interface MDMathHelper : NSObject
	[BaseType (typeof (NSObject))]
	interface MDMathHelper {

		// +(float)distanceBetweenPoint:(CGPoint)p1 andPoint:(CGPoint)p2;
		[Static, Export ("distanceBetweenPoint:andPoint:")]
		float DistanceBetweenPoint (CGPoint p1, CGPoint p2);

		// +(NSArray *)findIntersectionsBetweenCircleCenter:(CGPoint)c1 radius:(float)r1 andCircleCenter:(CGPoint)c2 radius:(float)r2;
		[Static, Export ("findIntersectionsBetweenCircleCenter:radius:andCircleCenter:radius:")]
		NSObject [] FindIntersectionsBetweenCircleCenter (CGPoint c1, float r1, CGPoint c2, float r2);

		// +(NSArray *)findTangentsWithCircle:(CGPoint)c radius:(float)r1 fromPoint:(CGPoint)p;
		[Static, Export ("findTangentsWithCircle:radius:fromPoint:")]
		NSObject [] FindTangentsWithCircle (CGPoint c, float r1, CGPoint p);
	}

	// @interface MDProgress : UIView
	[BaseType (typeof (UIView))]
	interface MDProgress {

		// @property (nonatomic) UIColor * progressColor;
		[Export ("progressColor")]
		UIColor ProgressColor { get; set; }

		// @property (nonatomic) UIColor * trackColor;
		[Export ("trackColor")]
		UIColor TrackColor { get; set; }

		// @property (nonatomic) enum MDProgressType progressType;
		[Export ("progressType")]
		MDProgressType ProgressType { get; set; }

		// @property (nonatomic) enum MDProgressStyle progressStyle;
		[Export ("progressStyle")]
		MDProgressStyle ProgressStyle { get; set; }

		// @property (nonatomic) int type;
		[Export ("type")]
		int Type { get; set; }

		// @property (nonatomic) int style;
		[Export ("style")]
		int Style { get; set; }

		// @property (nonatomic) float progress;
		[Export ("progress")]
		float Progress { get; set; }

		// @property (nonatomic) BOOL enableTrackColor;
		[Export ("enableTrackColor")]
		bool EnableTrackColor { get; set; }
	}

	// @interface MDRippleLayer : CALayer
	[BaseType (typeof (CALayer))]
	interface MDRippleLayer {

		// -(instancetype)initWithSuperLayer:(CALayer *)superLayer;
		[Export ("initWithSuperLayer:")]
		IntPtr Constructor (CALayer superLayer);

		// -(instancetype)initWithSuperView:(UIView *)superView;
		[Export ("initWithSuperView:")]
		IntPtr Constructor (UIView superView);

		// @property (nonatomic) BOOL enableRipple;
		[Export ("enableRipple")]
		bool EnableRipple { get; set; }

		// @property (nonatomic) BOOL enableElevation;
		[Export ("enableElevation")]
		bool EnableElevation { get; set; }

		// @property (nonatomic) BOOL enableMask;
		[Export ("enableMask")]
		bool EnableMask { get; set; }

		// @property (nonatomic) CGFloat restingElevation;
		[Export ("restingElevation")]
		nfloat RestingElevation { get; set; }

		// @property (nonatomic) float rippleScaleRatio;
		[Export ("rippleScaleRatio")]
		float RippleScaleRatio { get; set; }

		// @property (nonatomic) float effectSpeed;
		[Export ("effectSpeed")]
		float EffectSpeed { get; set; }

		// @property (nonatomic) UIColor * effectColor;
		[Export ("effectColor")]
		UIColor EffectColor { get; set; }

		// -(void)setEffectColor:(UIColor *)color withRippleAlpha:(float)rippleAlpha backgroundAlpha:(float)backgroundAlpha;
		[Export ("setEffectColor:withRippleAlpha:backgroundAlpha:")]
		void SetEffectColor (UIColor color, float rippleAlpha, float backgroundAlpha);

		// -(void)startEffectsAtLocation:(CGPoint)touchLocation;
		[Export ("startEffectsAtLocation:")]
		void StartEffectsAtLocation (CGPoint touchLocation);

		// -(void)stopEffects;
		[Export ("stopEffects")]
		void StopEffects ();
	}

	// @protocol MDLayerDelegate <NSObject>
	[Protocol, Model]
	[BaseType (typeof (NSObject))]
	interface MDLayerDelegate {

		// @optional -(void)mdLayer:(MDRippleLayer *)layer didFinishEffect:(CFTimeInterval)duration;
		[Export ("mdLayer:didFinishEffect:")]
		void DidFinishEffect (MDRippleLayer layer, double duration);
	}

	// @interface MDSlider : UIControl
	[BaseType (typeof (UIControl))]
	interface MDSlider {

		// @property (nonatomic) float value;
		[Export ("value")]
		float Value { get; set; }

		// @property (nonatomic) float maximumValue;
		[Export ("maximumValue")]
		float MaximumValue { get; set; }

		// @property (nonatomic) float minimumValue;
		[Export ("minimumValue")]
		float MinimumValue { get; set; }

		// @property (nonatomic) UIColor * thumbOnColor;
		[Export ("thumbOnColor")]
		UIColor ThumbOnColor { get; set; }

		// @property (nonatomic) UIColor * trackOnColor;
		[Export ("trackOnColor")]
		UIColor TrackOnColor { get; set; }

		// @property (nonatomic) UIColor * thumbOffColor;
		[Export ("thumbOffColor")]
		UIColor ThumbOffColor { get; set; }

		// @property (nonatomic) UIColor * trackOffColor;
		[Export ("trackOffColor")]
		UIColor TrackOffColor { get; set; }

		// @property (nonatomic) UIColor * disabledColor;
		[Export ("disabledColor")]
		UIColor DisabledColor { get; set; }

		// @property (nonatomic) UIColor * tickMarksColor;
		[Export ("tickMarksColor")]
		UIColor TickMarksColor { get; set; }

		// @property (nonatomic) UIImage * leftImage;
		[Export ("leftImage")]
		UIImage LeftImage { get; set; }

		// @property (nonatomic) UIImage * rightImage;
		[Export ("rightImage")]
		UIImage RightImage { get; set; }

		// @property (nonatomic, getter = isEnabled) BOOL enabled;
		[Export ("enabled")]
		bool Enabled { [Bind ("isEnabled")] get; set; }

		// @property (nonatomic) float step;
		[Export ("step")]
		float Step { get; set; }

		// @property (nonatomic) BOOL enabledValueLabel;
		[Export ("enabledValueLabel")]
		bool EnabledValueLabel { get; set; }

		// @property (nonatomic) NSUInteger precision;
		[Export ("precision")]
		nuint Precision { get; set; }
	}

	// @protocol MDSnackbarDelegate <NSObject>
	[Protocol, Model]
	[BaseType (typeof (NSObject))]
	interface MDSnackbarDelegate {

		// @optional -(void)snackbarWillAppear:(MDSnackbar *)snackbar;
		[Export ("snackbarWillAppear:")]
		void SnackbarWillAppear (MDSnackbar snackbar);

		// @optional -(void)snackbarDidAppear:(MDSnackbar *)snackbar;
		[Export ("snackbarDidAppear:")]
		void SnackbarDidAppear (MDSnackbar snackbar);

		// @optional -(void)snackbarWillDisappear:(MDSnackbar *)snackbar;
		[Export ("snackbarWillDisappear:")]
		void SnackbarWillDisappear (MDSnackbar snackbar);

		// @optional -(void)snackbarDidDisappear:(MDSnackbar *)snackbar;
		[Export ("snackbarDidDisappear:")]
		void SnackbarDidDisappear (MDSnackbar snackbar);

		// @optional -(void)actionTouched:(MDSnackbar *)snackbar;
		[Export ("actionTouched:")]
		void ActionTouched (MDSnackbar snackbar);
	}

	// @interface MDSnackbar : UIControl
	[BaseType (typeof (UIControl))]
	interface MDSnackbar {

		// -(instancetype)initWithText:(NSString *)text actionTitle:(NSString *)action;
		[Export ("initWithText:actionTitle:")]
		IntPtr Constructor (string text, string action);

		// -(instancetype)initWithText:(NSString *)text actionTitle:(NSString *)action duration:(double)duration;
		[Export ("initWithText:actionTitle:duration:")]
		IntPtr Constructor (string text, string action, double duration);

		// @property (nonatomic) NSString * text;
		[Export ("text")]
		string Text { get; set; }

		// @property (nonatomic) NSString * actionTitle;
		[Export ("actionTitle")]
		string ActionTitle { get; set; }

		// @property (nonatomic) UIColor * textColor;
		[Export ("textColor")]
		UIColor TextColor { get; set; }

		// @property (nonatomic) UIColor * actionTitleColor;
		[Export ("actionTitleColor")]
		UIColor ActionTitleColor { get; set; }

		// @property (nonatomic) double duration;
		[Export ("duration")]
		double Duration { get; set; }

		// @property (nonatomic) BOOL swipeable;
		[Export ("swipeable")]
		bool Swipeable { get; set; }

		// @property (nonatomic) BOOL multiline;
		[Export ("multiline")]
		bool Multiline { get; set; }

		// @property (readonly, nonatomic) BOOL isShowing;
		[Export ("isShowing")]
		bool IsShowing { get; }

		// -(void)show;
		[Export ("show")]
		void Show ();

		// -(void)dismiss;
		[Export ("dismiss")]
		void Dismiss ();

		// -(void)addTarget:(id)target action:(SEL)aSelector;
		[Export ("addTarget:action:")]
		void AddTarget (NSObject target, Selector aSelector);

		// -(void)addDelegate:(id<MDSnackbarDelegate>)delegate;
		[Export ("addDelegate:")]
		void AddDelegate (MDSnackbarDelegate Delegate);

		// -(void)removeDelegate:(id<MDSnackbarDelegate>)delegate;
		[Export ("removeDelegate:")]
		void RemoveDelegate (MDSnackbarDelegate Delegate);
	}

	// @interface MDSwitch : UIControl
	[BaseType (typeof (UIControl))]
	interface MDSwitch {

		// @property (nonatomic, getter = isOn) BOOL on;
		[Export ("on")]
		bool On { [Bind ("isOn")] get; set; }

		// @property (nonatomic) UIColor * thumbOn;
		[Export ("thumbOn")]
		UIColor ThumbOn { get; set; }

		// @property (nonatomic) UIColor * trackOn;
		[Export ("trackOn")]
		UIColor TrackOn { get; set; }

		// @property (nonatomic) UIColor * thumbOff;
		[Export ("thumbOff")]
		UIColor ThumbOff { get; set; }

		// @property (nonatomic) UIColor * trackOff;
		[Export ("trackOff")]
		UIColor TrackOff { get; set; }

		// @property (nonatomic) UIColor * thumbDisabled;
		[Export ("thumbDisabled")]
		UIColor ThumbDisabled { get; set; }

		// @property (nonatomic) UIColor * trackDisabled;
		[Export ("trackDisabled")]
		UIColor TrackDisabled { get; set; }
	}

	// @protocol MDTabBarDelegate <NSObject>
	[Protocol, Model]
	[BaseType (typeof (NSObject))]
	interface MDTabBarDelegate {

		// @required -(void)tabBar:(MDTabBar *)tabBar didChangeSelectedIndex:(NSUInteger)selectedIndex;
		[Export ("tabBar:didChangeSelectedIndex:")]
		[Abstract]
		void DidChangeSelectedIndex (MDTabBar tabBar, nuint selectedIndex);
	}

	// @interface MDTabBar : UIControl
	[BaseType (typeof (UIControl))]
	interface MDTabBar {

		// @property (nonatomic) UIColor * textColor;
		[Export ("textColor")]
		UIColor TextColor { get; set; }

		// @property (nonatomic) UIColor * backgroundColor;
		[Export ("backgroundColor")]
		UIColor BackgroundColor { get; set; }

		// @property (nonatomic) UIColor * indicatorColor;
		[Export ("indicatorColor")]
		UIColor IndicatorColor { get; set; }

		// @property (nonatomic) UIColor * rippleColor;
		[Export ("rippleColor")]
		UIColor RippleColor { get; set; }

		// @property (nonatomic) UIFont * textFont;
		[Export ("textFont")]
		UIFont TextFont { get; set; }

		// @property (nonatomic) NSUInteger selectedIndex;
		[Export ("selectedIndex")]
		nuint SelectedIndex { get; set; }

		// @property (nonatomic, weak) id<MDTabBarDelegate> delegate;
		[Export ("delegate", ArgumentSemantic.Weak)]
		[NullAllowed]
		NSObject WeakDelegate { get; set; }

		// @property (nonatomic, weak) id<MDTabBarDelegate> delegate;
		[Wrap ("WeakDelegate")]
		MDTabBarDelegate Delegate { get; set; }

		// @property (readonly, nonatomic) NSInteger numberOfItems;
		[Export ("numberOfItems")]
		nint NumberOfItems { get; }

		// -(void)setItems:(NSArray *)items;
		[Export ("setItems:")]
		void SetItems (NSObject [] items);

		// -(void)insertItem:(id)item atIndex:(NSUInteger)index animated:(BOOL)animated;
		[Export ("insertItem:atIndex:animated:")]
		void InsertItem (NSObject item, nuint index, bool animated);

		// -(void)removeItemAtIndex:(NSUInteger)index animated:(BOOL)animated;
		[Export ("removeItemAtIndex:animated:")]
		void RemoveItemAtIndex (nuint index, bool animated);

		// -(void)replaceItem:(id)item atIndex:(NSUInteger)index;
		[Export ("replaceItem:atIndex:")]
		void ReplaceItem (NSObject item, nuint index);

		// -(NSMutableArray *)tabs;
		[Export ("tabs")]
		NSMutableArray Tabs ();

		// -(void)moveIndicatorToFrame:(CGRect)frame withAnimated:(BOOL)animated;
		[Export ("moveIndicatorToFrame:withAnimated:")]
		void MoveIndicatorToFrame (CGRect frame, bool animated);
	}

	// @protocol MDTabBarViewControllerDelegate <NSObject>
	[Protocol, Model]
	[BaseType (typeof (NSObject))]
	interface MDTabBarViewControllerDelegate {

		// @required -(UIViewController *)tabBarViewController:(MDTabBarViewController *)viewController viewControllerAtIndex:(NSUInteger)index;
		[Export ("tabBarViewController:viewControllerAtIndex:")]
		[Abstract]
		UIViewController ViewControllerAtIndex (MDTabBarViewController viewController, nuint index);

		// @optional -(void)tabBarViewController:(MDTabBarViewController *)viewController didMoveToIndex:(NSUInteger)index;
		[Export ("tabBarViewController:didMoveToIndex:")]
		void DidMoveToIndex (MDTabBarViewController viewController, nuint index);
	}

	// @interface MDTabBarViewController : UIViewController
	[BaseType (typeof (UIViewController))]
	interface MDTabBarViewController {

		// -(instancetype)initWithDelegate:(id)delegate;
		[Export ("initWithDelegate:")]
		IntPtr Constructor (NSObject Delegate);

		// @property (readonly, nonatomic) MDTabBar * tabBar;
		[Export ("tabBar")]
		MDTabBar TabBar { get; }

		// @property (nonatomic, weak) id<MDTabBarViewControllerDelegate> delegate;
		[Export ("delegate", ArgumentSemantic.Weak)]
		[NullAllowed]
		NSObject WeakDelegate { get; set; }

		// @property (nonatomic, weak) id<MDTabBarViewControllerDelegate> delegate;
		[Wrap ("WeakDelegate")]
		MDTabBarViewControllerDelegate Delegate { get; set; }

		// -(void)setItems:(NSArray *)items;
		[Export ("setItems:")]
		void SetItems (NSObject [] items);
	}

	// @interface MDTableViewCell : UITableViewCell
	[BaseType (typeof (UITableViewCell))]
	interface MDTableViewCell {
		// -(instancetype)initWithFrame:(CGRect)frame;
		[Export ("initWithFrame:")]
		IntPtr Constructor (CGRect frame);

		// -(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
		[Export ("initWithStyle:reuseIdentifier:")]
		IntPtr Constructor (UITableViewCellStyle style, string reuseIdentifier);

		// @property (nonatomic) UIColor * rippleColor;
		[Export ("rippleColor")]
		UIColor RippleColor { get; set; }
	}

	// @protocol MDTextFieldDelegate <NSObject>
	[Protocol, Model]
	[BaseType (typeof (NSObject))]
	interface MDTextFieldDelegate {

		// @optional -(id)textFieldDidChange:(MDTextField *)textField;
		[Export ("textFieldDidChange:"),EventArgs ("TextFieldTextChanged")]
		void TextChanged (MDTextField textField);

		// @optional -(BOOL)textFieldShouldBeginEditing:(MDTextField *)textField;
		[Export ("textFieldShouldBeginEditing:"),EventArgs ("TextFieldShouldBeginEditing")]
		[DefaultValue(true)]
		bool ShouldBeginEditing (MDTextField textField);

		// @optional -(void)textFieldDidBeginEditing:(MDTextField *)textField;
		[Export ("textFieldDidBeginEditing:"),EventArgs ("TextFieldDidBeginEditing")]
		void DidBeginEditing (MDTextField textField);

		// @optional -(BOOL)textFieldShouldEndEditing:(MDTextField *)textField;
		[Export ("textFieldShouldEndEditing:"),EventArgs ("TextFieldShouldEndEditing")]
		[DefaultValue(true)]
		bool ShouldEndEditing (MDTextField textField);

		// @optional -(void)textFieldDidEndEditing:(MDTextField *)textField;
		[Export ("textFieldDidEndEditing:")]
		void DidEndEditing (MDTextField textField);

		// @optional -(BOOL)textField:(MDTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
		[Export ("textField:shouldChangeCharactersInRange:replacementString:"),EventArgs ("TextFieldShouldChangeText")]
		[DefaultValue(true)]
		bool ShouldChangeText (MDTextField textField, NSRange range, string text);

		// @optional -(BOOL)textFieldShouldReturn:(MDTextField *)textField;
		[Export ("textFieldShouldReturn:"),EventArgs ("TextFieldShouldReturn")]
		[DefaultValue(true)]
		bool ShouldReturn (MDTextField textField);
	}

	// @interface MDTextField : UIControl
	[BaseType (typeof (UIControl),Delegates=new string [] {"WeakDelegate"},
		Events=new Type [] { typeof (MDTextFieldDelegate) })]
	interface MDTextField {

		// @property (nonatomic) NSString * hint;
		[Export ("hint")]
		string Hint { get; set; }

		// @property (nonatomic) NSString * label;
		[Export ("label")]
		string Label { get; set; }

		// @property (nonatomic) BOOL floatingLabel;
		[Export ("floatingLabel")]
		bool FloatingLabel { get; set; }

		// @property (nonatomic) BOOL highlightLabel;
		[Export ("highlightLabel")]
		bool HighlightLabel { get; set; }

		// @property (nonatomic) NSString * errorMessage;
		[Export ("errorMessage")]
		string ErrorMessage { get; set; }

		// @property (nonatomic) int maxCharacterCount;
		[Export ("maxCharacterCount")]
		int MaxCharacterCount { get; set; }

		// @property (nonatomic) UIColor * normalColor;
		[Export ("normalColor")]
		UIColor NormalColor { get; set; }

		// @property (nonatomic) UIColor * highlightColor;
		[Export ("highlightColor")]
		UIColor HighlightColor { get; set; }

		// @property (nonatomic) UIColor * errorColor;
		[Export ("errorColor")]
		UIColor ErrorColor { get; set; }

		// @property (nonatomic) UIColor * disabledColor;
		[Export ("disabledColor")]
		UIColor DisabledColor { get; set; }

		// @property (nonatomic) UIColor * textColor;
		[Export ("textColor")]
		UIColor TextColor { get; set; }

		// @property (nonatomic) UIColor * hintColor;
		[Export ("hintColor")]
		UIColor HintColor { get; set; }

		// @property (nonatomic, getter = isEnabled) BOOL enabled;
		[Export ("enabled")]
		bool Enabled { [Bind ("isEnabled")] get; set; }

		// @property (nonatomic) BOOL autoComplete;
		[Export ("autoComplete")]
		bool AutoComplete { get; set; }

		// @property (nonatomic) BOOL singleLine;
		[Export ("singleLine")]
		bool SingleLine { get; set; }

		// @property (nonatomic) BOOL fullWidth;
		[Export ("fullWidth")]
		bool FullWidth { get; set; }

		// @property (nonatomic) int minVisibleLines;
		[Export ("minVisibleLines")]
		int MinVisibleLines { get; set; }

		// @property (nonatomic) int maxVisibleLines;
		[Export ("maxVisibleLines")]
		int MaxVisibleLines { get; set; }

		// @property (nonatomic) NSString * text;
		[Export ("text")]
		string Text { get; set; }

		// @property (nonatomic) BOOL secureTextEntry;
		[Export ("secureTextEntry")]
		bool SecureTextEntry { get; set; }

		// @property (nonatomic) UIReturnKeyType returnKeyType;
		[Export ("returnKeyType")]
		UIReturnKeyType ReturnKeyType { get; set; }

		// @property (nonatomic) UIKeyboardType keyboardType;
		[Export ("keyboardType")]
		UIKeyboardType KeyboardType { get; set; }

		// @property (nonatomic) BOOL hasError;
		[Export ("hasError")]
		bool HasError { get; set; }

		// @property (nonatomic) UIFont * labelsFont;
		[Export ("labelsFont")]
		UIFont LabelsFont { get; set; }

		// @property (nonatomic) UIFont * inputTextFont;
		[Export ("inputTextFont")]
		UIFont InputTextFont { get; set; }

		// @property (nonatomic) NSLayoutConstraint * textViewHeightConstraint;
		[Export ("textViewHeightConstraint")]
		NSLayoutConstraint TextViewHeightConstraint { get; set; }

		// @property (nonatomic) NSArray * suggestionsDictionary;
		[Export ("suggestionsDictionary")]
		NSObject [] SuggestionsDictionary { get; set; }

		// @property (nonatomic, weak) id<MDTextFieldDelegate> delegate;
		[Export ("delegate", ArgumentSemantic.Weak)]
		[NullAllowed]
		NSObject WeakDelegate { get; set; }

		// @property (nonatomic, weak) id<MDTextFieldDelegate> delegate;
		[Wrap ("WeakDelegate")]
		MDTextFieldDelegate Delegate { get; set; }
	}

	// @protocol MDTimePickerDialogDelegate <NSObject>
	[Protocol, Model]
	[BaseType (typeof (NSObject))]
	interface MDTimePickerDialogDelegate {

		// @required -(void)timePickerDialog:(MDTimePickerDialog *)timePickerDialog didSelectHour:(NSInteger)hour andMinute:(NSInteger)minute;
		[Export ("timePickerDialog:didSelectHour:andMinute:")]
		[Abstract]
		void DidSelectHour (MDTimePickerDialog timePickerDialog, nint hour, nint minute);
	}

	// @interface MDTimePickerDialog : UIButton <UIGestureRecognizerDelegate>
	[BaseType (typeof (UIButton))]
	interface MDTimePickerDialog : IUIGestureRecognizerDelegate {

		// -(instancetype)initWithHour:(NSInteger)hour andWithMinute:(NSInteger)minute;
		[Export ("initWithHour:andWithMinute:")]
		IntPtr Constructor (nint hour, nint minute);

		// @property (nonatomic) id<MDTimePickerDialogDelegate> delegate;
		[Export ("delegate")]
		[NullAllowed]
		NSObject WeakDelegate { get; set; }

		// @property (nonatomic) id<MDTimePickerDialogDelegate> delegate;
		[Wrap ("WeakDelegate")]
		MDTimePickerDialogDelegate Delegate { get; set; }

		// @property (nonatomic) MDCalendarTimeMode timeMode;
		[Export ("timeMode")]
		MDCalendarTimeMode TimeMode { get; set; }

		// @property (nonatomic) UIView * header;
		[Export ("header")]
		UIView Header { get; set; }

		// @property (nonatomic) UILabel * headerLabelHour;
		[Export ("headerLabelHour")]
		UILabel HeaderLabelHour { get; set; }

		// @property (nonatomic) UILabel * headerLabelMinute;
		[Export ("headerLabelMinute")]
		UILabel HeaderLabelMinute { get; set; }

		// @property (nonatomic) UILabel * headerLabelTimeMode;
		[Export ("headerLabelTimeMode")]
		UILabel HeaderLabelTimeMode { get; set; }

		// @property (nonatomic) MDButton * buttonOk;
		[Export ("buttonOk")]
		MDButton ButtonOk { get; set; }

		// @property (nonatomic) MDButton * buttonCancel;
		[Export ("buttonCancel")]
		MDButton ButtonCancel { get; set; }

		// @property (nonatomic) UIFont * buttonFont;
		[Export ("buttonFont")]
		UIFont ButtonFont { get; set; }

		// -(void)show;
		[Export ("show")]
		void Show ();
	}

	// @interface MDToast : UIControl
	[BaseType (typeof (UIControl))]
	partial interface MDToast {

		// -(instancetype)initWithText:(NSString *)text duration:(double)duration;
		[Export ("initWithText:duration:")]
		IntPtr Constructor (string text, double duration);

		// @property (nonatomic) NSString * text;
		[Export ("text")]
		string Text { get; set; }

		// @property (nonatomic) UIColor * textColor;
		[Export ("textColor")]
		UIColor TextColor { get; set; }

		// @property (nonatomic) double duration;
		[Export ("duration")]
		double Duration { get; set; }

		// @property (readonly, nonatomic) BOOL isShowing;
		[Export ("isShowing")]
		bool IsShowing { get; }

		// -(void)show;
		[Export ("show")]
		void Show ();

		// -(void)dismiss;
		[Export ("dismiss")]
		void Dismiss ();
	}

	// @interface UIColorHelper : NSObject
	[BaseType (typeof (NSObject))]
	interface UIColorHelper {

		// +(UIColor *)colorWithRGBA:(NSString *)rgba;
		[Static, Export ("colorWithRGBA:")]
		UIColor ColorWithRGBA (string rgba);

		// +(UIColor *)colorFromRGB:(NSString *)rgb withAlpha:(float)alpha;
		[Static, Export ("colorFromRGB:withAlpha:")]
		UIColor ColorFromRGB (string rgb, float alpha);
	}

	// @interface UIFontHelper : NSObject
	[BaseType (typeof (NSObject))]
	interface UIFontHelper {

		// +(UIFont *)robotoFontWithName:(NSString *)fontName size:(CGFloat)fontSize;
		[Static, Export ("robotoFontWithName:size:")]
		UIFont RobotoFontWithName (string fontName, nfloat fontSize);

		// +(UIFont *)robotoFontOfSize:(CGFloat)fontSize;
		[Static, Export ("robotoFontOfSize:")]
		UIFont RobotoFontOfSize (nfloat fontSize);

		// +(UIFont *)boldRobotoFontOfSize:(CGFloat)fontSize;
		[Static, Export ("boldRobotoFontOfSize:")]
		UIFont BoldRobotoFontOfSize (nfloat fontSize);

		// +(NSString *)robotoFontName:(MDFontFamilySize)fontFamily withType:(MDFontFamilyType)fontType;
		[Static, Export ("robotoFontName:withType:")]
		string RobotoFontName (MDFontFamilySize fontFamily, MDFontFamilyType fontType);
	}

	// @interface MDExtension (UIView)
	[Category]
	[BaseType (typeof (UIView))]
	interface MDExtension {

		// @property (nonatomic) CGFloat mdWidth;
		[Export ("mdWidth")]
		[Static]
		nfloat MdWidth { get; set; }

		// @property (nonatomic) CGFloat mdHeight;
		[Export ("mdHeight")]
		[Static]
		nfloat MdHeight { get; set; }

		// @property (nonatomic) CGFloat mdTop;
		[Export ("mdTop")]
		[Static]
		nfloat MdTop { get; set; }

		// @property (nonatomic) CGFloat mdLeft;
		[Export ("mdLeft")]
		[Static]
		nfloat MdLeft { get; set; }

		// @property (nonatomic) CGFloat mdBottom;
		[Export ("mdBottom")]
		[Static]
		nfloat MdBottom { get; set; }

		// @property (nonatomic) CGFloat mdRight;
		[Export ("mdRight")]
		[Static]
		nfloat MdRight { get; set; }

		// @property (nonatomic) CGFloat mdCenterX;
		[Export ("mdCenterX")]
		[Static]
		nfloat MdCenterX { get; set; }

		// @property (nonatomic) CGFloat mdCenterY;
		[Export ("mdCenterY")]
		[Static]
		nfloat MdCenterY { get; set; }
	}

	// @interface UIViewHelper : NSObject
	[BaseType (typeof (NSObject))]
	interface UIViewHelper {

		// +(NSLayoutConstraint *)addConstraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c toView:(UIView *)view;
		[Static, Export ("addConstraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:toView:")]
		NSLayoutConstraint AddConstraintWithItem (NSObject view1, NSLayoutAttribute attr1, NSLayoutRelation relation, NSObject view2, NSLayoutAttribute attr2, nfloat multiplier, nfloat c, UIView view);

		// +(NSArray *)addConstraintsWithVisualFormat:(NSString *)format options:(NSLayoutFormatOptions)opts metrics:(NSDictionary *)metrics views:(NSDictionary *)views toView:(UIView *)view;
		[Static, Export ("addConstraintsWithVisualFormat:options:metrics:views:toView:")]
		NSObject [] AddConstraintsWithVisualFormat (string format, NSLayoutFormatOptions opts, NSDictionary metrics, NSDictionary views, UIView view);
	}
}


