/*
  © Copyright 2021, Little Green Viper Software Development LLC
 
 Version: 1.0.1
 
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
 All the action happens in the designated initializer. Once the class is instantiated, its work is done.
 Most clients will use it by retrieving the "cleanTime" property, which will provide interpretations of the dates.
 
 This will not work with starting dates earlier than Jan 1, 1950.
 
 The algorithm is non-inclusive. It does not count the initial day. If the start date and end date are the same, zero days have passed.

 The granularity of the algorithm is complete days. The start time and end time are assumed to be noon.

 This uses [the Gregorian calendar](https://en.wikipedia.org/wiki/Gregorian_calendar).
*/
public struct LGV_CleantimeDateCalc {
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

    /* ################################################################################################################################## */
    // MARK: Initializer
    /* ################################################################################################################################## */
    /* ################################################################## */
    /**
     This is the designated initializer. It takes two dates, and calculates between them.
    
     - parameter startDate: This is the "from" date. It is the start of the calculation. If not given, then an invalid date is assumed, and the result will be zero.
     - parameter endDate: This is the end date. The calculation goes between these two dates. This can be omitted, in which case, today is assumed.
     */
    public init(startDate inStartDate: Date? = nil, endDate inNowDate: Date? = nil) {
        
        // This strips out the hours/minutes/seconds.
        if  let startDate = inStartDate,
            let minDate = Calendar(identifier: .gregorian).date(from: DateComponents(year: 1950, month: 1, day: 1)),
            let cleanDate = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: startDate)),
            cleanDate >= minDate,
            let nowDate = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: inNowDate ?? Date())) {
            // The reason for all this wackiness, is we want to completely strip out the time element of each date. We want the days to be specified at noon.
            let fromString: String = DateFormatter.localizedString(from: cleanDate, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.none)
            let toString: String = DateFormatter.localizedString(from: nowDate, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.none)
            
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .none
            dateFormatter.dateStyle = .short
            
            // We have stripped out the time information, and each day is at noon.
            _startDate = dateFormatter.date(from: fromString)?.addingTimeInterval(43200)  // Make it Noon, Numbah One.
            _endDate = dateFormatter.date(from: toString)?.addingTimeInterval(43200)
            
            if let startDate = _startDate,
               let endDate = _endDate,
               startDate < endDate {
                // We get the total days.
                _totalDays = Int(trunc((endDate.timeIntervalSince(startDate)) / 86400.0 )) // Change seconds into days.
            
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
