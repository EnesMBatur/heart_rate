class DurationItems extends Duration {
  DurationItems.high() : super(seconds: 3);
  DurationItems.medium() : super(seconds: 2);
  DurationItems.durationNormal() : super(seconds: 1);
  DurationItems.durationLow() : super(milliseconds: 300);
  DurationItems.openContainer() : super(microseconds: 320);
  DurationItems.durationLowPlus() : super(milliseconds: 650);
  DurationItems.durationEmpty() : super(microseconds: 10);
}
