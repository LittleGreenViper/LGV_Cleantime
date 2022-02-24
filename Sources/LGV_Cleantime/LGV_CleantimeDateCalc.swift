/*
  © Copyright 2021, Little Green Viper Software Development LLC
 
 Version: 1.2.0
 
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
    private let _startDate: Date?
    
    /* ################################################################## */
    /**
     The ending date of the period (today, usually).
     */
    private let _endDate: Date?

    /* ################################################################## */
    /**
     The total number of days.
     */
    private let _totalDays: Int

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
    private static func _makeDate(year inYear: Int, month inMonth: Int, day inDay: Int, calendar inCalendar: Calendar? = nil) -> Date? {
        (nil == inCalendar ? Calendar(identifier: .gregorian) : inCalendar!).date(from: DateComponents(year: inYear, month: inMonth, day: inDay))
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
        // This strips out the hours/minutes/seconds.
        if  let startDate = inStartDate,
            let minDate = Calendar(identifier: .gregorian).date(from: DateComponents(year: 1950, month: 1, day: 1)),
            let cleanDate = _calendar.date(from: _calendar.dateComponents([.year, .month, .day], from: startDate)),
            cleanDate >= minDate,
            let nowDate = _calendar.date(from: _calendar.dateComponents([.year, .month, .day], from: inNowDate ?? Date())) {
            // The reason for all this wackiness, is we want to completely strip out the time element of each date. We want the days to be specified at noon.
            let fromString: String = DateFormatter.localizedString(from: cleanDate, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.none)
            let toString: String = DateFormatter.localizedString(from: nowDate, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.none)
            
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .none
            dateFormatter.dateStyle = .short
            
            var tempComponents = _calendar.dateComponents([.year, .month, .day], from: startDate)
            if let year = tempComponents.year,
               let month = tempComponents.month,
               let day = tempComponents.day {
                _startDate = Self._makeDate(year: year, month: month, day: day, calendar: _calendar)
            } else {
                _startDate = dateFormatter.date(from: fromString)?.addingTimeInterval(43200)
            }
            
            tempComponents = _calendar.dateComponents([.year, .month, .day], from: nowDate)
            if let year = tempComponents.year,
               let month = tempComponents.month,
               let day = tempComponents.day {
                _endDate = Self._makeDate(year: year, month: month, day: day, calendar: _calendar)
            } else {
                _endDate = dateFormatter.date(from: toString)?.addingTimeInterval(43200)
            }
            
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
            } else {
                _totalDays = 0
            }
        } else {
            _totalDays = 0
            _startDate = nil
            _endDate = nil
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
    var dateOfLastCleantimeMilestone: Date? {
        var ret: Date?
        
        guard let startDate = startDate else { return ret }
        
        let oneDay: TimeInterval = 60 * 60 * 24
        let startDateComponents = _calendar.dateComponents([.year, .month, .day], from: startDate)
        
        switch lastCleantimeMilestone {
        case .oneDay:
            let temp = startDate.addingTimeInterval(oneDay)
            let tempComponents = _calendar.dateComponents([.year, .month, .day], from: temp)
            if let year = tempComponents.year,
               let month = tempComponents.month,
               let day = tempComponents.day {
                ret = Self._makeDate(year: year, month: month, day: day, calendar: _calendar)
            }
            
        case .thirtyDays:
            let temp = startDate.addingTimeInterval(30 * oneDay)
            let tempComponents = _calendar.dateComponents([.year, .month, .day], from: temp)
            if let year = tempComponents.year,
               let month = tempComponents.month,
               let day = tempComponents.day {
                ret = Self._makeDate(year: year, month: month, day: day, calendar: _calendar)
            }

        case .sixtyDays:
            let temp = startDate.addingTimeInterval(60 * oneDay)
            let tempComponents = _calendar.dateComponents([.year, .month, .day], from: temp)
            if let year = tempComponents.year,
               let month = tempComponents.month,
               let day = tempComponents.day {
                ret = Self._makeDate(year: year, month: month, day: day, calendar: _calendar)
            }

        case .ninetyDays:
            let temp = startDate.addingTimeInterval(90 * oneDay)
            let tempComponents = _calendar.dateComponents([.year, .month, .day], from: temp)
            if let year = tempComponents.year,
               let month = tempComponents.month,
               let day = tempComponents.day {
                ret = Self._makeDate(year: year, month: month, day: day, calendar: _calendar)
            }

        case .sixMonths:
            if var year = startDateComponents.year,
               var month = startDateComponents.month,
               let day = startDateComponents.day {
                month += 6
                if 12 < month {
                    month = 12 - month
                    year += 1
                }
                
                ret = Self._makeDate(year: year, month: month, day: day, calendar: _calendar)
            }
            
        case .nineMonths:
            if var year = startDateComponents.year,
               var month = startDateComponents.month,
               let day = startDateComponents.day {
                month += 9
                if 12 < month {
                    month = 12 - month
                    year += 1
                }
                ret = Self._makeDate(year: year, month: month, day: day, calendar: _calendar)
            }

        case .oneYear:
            if let year = startDateComponents.year,
               let month = startDateComponents.month,
               var day = startDateComponents.day {
                
                // Special exception for leap years in the Gregorian calendar.
                if .gregorian == _calendar.identifier,
                   2 == month,
                   29 == day {
                    day = 28
                }

                ret = Self._makeDate(year: year + 1, month: month, day: day, calendar: _calendar)
            }

        case .eighteenMonths:
            if var year = startDateComponents.year,
               var month = startDateComponents.month,
               var day = startDateComponents.day {
                
                // Special exception for leap years in the Gregorian calendar.
                if .gregorian == _calendar.identifier,
                   2 == month,
                   29 == day {
                    day = 28
                }

                year += 1
                month += 6
                if 12 < month {
                    month = 12 - month
                    year += 1
                }
                ret = Self._makeDate(year: year, month: month, day: day, calendar: _calendar)
            }

        case .years(let numberOfYears):
            if let year = startDateComponents.year,
               let month = startDateComponents.month,
               var day = startDateComponents.day {
                
                // Special exception for leap years in the Gregorian calendar.
                if .gregorian == _calendar.identifier,
                   2 == month,
                   29 == day {
                    day = 28
                }

                ret = Self._makeDate(year: year + numberOfYears, month: month, day: day, calendar: _calendar)
            }

        case .fiveYears:
            if let year = startDateComponents.year,
               let month = startDateComponents.month,
               var day = startDateComponents.day {
                
                // Special exception for leap years in the Gregorian calendar.
                if .gregorian == _calendar.identifier,
                   2 == month,
                   29 == day {
                    day = 28
                }

                ret = Self._makeDate(year: year + 5, month: month, day: day, calendar: _calendar)
            }

        case .tenYears:
            if let year = startDateComponents.year,
               let month = startDateComponents.month,
               var day = startDateComponents.day {
                
                // Special exception for leap years in the Gregorian calendar.
                if .gregorian == _calendar.identifier,
                   2 == month,
                   29 == day {
                    day = 28
                }

                ret = Self._makeDate(year: year + 10, month: month, day: day, calendar: _calendar)
            }

        case .fifteenYears:
            if let year = startDateComponents.year,
               let month = startDateComponents.month,
               var day = startDateComponents.day {
                
                // Special exception for leap years in the Gregorian calendar.
                if .gregorian == _calendar.identifier,
                   2 == month,
                   29 == day {
                    day = 28
                }

                ret = Self._makeDate(year: year + 15, month: month, day: day, calendar: _calendar)
            }

        case .twentyYears:
            if let year = startDateComponents.year,
               let month = startDateComponents.month,
               var day = startDateComponents.day {
                
                // Special exception for leap years in the Gregorian calendar.
                if .gregorian == _calendar.identifier,
                   2 == month,
                   29 == day {
                    day = 28
                }

                ret = Self._makeDate(year: year + 20, month: month, day: day, calendar: _calendar)
            }

        case .twentyFiveYears:
            if let year = startDateComponents.year,
               let month = startDateComponents.month,
               var day = startDateComponents.day {
                
                // Special exception for leap years in the Gregorian calendar.
                if .gregorian == _calendar.identifier,
                   2 == month,
                   29 == day {
                    day = 28
                }

                ret = Self._makeDate(year: year + 25, month: month, day: day, calendar: _calendar)
            }

        case .tenThousandDays:
            let temp = startDate.addingTimeInterval(10000 * oneDay)
            let tempComponents = _calendar.dateComponents([.year, .month, .day], from: temp)
            if let year = tempComponents.year,
               let month = tempComponents.month,
               let day = tempComponents.day {
                ret = Self._makeDate(year: year, month: month, day: day, calendar: _calendar)
            }

        case .thirtyYears:
            if let year = startDateComponents.year,
               let month = startDateComponents.month,
               var day = startDateComponents.day {
                
                // Special exception for leap years in the Gregorian calendar.
                if .gregorian == _calendar.identifier,
                   2 == month,
                   29 == day {
                    day = 28
                }

                ret = Self._makeDate(year: year + 30, month: month, day: day, calendar: _calendar)
            }

        case .fortyYears:
            if let year = startDateComponents.year,
               let month = startDateComponents.month,
               var day = startDateComponents.day {
                
                // Special exception for leap years in the Gregorian calendar.
                if .gregorian == _calendar.identifier,
                   2 == month,
                   29 == day {
                    day = 28
                }

                ret = Self._makeDate(year: year + 40, month: month, day: day, calendar: _calendar)
            }

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
