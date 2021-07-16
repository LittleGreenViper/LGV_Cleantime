/*
  © Copyright 2021, Little Green Viper Software Development LLC 
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

import XCTest
import LGV_Cleantime

/* ###################################################################################################################################### */
// MARK: - Calculations Tests -
/* ###################################################################################################################################### */
/**
*/
class LGV_CleantimeCalculationTests: XCTestCase {
    /* ################################################################## */
    /**
     */
    static func makeDate(year inYear: Int, month inMonth: Int, day inDay: Int) -> Date { Calendar(identifier: .gregorian).date(from: DateComponents(year: inYear, month: inMonth, day: inDay)) ?? Date() }

    /* ################################################################## */
    /**
     */
    var endDate = Date()
    
    /* ################################################################## */
    /**
     */
    var startDate = Date()
    
    /* ################################################################## */
    /**
     */
    override func setUp() {
        endDate = Self.makeDate(year: 2021, month: 1, day: 1)
    }
    
    /* ################################################################## */
    /**
     */
    func testDateCalcSimpleYearRanges() {
        startDate = Self.makeDate(year: 1950, month: 1, day: 1)
        var testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 25933)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 852)
        XCTAssertEqual(testTarget.cleanTime.years, 71)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 0)
        
        startDate = Self.makeDate(year: 1960, month: 1, day: 1)
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 22281)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 732)
        XCTAssertEqual(testTarget.cleanTime.years, 61)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 0)
        
        startDate = Self.makeDate(year: 1970, month: 1, day: 1)
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 18628)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 612)
        XCTAssertEqual(testTarget.cleanTime.years, 51)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 0)

        startDate = Self.makeDate(year: 1980, month: 1, day: 1)
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 14976)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 492)
        XCTAssertEqual(testTarget.cleanTime.years, 41)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 0)

        startDate = Self.makeDate(year: 2000, month: 1, day: 1)
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 7671)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 252)
        XCTAssertEqual(testTarget.cleanTime.years, 21)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 0)
        
        startDate = Self.makeDate(year: 2020, month: 1, day: 1)
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 366)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 12)
        XCTAssertEqual(testTarget.cleanTime.years, 1)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 0)
        
        startDate = Self.makeDate(year: 2019, month: 1, day: 1)
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 731)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 24)
        XCTAssertEqual(testTarget.cleanTime.years, 2)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 0)

        // Test for non-leap year.
        startDate = Self.makeDate(year: 2019, month: 1, day: 1)
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: Self.makeDate(year: 2020, month: 1, day: 1))
        XCTAssertEqual(testTarget.cleanTime.totalDays, 365)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 12)
        XCTAssertEqual(testTarget.cleanTime.years, 1)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 0)

        testTarget = LGV_CleantimeDateCalc(startDate: endDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 0)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 0)
        XCTAssertEqual(testTarget.cleanTime.years, 0)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 0)
    }
    
    func testDateCalc1953() {
        startDate = Self.makeDate(year: 1953, month: 10, day: 5)
        var testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 806)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 24560)
        XCTAssertEqual(testTarget.cleanTime.years, 67)
        XCTAssertEqual(testTarget.cleanTime.months, 2)
        XCTAssertEqual(testTarget.cleanTime.days, 27)
        
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: Self.makeDate(year: 1953, month: 11, day: 5))
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 1)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 31)
        XCTAssertEqual(testTarget.cleanTime.years, 0)
        XCTAssertEqual(testTarget.cleanTime.months, 1)
        XCTAssertEqual(testTarget.cleanTime.days, 0)
        
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: Self.makeDate(year: 1953, month: 11, day: 4))
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 0)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 30)
        XCTAssertEqual(testTarget.cleanTime.years, 0)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 30)
        
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: Self.makeDate(year: 1953, month: 11, day: 6))
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 1)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 32)
        XCTAssertEqual(testTarget.cleanTime.years, 0)
        XCTAssertEqual(testTarget.cleanTime.months, 1)
        XCTAssertEqual(testTarget.cleanTime.days, 1)
        
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: Self.makeDate(year: 1953, month: 12, day: 5))
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 2)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 61)
        XCTAssertEqual(testTarget.cleanTime.years, 0)
        XCTAssertEqual(testTarget.cleanTime.months, 2)
        XCTAssertEqual(testTarget.cleanTime.days, 0)
        
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: Self.makeDate(year: 1954, month: 12, day: 5))
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 14)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 426)
        XCTAssertEqual(testTarget.cleanTime.years, 1)
        XCTAssertEqual(testTarget.cleanTime.months, 2)
        XCTAssertEqual(testTarget.cleanTime.days, 0)

        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: Self.makeDate(year: 1953, month: 12, day: 4))
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 1)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 60)
        XCTAssertEqual(testTarget.cleanTime.years, 0)
        XCTAssertEqual(testTarget.cleanTime.months, 1)
        XCTAssertEqual(testTarget.cleanTime.days, 29)
        
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: Self.makeDate(year: 1963, month: 11, day: 5))
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 121)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 3683)
        XCTAssertEqual(testTarget.cleanTime.years, 10)
        XCTAssertEqual(testTarget.cleanTime.months, 1)
        XCTAssertEqual(testTarget.cleanTime.days, 0)
        
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: Self.makeDate(year: 1963, month: 10, day: 5))
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 120)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 3651)
        XCTAssertEqual(testTarget.cleanTime.years, 10)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 0)
        
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: Self.makeDate(year: 1960, month: 1, day: 1))
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 74)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 2279)
        XCTAssertEqual(testTarget.cleanTime.years, 6)
        XCTAssertEqual(testTarget.cleanTime.months, 2)
        XCTAssertEqual(testTarget.cleanTime.days, 27)
    }
    
    func testDateCalcLeapYear() {
        startDate = Self.makeDate(year: 2020, month: 1, day: 31)
        endDate = Self.makeDate(year: 2020, month: 3, day: 1)
        var testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 1)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 30)
        XCTAssertEqual(testTarget.cleanTime.years, 0)
        XCTAssertEqual(testTarget.cleanTime.months, 1)
        XCTAssertEqual(testTarget.cleanTime.days, 1)
        
        startDate = Self.makeDate(year: 2021, month: 1, day: 31)
        endDate = Self.makeDate(year: 2021, month: 3, day: 1)
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 1)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 29)
        XCTAssertEqual(testTarget.cleanTime.years, 0)
        XCTAssertEqual(testTarget.cleanTime.months, 1)
        XCTAssertEqual(testTarget.cleanTime.days, 1)

        startDate = Self.makeDate(year: 2019, month: 2, day: 28)
        endDate = Self.makeDate(year: 2020, month: 2, day: 28)
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 12)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 365)
        XCTAssertEqual(testTarget.cleanTime.years, 1)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 0)

        endDate = Self.makeDate(year: 2020, month: 2, day: 29)
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 12)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 366)
        XCTAssertEqual(testTarget.cleanTime.years, 1)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 1)

        endDate = Self.makeDate(year: 2020, month: 3, day: 1)
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 12)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 367)
        XCTAssertEqual(testTarget.cleanTime.years, 1)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 2)

        endDate = Self.makeDate(year: 2020, month: 3, day: 31)
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 13)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 396)
        XCTAssertEqual(testTarget.cleanTime.years, 1)
        XCTAssertEqual(testTarget.cleanTime.months, 1)
        XCTAssertEqual(testTarget.cleanTime.days, 3)

        endDate = Self.makeDate(year: 2020, month: 4, day: 1)
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 13)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 397)
        XCTAssertEqual(testTarget.cleanTime.years, 1)
        XCTAssertEqual(testTarget.cleanTime.months, 1)
        XCTAssertEqual(testTarget.cleanTime.days, 4)

        startDate = Self.makeDate(year: 2020, month: 2, day: 29)
        endDate = Self.makeDate(year: 2021, month: 2, day: 28)
        testTarget = LGV_CleantimeDateCalc(startDate: startDate, endDate: endDate)
        XCTAssertEqual(testTarget.cleanTime.totalMonths, 12)
        XCTAssertEqual(testTarget.cleanTime.totalDays, 365)
        XCTAssertEqual(testTarget.cleanTime.years, 1)
        XCTAssertEqual(testTarget.cleanTime.months, 0)
        XCTAssertEqual(testTarget.cleanTime.days, 0)
    }
}
