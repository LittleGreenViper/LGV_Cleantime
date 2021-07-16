# NA CLEANTIME CALCULATION ENGINE

## INTRODUCTION

This is the calculation "engine" for determining milestones in NA cleantime. It allows the implementor to determine important milestones in the lifelong endeavor of NA Recovery.

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
- 10,000 Days (27.5 Years)
- 30 Years
- 40 Years

This module will accept two dates (a "cleandate," or the first day clean, and an "ending" day -usually today), and will calculate any and all milestones between those dates.

It will then report these, in a manner that does not prescribe the format of presentation, but does allow the presenter to determine an accurate reporting UI.

## IMPLEMENTATION

This is an Apple library, written in native [Swift](https://apple.com/swift). It is not designed for [Objective-C](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011210) projects.

This will work for [iOS](https://apple.com/ios), [iPadOS](https://apple.com/ipados), [MacOS](https://apple.com/macos), [WatchOS](https://apple.com/watchos), and [tvOS](https://apple.com/tvos).

It relies only on the [Swift Foundation Library](https://developer.apple.com/documentation/foundation). It is designed for Swift 5.0 or above.

### [Swift Package Manager](https://swift.org/package-manager/)

The recommended implementation is via the Swift Package Manager. The Git URI for this project is:

    git@github.com:LittleGreenViper/LGV_Cleantime.git
    
Once you have included the project, you import it, using this `import` statement:

    import LGV_Cleantime
    
### [GitHub Carthage](https://github.com/Carthage/Carthage)

You can add this project to yours by adding the following line to your [CartFile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile):

    github "LittleGreenViper/LGV_Cleantime"
    
Once the module has been imported, you canb either build the library, and import the module (as above), or you can directly add the files to your project, by going into the `Carthage/Checkouts/LGV_Cleantime/Sources/LGV_Cleantime` directory, and adding the two files, therein, to your project. Note that if you do this, you do not `import` the module.

### Directly From GitHub

You can also include the module as a [Git Submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules), by referencing its Git URL: 

    git@github.com:LittleGreenViper/LGV_Cleantime.git

### Usage

Once you have the module installed and imported, you use it very simply.

    let calculator = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)

This instantiates the calculator class. You then use that class, like so:

    let totalDays = testTarget.cleanTime.totalDays
    let totalMonths = testTarget.cleanTime.totalMonths
    let years = testTarget.cleanTime.years
    let months = testTarget.cleanTime.months
    let days = testTarget.cleanTime.months

`testTarget.cleanTime` is the workhorse. That returns a struct with the calculation results. It has a number of accessors.

You can also fetch a couple of [Date](https://developer.apple.com/documentation/foundation/date) structures, directly from the instance:

    let components = testTarget.components
    let timeInterval = testTarget.timeInterval

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
