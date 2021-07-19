# NA CLEANTIME CALCULATION ENGINE

<img src="https://github.com/LittleGreenViper/LGV_Cleantime/raw/master/icon.png" align="right" />

## INTRODUCTION

This is the calculation "engine" for determining milestones in NA cleantime. It allows the implementor to determine important milestones in the lifelong endeavor of NA Recovery.

It's a native [Swift](https://apple.com/swift) "faceless" engine module, meant to compile and link into an Apple application; regardless of platform.

## CODE DOCUMENTATION

[Detailed API documentation is available here.](https://littlegreenviper.github.io/LGV_Cleantime/)

## WHAT PROBLEM DOES THIS SOLVE?

NA cleantime has a series of "culturally significant" milestones, recognized as members remain abstinent and practicing the NA program. These are:

- 1 Day
- 30 Days
- 60 Days
- 90 Days
- 6 Months
- 9 Months
- 1 Year
- 18 Months (A Year and A Half)
- 2 Years
- 5 Years
- 10 Years
- 15 Years
- 20 Years
- 25 Years
- 10,000 Days (27.4 Years)
- 30 Years
- 40 Years

This module will accept two dates (a "cleandate," or the first day clean, and an "ending" day -usually today), and will calculate any and all milestones between those dates.

It will then report these, in a manner that does not prescribe the format of presentation, but does allow the presenter to determine an accurate reporting UI.

This will not work with starting dates earlier than Jan 1, 1950. Since NA started in 1953 (for our purposes), this is fine.

The algorithm is non-inclusive. It does not count the initial day. If the start date and end date are the same, zero days have passed.

The granularity of the algorithm is complete days. The start time and end time are assumed to be noon.

This uses [the Gregorian calendar](https://en.wikipedia.org/wiki/Gregorian_calendar).

## IMPLEMENTATION

This is an Apple library, written in native [Swift](https://apple.com/swift). It is not designed for [Objective-C](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011210) projects.

This will work for [iOS](https://apple.com/ios), [iPadOS](https://apple.com/ipados), [MacOS](https://apple.com/macos), [WatchOS](https://apple.com/watchos), and [tvOS](https://apple.com/tvos).

It relies only on the [Swift Foundation Library](https://developer.apple.com/documentation/foundation). It is designed for Swift 5.0 or above.

### Installation

#### [Swift Package Manager](https://swift.org/package-manager/)

The recommended implementation is via the Swift Package Manager. The Git URI for this project is:

    git@github.com:LittleGreenViper/LGV_Cleantime.git
    
Once you have included the project, you import it, using this `import` statement:

    import LGV_Cleantime
    
#### [GitHub Carthage](https://github.com/Carthage/Carthage)

You can add this project to yours by adding the following line to your [CartFile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile):

    github "LittleGreenViper/LGV_Cleantime"
    
Once the module has been imported, you can either build the library, and import the module (as above), or you can directly add the files to your project, by going into the `Carthage/Checkouts/LGV_Cleantime/Sources/LGV_Cleantime` directory, and adding the two files, therein, to your project. Note that if you do this, you do not `import` the module.

#### Directly From GitHub

You can also include the module as a [Git Submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules), by referencing its Git URL: 

    git@github.com:LittleGreenViper/LGV_Cleantime.git

### Usage

Once you have the module installed and imported, you use it very simply.

    // This is a simple utility function for creating dates from the Gregorian calendar.
    func makeDate(year inYear: Int, month inMonth: Int, day inDay: Int) -> Date { Calendar(identifier: .gregorian).date(from: DateComponents(year: inYear, month: inMonth, day: inDay)) ?? Date() }

    // We make a couple of dates (the date range).
    let startDate = makeDate(year: 1953, month: 10, day: 5)
    let endDate = makeDate(year: 2021, month: 7, day: 17)

This creates an instance of the engine, given the two dates:

    let calculator = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)

This creates an instance of the engine, given the two dates (in Gregorian), but specifying the Persian (Iranian) Solar Calendar as the calculation engine:

    let calculator = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate, calendar: Calendar(identifier: .persian))
    
You can "mix and match" calendars. [This set of tests does that with the Persian Calendar.](https://github.com/LittleGreenViper/LGV_Cleantime/blob/529f1af050e86eec786bf0dd576c32ed77e35100/Tests/LGV_CleantimeTests/LGV_CleantimeCalculationTests.swift#L1170)

This is the total number of complete days that have passed between the two dates:

    let totalDays = calculator.cleanTime.totalDays

This is the total number of complete months that have passed between the two dates:

    let totalMonths = calculator.cleanTime.totalMonths
    
This is the total number of complete years that have passed between the two dates:
    
    let years = calculator.cleanTime.years
    
This is the total number of complete months that have passed since the last complete year:
    
    let months = calculator.cleanTime.months
    
This is the total number of complete days that have passed since the last complete month, after the last complete year:
    
    let days = calculator.cleanTime.days

You may also use a directly-instantiated inline struct, like so:

    let totalDays = LGV_CleantimeDateCalc(startDate: startDate, endDate: makeDate(year: 2021, month: 7, day: 16)).cleanTime.totalDays
    let totalMonths = LGV_CleantimeDateCalc(startDate: startDate, endDate: Date()).cleanTime.totalMonths

Note that you do not have to specify an end date. If you leave that out, "today" is assumed:

    let years = LGV_CleantimeDateCalc(startDate: startDate).cleanTime.years
    let months = LGV_CleantimeDateCalc(startDate: startDate).cleanTime.months
    let days = LGV_CleantimeDateCalc(startDate: startDate).cleanTime.months

`LGV_CleantimeDateCalc.cleanTime` is the workhorse. That returns a struct with the calculation results. It has a number of accessors that return true, if the milestone is present within the timespan:

    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isOneDayOrMore
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isThirtyDaysOrMore
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isSixtyDaysOrMore
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isNinetyDaysOrMore
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isSixMonthsOrMore
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isNineMonthsOrMore
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isOneYearOrMore
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isEighteenMonthsOrMore
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isTwoOrMoreYears
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isFiveOrMoreYears
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isTenOrMoreYears
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isFifteenOrMoreYears
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isTwentyOrMoreYears
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isTwentyFiveOrMoreYears
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isTenThousandDaysOrMore
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isThirtyOrMoreYears
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isFortyOrMoreYears
    LGV_CleantimeDateCalc(startDate: startDate).cleanTime.isFiftyOrMoreYears

You can also fetch a couple of [Date](https://developer.apple.com/documentation/foundation/date) structures, directly from the instance:

    let components = LGV_CleantimeDateCalc(startDate: startDate).components
    let timeInterval = LGV_CleantimeDateCalc(startDate: startDate).timeInterval

These will return values that will be directly useful for Date utilities.

### GitHub Project

The GitHub project for this library is [https://github.com/LittleGreenViper/LGV_Cleantime](https://github.com/LittleGreenViper/LGV_Cleantime).

## LICENSE:

### MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## NOT AFFILIATED WITH [NA WORLD SERVICES, INC. (NAWS)](https://na.org)

This is an independent project, published by a single engineer, and claims no affiliation with NAWS, or any NA Service body or Group.
