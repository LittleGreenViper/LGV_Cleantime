/*
  © Copyright 2021, Little Green Viper Software Development LLC
 
 Version: 1.3.1
 
 LICENSE:
 
 MIT License
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
 modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import Foundation

/* ###################################################################################################################################### */
// MARK: - Public Recovery Time Calculator Struct -
/* ###################################################################################################################################### */
/**
 This is the fundamental core of the recovery time calculator.
 All the action happens in the designated initializer. Once the struct is instantiated, its work is done.
 Most clients will use it by retrieving the "cleanTime" property, which will provide interpretations of the dates.
 
 This will not work with starting dates earlier than Jan 1, 1950.
 
 The algorithm is non-inclusive. It does not count the initial day. If the start date and end date are the same, zero days have passed.

 The granularity of the algorithm is complete days. The start time and end time are assumed to be noon.

 This uses [the Gregorian calendar](https://en.wikipedia.org/wiki/Gregorian_calendar) by default, but the calendar can be changed.
*/
public struct LGV_CleantimeDateCalc {
    /* ################################################################################################################################## */
    // MARK: Cleantime Event Markers
    /* ################################################################################################################################## */
    /**
     This enum is used as the response from the lastCleantimeMilestone computed property.
     This denotes the milestones that we use in NA.
     */
    public enum CleanTimeEvent: Equatable {
        /// Invalid (less than one day)
        case invalid
        
        /// One day (24 hours)
        case oneDay
        
        /// Thirty days (around a month)
        case thirtyDays
        
        /// Sixty days (around two months)
        case sixtyDays
        
        /// Ninety days (around three months)
        case ninetyDays
        
        /// Six months
        case sixMonths
        
        /// Nine months
        case nineMonths
        
        /// One year (12 months -may be different for leap years)
        case oneYear
        
        /// One and a half years
        case eighteenMonths
        
        /// Multiple years (associated value is the number of years between 2 and 5)
        case years(numberOfYears: Int)
        
        /// Five years
        case fiveYears
        
        /// Ten years
        case tenYears
        
        /// Fifteen years
        case fifteenYears
        
        /// Twenty years
        case twentyYears
        
        /// Twenty-five years
        case twentyFiveYears
        
        /// Ten thousand days (27.4 years)
        case tenThousandDays
        
        /// Thirty years
        case thirtyYears
        
        /// Forty years
        case fortyYears
    }
    
    /* ################################################################################################################################## */
    // MARK: Private Constant Instance Properties
    /* ################################################################################################################################## */
    /* ################################################################## */
    /**
     The starting date of the period (the cleandate).
     */
    private var _startDate: Date?
    
    /* ################################################################## */
    /**
     The ending date of the period (today, usually).
     */
    private var _endDate: Date?

    /* ################################################################## */
    /**
     The total number of days.
     */
    private var _totalDays: Int = 0

    /* ################################################################## */
    /**
     This is the calendar that we'll use. By default, it is [the Gregorian calendar](https://en.wikipedia.org/wiki/Gregorian_calendar).
     */
    private let _calendar: Calendar

    /* ################################################################################################################################## */
    // MARK: Private Instance Properties
    /* ################################################################################################################################## */
    /* ################################################################## */
    /**
     The number of years since the clean date.
     */
    private var _years: Int = 0
    
    /* ################################################################## */
    /**
     The number of months since the last year in the clean date.
     */
    private var _months: Int = 0
    
    /* ################################################################## */
    /**
     The number of days since the last month in the clean date.
     */
    private var _days: Int = 0

    /* ################################################################## */
    /**
     This will create a date object, from the given year, month, and day. You can also provide a calendar.
     
     - parameters:
        - year: The full year
        - month: The numeric month (1 - 12)
        - day: The numeric day (1-31)
        - calendar: The calendar to be used to make the date. This is optional (if not provided, the Gregorian calendar is used).
     
     - returns: A Date object, or nil, if the date is invalid.
     */
    private static func _makeDate(year inYear: Int, month inMonth: Int, day inDay: Int, calendar inCalendar: Calendar = Calendar(identifier: .gregorian)) -> Date? {
        inCalendar.date(from: DateComponents(year: inYear, month: inMonth, day: inDay))
    }

    /* ################################################################## */
    /**
     Calculates the total number of days.
     */
    private static func _calcTotalDays(from inStartDate: Date, to inEndDate: Date) -> Int {
        var startCalcDate: Date?
        var endCalcDate: Date?

        let startComponents = Calendar.current.dateComponents([.year, .month, .day], from: inStartDate)
        if let year = startComponents.year,
           let month = startComponents.month,
           let day = startComponents.day {
            startCalcDate = LGV_CleantimeDateCalc._makeDate(year: year, month: month, day: day, calendar: Calendar.current)
        }
        
        let endComponents = Calendar.current.dateComponents([.year, .month, .day], from: inEndDate)
        if let year = endComponents.year,
           let month = endComponents.month,
           let day = endComponents.day {
            endCalcDate = LGV_CleantimeDateCalc._makeDate(year: year, month: month, day: day, calendar: Calendar.current)
        }

        guard let startCalcDate = startCalcDate,
              let endCalcDate = endCalcDate
        else { return 0 }
        
        guard let totalDays = Calendar.current.dateComponents([.day], from: startCalcDate, to: endCalcDate).day else { return 0 }
        
        return max(0, totalDays)
    }

    /* ################################################################################################################################## */
    // MARK: Initializer
    /* ################################################################################################################################## */
    /* ################################################################## */
    /**
     This is the designated initializer. It takes two dates, and calculates between them.
    
     - parameter startDate: This is the "from" date. It is the start of the calculation. If not given, then an invalid date is assumed, and the result will be zero.
     - parameter endDate: This is the end date. The calculation goes between these two dates. This can be omitted, in which case, today is assumed.
     - parameter calendar: An optional calendar instance (default is nil). If nil, Gregorian is used.
     */
    public init(startDate inStartDate: Date? = nil, endDate inNowDate: Date? = nil, calendar inCalendar: Calendar? = nil) {
        // If a calendar was passed in, we use that.
        _calendar = nil == inCalendar ? Calendar(identifier: .gregorian) : inCalendar!
        let endDate = inNowDate ?? Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .short

        // This strips out the hours/minutes/seconds.
        if let startDate = inStartDate,
           let minDate = Calendar(identifier: .gregorian).date(from: DateComponents(year: 1950, month: 1, day: 1)),
           let cleanDate = _calendar.date(from: _calendar.dateComponents([.year, .month, .day], from: startDate)),
           cleanDate >= minDate {
            let tempStartComponents = _calendar.dateComponents([.year, .month, .day], from: startDate)
            let tempEndComponents = _calendar.dateComponents([.year, .month, .day], from: endDate)
            
            if let startYear = tempStartComponents.year,
               let startMonth = tempStartComponents.month,
               let startDay = tempStartComponents.day,
               let endYear = tempEndComponents.year,
               let endMonth = tempEndComponents.month,
               let endDay = tempEndComponents.day {
                _startDate = Self._makeDate(year: startYear, month: startMonth, day: startDay, calendar: _calendar)
                _endDate = Self._makeDate(year: endYear, month: endMonth, day: endDay, calendar: _calendar)

                if let startDate = _startDate,
                   let endDate = _endDate,
                   startDate < endDate {
                    // We get the total days.
                    _totalDays = Self._calcTotalDays(from: startDate, to: endDate)
                    
                    let myCalendar: Calendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
                    // Create our answer from the components of the result.
                    let unitFlags: NSCalendar.Unit = [NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day]
                    let myComponents = (myCalendar as NSCalendar).components(unitFlags, from: _startDate!, to: _endDate!, options: NSCalendar.Options.wrapComponents)
                    
                    if  let yearsTmp = myComponents.year,
                        let monthsTmp = myComponents.month,
                        let daysTmp = myComponents.day {
                        _years = yearsTmp
                        _months = monthsTmp
                        _days = daysTmp
                    }
                }
            }
        }
    }

    /* ################################################################################################################################## */
    // MARK: - Public Cleantime Container Struct -
    /* ################################################################################################################################## */
    /**
     This is a basic struct that contains the components, but in a simpler, read-only, form.
     
     This is what most clients will use, as it also offers interpretations.
     */
    public struct Cleantime {
        /* ############################################################################################################################## */
        // MARK: Constant Properties
        /* ############################################################################################################################## */
        /* ################################################################## */
        /**
         The starting date of the period (the cleandate).
         */
        public let startDate: Date?

        /* ################################################################## */
        /**
         The ending date of the period (today, usually).
         */
        public let endDate: Date?

        /* ################################################################## */
        /**
         The total number of days.
         */
        public let totalDays: Int
        
        /* ################################################################## */
        /**
         The number of years since the clean date.
         */
        public let years: Int
        
        /* ################################################################## */
        /**
         The number of months since the last year in the clean date.
         */
        public let months: Int
        
        /* ################################################################## */
        /**
         The number of days since the last month in the clean date.
         */
        public let days: Int
        
        /* ############################################################################################################################## */
        // MARK: Computed Properties
        /* ############################################################################################################################## */
        /* ################################################################## */
        /**
         The total number of months (as opposed to months after the year).
         */
        public var totalMonths: Int { (years * 12) + months }

        // MARK: Key Periods
        
        /* ################################################################## */
        /**
         True, if the date has at least one day.
         */
        public var isOneDayOrMore: Bool { 0 < totalDays }
        
        /* ################################################################## */
        /**
         True, if the date has thirty days or more.
        */
        public var isThirtyDaysOrMore: Bool { 29 < totalDays }
        
        /* ################################################################## */
        /**
         True, if the date has sixty days or more.
         */
        public var isSixtyDaysOrMore: Bool { 59 < totalDays }
        
        /* ################################################################## */
        /**
         True, if the date has niinety days or more.
         */
        public var isNinetyDaysOrMore: Bool { 89 < totalDays }
        
        /* ################################################################## */
        /**
         True, if the date has six months or more.
         */
        public var isSixMonthsOrMore: Bool { 0 < years || 5 < months }
        
        /* ################################################################## */
        /**
         True, if the date has nine months or more.
         */
        public var isNineMonthsOrMore: Bool { 0 < years || 8 < months }
        
        /* ################################################################## */
        /**
         True, if the date has one year or more.
         */
        public var isOneYearOrMore: Bool { 0 < years }
        
        /* ################################################################## */
        /**
         True, if the date has eighteen months or more.
         */
        public var isEighteenMonthsOrMore: Bool { 0 < years && ((5 < months) || (1 < years)) }

        /* ################################################################## */
        /**
         True, if the date has two years or more.
         */
        public var isTwoOrMoreYears: Bool { 1 < years }

        /* ################################################################## */
        /**
         True, if the date has five years or more.
         */
        public var isFiveOrMoreYears: Bool { 4 < years }

        /* ################################################################## */
        /**
         True, if the date has ten years or more.
         */
        public var isTenOrMoreYears: Bool { 9 < years }

        /* ################################################################## */
        /**
         True, if the date has fifteen years or more.
         */
        public var isFifteenOrMoreYears: Bool { 14 < years }

        /* ################################################################## */
        /**
         True, if the date has twenty years or more.
         */
        public var isTwentyOrMoreYears: Bool { 19 < years }

        /* ################################################################## */
        /**
         True, if the date has twenty-five years or more.
         */
        public var isTwentyFiveOrMoreYears: Bool { 24 < years }

        /* ################################################################## */
        /**
         True, if the date has ten thousand days (27.4 years) or more.
         */
        public var isTenThousandDaysOrMore: Bool { 9999 < totalDays }

        /* ################################################################## */
        /**
         True, if the date has thirty years or more.
         */
        public var isThirtyOrMoreYears: Bool { 29 < years }

        /* ################################################################## */
        /**
         True, if the date has forty years or more.
         */
        public var isFortyOrMoreYears: Bool { 39 < years }

        /* ################################################################## */
        /**
         True, if the date has fifty years or more.
         */
        public var isFiftyOrMoreYears: Bool { 49 < years }
        
        /* ############################################################################################################################## */
        // MARK: Initializer
        /* ############################################################################################################################## */
        /* ################################################################## */
        /**
         Basic initializer. All parameters required.
         - parameters:
             - startDate: The starting date
             - endDate: The ending date
             - totalDays: The total number of days between the two dates (inclusive).
             - years: The total number of years between the two dates.
             - months: The  number of months, over the years, between the two dates.
             - days: The  number of days, over the months and years, between the two dates.
         */
        public init(startDate inStartDate: Date?, endDate inEndDate: Date?, totalDays inTotalDays: Int, years inYears: Int, months inMonths: Int, days inDays: Int) {
            totalDays = inTotalDays
            years = inYears
            months = inMonths
            days = inDays
            startDate = inStartDate
            endDate = inEndDate
        }
    }
}

/* ###################################################################################################################################### */
// MARK: - Computed Properties -
/* ###################################################################################################################################### */
public extension LGV_CleantimeDateCalc {
    /* ################################################################## */
    /**
     This returns the cleantime, in the simple read-only struct form.
     */
    var cleanTime: Cleantime { Cleantime(startDate: startDate, endDate: endDate, totalDays: _totalDays, years: _years, months: _months, days: _days) }
    
    /* ################################################################## */
    /**
     The starting date of the period (the cleandate).
     */
    var startDate: Date? { _startDate }
    
    /* ################################################################## */
    /**
     The ending date of the period (today, usually).
     */
    var endDate: Date? { _endDate }

    /* ################################################################## */
    /**
     - returns: The date, or nil, of the last yearly milestone (if less than 1 year since the initial date, then this returns nil)
     */
    var dateOfLastAnnualMilestone: Date? {
        guard let startDate = _startDate,
              let endDate = _endDate,
              let years = _calendar.dateComponents([.year], from: _calendar.startOfDay(for: startDate), to: _calendar.startOfDay(for: endDate)).year,
              0 < years
        else { return nil }
        
        return yearsFromStart(years)
    }

    // MARK: Cleantime Milestone Utilities
    
    /* ################################################################## */
    /**
     The last cleantime event. Returns an enum, with the last "milestone" achieved, as of the end date.
     */
    var lastCleantimeMilestone: CleanTimeEvent {
        guard 0 < cleanTime.totalDays else { return .invalid }
        var ret = CleanTimeEvent.invalid
        
        if cleanTime.isFortyOrMoreYears {
            ret = .fortyYears
        } else if cleanTime.isThirtyOrMoreYears {
            ret = .thirtyYears
        } else if cleanTime.isTenThousandDaysOrMore {
            ret = .tenThousandDays
        } else if cleanTime.isTwentyFiveOrMoreYears {
            ret = .twentyFiveYears
        } else if cleanTime.isTwentyOrMoreYears {
            ret = .twentyYears
        } else if cleanTime.isFifteenOrMoreYears {
            ret = .fifteenYears
        } else if cleanTime.isTenOrMoreYears {
            ret = .tenYears
        } else if cleanTime.isFiveOrMoreYears {
            ret = .fiveYears
        } else if cleanTime.isTwoOrMoreYears {
            ret = .years(numberOfYears: cleanTime.years)
        } else if cleanTime.isEighteenMonthsOrMore {
            ret = .eighteenMonths
        } else if cleanTime.isOneYearOrMore {
            ret = .oneYear
        } else if cleanTime.isNineMonthsOrMore {
            ret = .nineMonths
        } else if cleanTime.isSixMonthsOrMore {
            ret = .sixMonths
        } else if cleanTime.isNinetyDaysOrMore {
            ret = .ninetyDays
        } else if cleanTime.isSixtyDaysOrMore {
            ret = .sixtyDays
        } else if cleanTime.isThirtyDaysOrMore {
            ret = .thirtyDays
        } else if cleanTime.isOneDayOrMore {
            ret = .oneDay
        }
        
        return ret
    }

    /* ################################################################## */
    /**
     The last cleantime event. Returns the date that the last cleantime milestone was met. Nil, if invalid.
     */
    var dateOfLastCleantimeMilestone: Date? { dateOfThisCleantimeMilestone(lastCleantimeMilestone) }
    
    /* ################################################################## */
    /**
     Returns the date of the milestone this many days from the start.
     - parameter inDays: The number of days to calculate from the start.
     - returns: The date (or nil, if it is undefined).
     */
    func daysFromStart(_ inDays: Int) -> Date? {
        var ret: Date?
        
        if let startDate = startDate {
            let temp = startDate.addingTimeInterval(60 * 60 * 24 * TimeInterval(inDays))
            let tempComponents = _calendar.dateComponents([.year, .month, .day], from: temp)
            if let year = tempComponents.year,
               let month = tempComponents.month,
               let day = tempComponents.day {
                ret = Self._makeDate(year: year, month: month, day: day, calendar: _calendar)
            }
        }
        
        return ret
    }
    
    /* ################################################################## */
    /**
     Returns the date of the milestone this many months from the start.
     - parameter inMonths: The number of months to calculate from the start.
     - returns: The date (or nil, if it is undefined).
     */
    func monthsFromStart(_ inMonths: Int) -> Date? {
        var ret: Date?
        
        if let startDate = startDate {
            let startDateComponents = _calendar.dateComponents([.year, .month, .day], from: startDate)

            if var year = startDateComponents.year,
               var month = startDateComponents.month,
               let day = startDateComponents.day {
                month += inMonths
                while 12 < month {
                    month -= 12
                    year += 1
                }
                
                ret = Self._makeDate(year: year, month: month, day: day, calendar: _calendar)
            }
        }

        return ret
    }
    
    /* ################################################################## */
    /**
     Returns the date of the milestone this many years from the start.
     - parameter inYears: The number of years to calculate from the start.
     - returns: The date (or nil, if it is undefined).
     */
    func yearsFromStart(_ inYears: Int) -> Date? {
        var ret: Date?
        
        if let startDate = startDate {
            let startDateComponents = _calendar.dateComponents([.year, .month, .day], from: startDate)
            
            if let year = startDateComponents.year,
               let month = startDateComponents.month,
               var day = startDateComponents.day {
                
                // Special exception for leap years in the Gregorian calendar.
                if .gregorian == _calendar.identifier,
                   2 == month,
                   29 == day {
                    day = 28
                }

                ret = Self._makeDate(year: year + inYears, month: month, day: day, calendar: _calendar)
            }
        }

        return ret
    }

    /* ################################################################## */
    /**
     This will return the exact date that a particular milestone was reached.
     - parameter inCleantimeMileStone: The enum, specifying the milestone to test.
     - returns: The date, or nil, if the milestone (or this struct) is invalid.
     */
    func dateOfThisCleantimeMilestone(_ inCleantimeMilestone: CleanTimeEvent) -> Date? {
        var ret: Date?
        
        switch inCleantimeMilestone {
        case .oneDay:
            ret = daysFromStart(1)
            
        case .thirtyDays:
            ret = daysFromStart(30)

        case .sixtyDays:
            ret = daysFromStart(60)

        case .ninetyDays:
            ret = daysFromStart(90)

        case .sixMonths:
            ret = monthsFromStart(6)

        case .nineMonths:
            ret = monthsFromStart(9)

        case .oneYear:
            ret = yearsFromStart(1)

        case .eighteenMonths:
            ret = monthsFromStart(18)

        case .years(let numberOfYears):
            ret = yearsFromStart(numberOfYears)

        case .fiveYears:
            ret = yearsFromStart(5)

        case .tenYears:
            ret = yearsFromStart(10)

        case .fifteenYears:
            ret = yearsFromStart(15)

        case .twentyYears:
            ret = yearsFromStart(20)

        case .twentyFiveYears:
            ret = yearsFromStart(25)

        case .tenThousandDays:
            ret = daysFromStart(10000)

        case .thirtyYears:
            ret = yearsFromStart(30)

        case .fortyYears:
            ret = yearsFromStart(40)

        default:
            break
        }
        
        return ret
    }
    
    // MARK: Date Utilities
    
    /* ################################################################## */
    /**
     Returns the cleantime in standard Date Components form.
     */
    var components: DateComponents { DateComponents(year: _years, month: _months, day: _days) }
    
    /* ################################################################## */
    /**
     Returns the cleantime as a Time Interval
     */
    var timeInterval: TimeInterval? { nil != _startDate ? _endDate?.timeIntervalSince(_startDate!) : nil }
}
