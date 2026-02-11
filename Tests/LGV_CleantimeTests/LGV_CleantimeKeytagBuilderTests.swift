/*
  © Copyright 2021-2026, Little Green Viper Software Development LLC
 
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
// MARK: - Keytag Description Tests -
/* ###################################################################################################################################### */
/**
*/
class LGV_CleantimeKeytagBuilderTests: XCTestCase {
    /* ################################################################## */
    /**
     Just a simple rerouter for the makeDate() method.
     */
    static func makeDate(year inYear: Int, month inMonth: Int, day inDay: Int) -> Date { LGV_CleantimeCalculationTests.makeDate(year: inYear, month: inMonth, day: inDay) }
    
    /* ################################################################## */
    /**
     */
    func testZeroDay() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 1, day: 1)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 1)
        XCTAssertEqual(testSet[0].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[0].textImage, .text_WelcomeBack)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_HotPink)
            XCTAssertEqual(testTag.textImage, .text_WelcomeBack)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 1)
        XCTAssertEqual(testSet[0].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[0].textImage, .text_WelcomeBack)
    }

    /* ################################################################## */
    /**
     */
    func testOneDay() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 1, day: 2)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 1)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_White)
            XCTAssertEqual(testTag.textImage, .text_OneDay)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 1)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
    }
    
    /* ################################################################## */
    /**
     */
    func testTwentyNineDays() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 1, day: 30)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 1)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_White)
            XCTAssertEqual(testTag.textImage, .text_OneDay)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 1)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
    }

    /* ################################################################## */
    /**
     */
    func testThirtyDays() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 1, day: 31)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 2)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_DaygloOrange)
            XCTAssertEqual(testTag.textImage, .text_ThirtyDays)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 2)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
    }

    /* ################################################################## */
    /**
     */
    func testThirtyOneDays() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 2, day: 1)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 2)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_DaygloOrange)
            XCTAssertEqual(testTag.textImage, .text_ThirtyDays)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 2)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
    }

    /* ################################################################## */
    /**
     */
    func testFiftyNineDays() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 2, day: 29)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 2)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_DaygloOrange)
            XCTAssertEqual(testTag.textImage, .text_ThirtyDays)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 2)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
    }

    /* ################################################################## */
    /**
     */
    func testSixtyDays() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 3, day: 1)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 3)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_DaygloGreen)
            XCTAssertEqual(testTag.textImage, .text_SixtyDays)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 3)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
    }

    /* ################################################################## */
    /**
     */
    func testSixtyOneDays() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 3, day: 2)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 3)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_DaygloGreen)
            XCTAssertEqual(testTag.textImage, .text_SixtyDays)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 3)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
    }

    /* ################################################################## */
    /**
     */
    func testEightyNineDays() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 3, day: 31)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 4)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Red)
            XCTAssertEqual(testTag.textImage, .text_NinetyDays)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 4)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
    }

    /* ################################################################## */
    /**
     */
    func testNinetyDays() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 4, day: 1)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 4)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Red)
            XCTAssertEqual(testTag.textImage, .text_NinetyDays)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 4)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
    }

    /* ################################################################## */
    /**
     */
    func testNinetyOneDays() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 4, day: 2)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 4)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Red)
            XCTAssertEqual(testTag.textImage, .text_NinetyDays)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 4)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
    }

    /* ################################################################## */
    /**
     */
    func testFiveMonthsAnd30Days() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 6, day: 30)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 4)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Red)
            XCTAssertEqual(testTag.textImage, .text_NinetyDays)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 4)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
    }

    /* ################################################################## */
    /**
     */
    func testSixMonths() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 7, day: 1)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 5)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Blue)
            XCTAssertEqual(testTag.textImage, .text_SixMonths)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 5)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
    }

    /* ################################################################## */
    /**
     */
    func testSixMonthsAndOneDay() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 7, day: 2)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 5)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Blue)
            XCTAssertEqual(testTag.textImage, .text_SixMonths)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 5)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
    }

    /* ################################################################## */
    /**
     */
    func testEightMonthsAndThirtyDays() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 9, day: 30)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 5)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Blue)
            XCTAssertEqual(testTag.textImage, .text_SixMonths)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 5)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
    }

    /* ################################################################## */
    /**
     */
    func testNineMonths() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                               endDate: Self.makeDate(year: 2020, month: 10, day: 1)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 6)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Yellow)
            XCTAssertEqual(testTag.textImage, .text_NineMonths)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 6)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
    }

    /* ################################################################## */
    /**
     */
    func testNineMonthsAndOneDay() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                             endDate: Self.makeDate(year: 2020, month: 10, day: 2)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 6)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Yellow)
            XCTAssertEqual(testTag.textImage, .text_NineMonths)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 6)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
    }

    /* ################################################################## */
    /**
     */
    func testElevenMonthsAndThirtyOneDaysNonLeapYear() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2019, month: 1, day: 1),
                                             endDate: Self.makeDate(year: 2019, month: 12, day: 31)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 6)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Yellow)
            XCTAssertEqual(testTag.textImage, .text_NineMonths)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 6)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
    }

    /* ################################################################## */
    /**
     */
    func testElevenMonthsAndThirtyOneDays() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                             endDate: Self.makeDate(year: 2020, month: 12, day: 31)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 6)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Yellow)
            XCTAssertEqual(testTag.textImage, .text_NineMonths)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 6)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
    }

    /* ################################################################## */
    /**
     */
    func testOneYear() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                             endDate: Self.makeDate(year: 2021, month: 1, day: 1)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 7)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Moonglow)
            XCTAssertEqual(testTag.textImage, .text_OneYear)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 7)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
    }

    /* ################################################################## */
    /**
     */
    func testOneNonLeapYear() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2019, month: 1, day: 1),
                                             endDate: Self.makeDate(year: 2020, month: 1, day: 1)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 7)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Moonglow)
            XCTAssertEqual(testTag.textImage, .text_OneYear)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 7)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
    }

    /* ################################################################## */
    /**
     */
    func testOneYearAndOneDay() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                             endDate: Self.makeDate(year: 2021, month: 1, day: 2)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 7)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Moonglow)
            XCTAssertEqual(testTag.textImage, .text_OneYear)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 7)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
    }

    /* ################################################################## */
    /**
     */
    func testOneYearAndOneDayNonLeapYear() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2019, month: 1, day: 1),
                                             endDate: Self.makeDate(year: 2020, month: 1, day: 2)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 7)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Moonglow)
            XCTAssertEqual(testTag.textImage, .text_OneYear)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 7)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
    }

    /* ################################################################## */
    /**
     */
    func testJustUnder18Months() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                             endDate: Self.makeDate(year: 2021, month: 6, day: 30)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 7)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Moonglow)
            XCTAssertEqual(testTag.textImage, .text_OneYear)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 7)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
    }

    /* ################################################################## */
    /**
     */
    func testJustUnder18MonthsWithLeapYear() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2019, month: 1, day: 1),
                                             endDate: Self.makeDate(year: 2020, month: 6, day: 30)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 7)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Moonglow)
            XCTAssertEqual(testTag.textImage, .text_OneYear)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 7)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
    }

    /* ################################################################## */
    /**
     */
    func testJustUnder18MonthsNoLeapYear() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2018, month: 1, day: 1),
                                             endDate: Self.makeDate(year: 2019, month: 6, day: 30)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 7)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Moonglow)
            XCTAssertEqual(testTag.textImage, .text_OneYear)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 7)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
    }

    /* ################################################################## */
    /**
     */
    func test18Months() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 2020, month: 1, day: 1),
                                             endDate: Self.makeDate(year: 2021, month: 7, day: 1)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 8)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Gray)
            XCTAssertEqual(testTag.textImage, .text_EighteenMonths)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 8)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
    }

    /* ################################################################## */
    /**
     */
    func testJustUnderTwoYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1998, month: 1, day: 1),
                                             endDate: Self.makeDate(year: 1999, month: 12, day: 31)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 8)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Gray)
            XCTAssertEqual(testTag.textImage, .text_EighteenMonths)
        } else {
            XCTFail("No Keytag!")
        }
        
        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 8)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
    }

    /* ################################################################## */
    /**
     */
    func testTwoYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1998, month: 1, day: 1),
                                             endDate: Self.makeDate(year: 2000, month: 1, day: 1)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 9)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Black)
            XCTAssertEqual(testTag.textImage, .text_MultiYear)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 9)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
    }

    /* ################################################################## */
    /**
     */
    func testJustUnderFiveYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1996, month: 6, day: 24),
                                             endDate: Self.makeDate(year: 2001, month: 6, day: 23)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 9)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Black)
            XCTAssertEqual(testTag.textImage, .text_MultiYear)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 11)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
    }

    /* ################################################################## */
    /**
     */
    func testFiveYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1996, month: 6, day: 24),
                                             endDate: Self.makeDate(year: 2001, month: 6, day: 24)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 10)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_BurntOrange)
            XCTAssertEqual(testTag.textImage, .text_FiveYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 12)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
    }

    /* ################################################################## */
    /**
     */
    func testJustUnderTenYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1996, month: 6, day: 24),
                                             endDate: Self.makeDate(year: 2006, month: 6, day: 23)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 10)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_BurntOrange)
            XCTAssertEqual(testTag.textImage, .text_FiveYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 16)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
    }

    /* ################################################################## */
    /**
     */
    func testTenYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1996, month: 6, day: 24),
                                             endDate: Self.makeDate(year: 2006, month: 6, day: 24)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 11)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Speckled)
            XCTAssertEqual(testTag.textImage, .text_TenYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 17)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
    }

    /* ################################################################## */
    /**
     */
    func testJustUnderFifteenYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1995, month: 12, day: 31),
                                             endDate: Self.makeDate(year: 2010, month: 12, day: 30)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 11)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Speckled)
            XCTAssertEqual(testTag.textImage, .text_TenYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 21)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
    }

    /* ################################################################## */
    /**
     */
    func testFifteenYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1995, month: 12, day: 31),
                                             endDate: Self.makeDate(year: 2010, month: 12, day: 31)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 12)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_HunterGreen)
            XCTAssertEqual(testTag.textImage, .text_FifteenYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 22)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
    }

    /* ################################################################## */
    /**
     */
    func testJustUnderFifteenYearsWithALeapYear() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1996, month: 2, day: 29),
                                             endDate: Self.makeDate(year: 2011, month: 2, day: 27)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 11)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Speckled)
            XCTAssertEqual(testTag.textImage, .text_TenYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 21)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
    }

    /* ################################################################## */
    /**
     */
    func testFifteenYearsWithALeapYear() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1996, month: 2, day: 29),
                                             endDate: Self.makeDate(year: 2011, month: 2, day: 28)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 12)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_HunterGreen)
            XCTAssertEqual(testTag.textImage, .text_FifteenYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 22)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
    }

    /* ################################################################## */
    /**
     */
    func testJustUnderTwentyYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1993, month: 4, day: 29),
                                             endDate: Self.makeDate(year: 2013, month: 4, day: 28)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 12)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_HunterGreen)
            XCTAssertEqual(testTag.textImage, .text_FifteenYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 26)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[22].bodyImage, .body_Black)
        XCTAssertEqual(testSet[22].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[23].bodyImage, .body_Black)
        XCTAssertEqual(testSet[23].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[24].bodyImage, .body_Black)
        XCTAssertEqual(testSet[24].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[25].bodyImage, .body_Black)
        XCTAssertEqual(testSet[25].textImage, .text_MultiYear)
    }

    /* ################################################################## */
    /**
     */
    func testTwentyYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1993, month: 4, day: 29),
                                             endDate: Self.makeDate(year: 2013, month: 4, day: 29)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 13)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[12].textImage, .text_TwentyYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Purple)
            XCTAssertEqual(testTag.textImage, .text_TwentyYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 27)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[22].bodyImage, .body_Black)
        XCTAssertEqual(testSet[22].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[23].bodyImage, .body_Black)
        XCTAssertEqual(testSet[23].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[24].bodyImage, .body_Black)
        XCTAssertEqual(testSet[24].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[25].bodyImage, .body_Black)
        XCTAssertEqual(testSet[25].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[26].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[26].textImage, .text_TwentyYears)
    }

    /* ################################################################## */
    /**
     */
    func testJustUnderTwentyFiveYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1993, month: 4, day: 29),
                                             endDate: Self.makeDate(year: 2018, month: 4, day: 28)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 13)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[12].textImage, .text_TwentyYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Purple)
            XCTAssertEqual(testTag.textImage, .text_TwentyYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 31)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[22].bodyImage, .body_Black)
        XCTAssertEqual(testSet[22].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[23].bodyImage, .body_Black)
        XCTAssertEqual(testSet[23].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[24].bodyImage, .body_Black)
        XCTAssertEqual(testSet[24].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[25].bodyImage, .body_Black)
        XCTAssertEqual(testSet[25].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[26].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[26].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[27].bodyImage, .body_Black)
        XCTAssertEqual(testSet[27].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[28].bodyImage, .body_Black)
        XCTAssertEqual(testSet[28].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[29].bodyImage, .body_Black)
        XCTAssertEqual(testSet[29].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[30].bodyImage, .body_Black)
        XCTAssertEqual(testSet[30].textImage, .text_MultiYear)
    }

    /* ################################################################## */
    /**
     */
    func testTwentyFiveYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1993, month: 8, day: 22),
                                             endDate: Self.makeDate(year: 2018, month: 8, day: 22)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 14)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[12].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[13].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[13].textImage, .text_TwentyFiveYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_HotPink)
            XCTAssertEqual(testTag.textImage, .text_TwentyFiveYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 32)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[22].bodyImage, .body_Black)
        XCTAssertEqual(testSet[22].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[23].bodyImage, .body_Black)
        XCTAssertEqual(testSet[23].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[24].bodyImage, .body_Black)
        XCTAssertEqual(testSet[24].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[25].bodyImage, .body_Black)
        XCTAssertEqual(testSet[25].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[26].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[26].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[27].bodyImage, .body_Black)
        XCTAssertEqual(testSet[27].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[28].bodyImage, .body_Black)
        XCTAssertEqual(testSet[28].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[29].bodyImage, .body_Black)
        XCTAssertEqual(testSet[29].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[30].bodyImage, .body_Black)
        XCTAssertEqual(testSet[30].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[31].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[31].textImage, .text_TwentyFiveYears)
    }

    /* ################################################################## */
    /**
     */
    func test9999Days() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1990, month: 8, day: 17),
                                             endDate: Self.makeDate(year: 2018, month: 1, day: 1)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 14)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[12].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[13].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[13].textImage, .text_TwentyFiveYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_HotPink)
            XCTAssertEqual(testTag.textImage, .text_TwentyFiveYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 34)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[22].bodyImage, .body_Black)
        XCTAssertEqual(testSet[22].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[23].bodyImage, .body_Black)
        XCTAssertEqual(testSet[23].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[24].bodyImage, .body_Black)
        XCTAssertEqual(testSet[24].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[25].bodyImage, .body_Black)
        XCTAssertEqual(testSet[25].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[26].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[26].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[27].bodyImage, .body_Black)
        XCTAssertEqual(testSet[27].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[28].bodyImage, .body_Black)
        XCTAssertEqual(testSet[28].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[29].bodyImage, .body_Black)
        XCTAssertEqual(testSet[29].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[30].bodyImage, .body_Black)
        XCTAssertEqual(testSet[30].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[31].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[31].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[32].bodyImage, .body_Black)
        XCTAssertEqual(testSet[32].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[33].bodyImage, .body_Black)
        XCTAssertEqual(testSet[33].textImage, .text_MultiYear)
    }

    /* ################################################################## */
    /**
     */
    func testTenThousandDays() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1990, month: 8, day: 17),
                                             endDate: Self.makeDate(year: 2018, month: 1, day: 2)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 15)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[12].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[13].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[13].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[14].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[14].textImage, .text_TenThousandDays)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Purple)
            XCTAssertEqual(testTag.textImage, .text_TenThousandDays)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 35)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[22].bodyImage, .body_Black)
        XCTAssertEqual(testSet[22].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[23].bodyImage, .body_Black)
        XCTAssertEqual(testSet[23].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[24].bodyImage, .body_Black)
        XCTAssertEqual(testSet[24].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[25].bodyImage, .body_Black)
        XCTAssertEqual(testSet[25].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[26].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[26].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[27].bodyImage, .body_Black)
        XCTAssertEqual(testSet[27].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[28].bodyImage, .body_Black)
        XCTAssertEqual(testSet[28].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[29].bodyImage, .body_Black)
        XCTAssertEqual(testSet[29].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[30].bodyImage, .body_Black)
        XCTAssertEqual(testSet[30].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[31].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[31].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[32].bodyImage, .body_Black)
        XCTAssertEqual(testSet[32].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[33].bodyImage, .body_Black)
        XCTAssertEqual(testSet[33].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[34].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[34].textImage, .text_TenThousandDays)
    }

    /* ################################################################## */
    /**
     */
    func testJustUnderThirtyYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1990, month: 8, day: 17),
                                             endDate: Self.makeDate(year: 2020, month: 8, day: 16)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 15)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[12].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[13].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[13].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[14].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[14].textImage, .text_TenThousandDays)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Purple)
            XCTAssertEqual(testTag.textImage, .text_TenThousandDays)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 37)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[22].bodyImage, .body_Black)
        XCTAssertEqual(testSet[22].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[23].bodyImage, .body_Black)
        XCTAssertEqual(testSet[23].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[24].bodyImage, .body_Black)
        XCTAssertEqual(testSet[24].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[25].bodyImage, .body_Black)
        XCTAssertEqual(testSet[25].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[26].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[26].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[27].bodyImage, .body_Black)
        XCTAssertEqual(testSet[27].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[28].bodyImage, .body_Black)
        XCTAssertEqual(testSet[28].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[29].bodyImage, .body_Black)
        XCTAssertEqual(testSet[29].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[30].bodyImage, .body_Black)
        XCTAssertEqual(testSet[30].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[31].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[31].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[32].bodyImage, .body_Black)
        XCTAssertEqual(testSet[32].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[33].bodyImage, .body_Black)
        XCTAssertEqual(testSet[33].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[34].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[34].textImage, .text_TenThousandDays)
        XCTAssertEqual(testSet[35].bodyImage, .body_Black)
        XCTAssertEqual(testSet[35].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[36].bodyImage, .body_Black)
        XCTAssertEqual(testSet[36].textImage, .text_MultiYear)
    }

    /* ################################################################## */
    /**
     */
    func testThirtyYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1990, month: 8, day: 17),
                                             endDate: Self.makeDate(year: 2020, month: 8, day: 17)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 16)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[12].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[13].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[13].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[14].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[14].textImage, .text_TenThousandDays)
        XCTAssertEqual(testSet[15].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[15].textImage, .text_ThirtyYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Moonglow)
            XCTAssertEqual(testTag.textImage, .text_ThirtyYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 38)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[22].bodyImage, .body_Black)
        XCTAssertEqual(testSet[22].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[23].bodyImage, .body_Black)
        XCTAssertEqual(testSet[23].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[24].bodyImage, .body_Black)
        XCTAssertEqual(testSet[24].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[25].bodyImage, .body_Black)
        XCTAssertEqual(testSet[25].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[26].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[26].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[27].bodyImage, .body_Black)
        XCTAssertEqual(testSet[27].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[28].bodyImage, .body_Black)
        XCTAssertEqual(testSet[28].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[29].bodyImage, .body_Black)
        XCTAssertEqual(testSet[29].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[30].bodyImage, .body_Black)
        XCTAssertEqual(testSet[30].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[31].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[31].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[32].bodyImage, .body_Black)
        XCTAssertEqual(testSet[32].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[33].bodyImage, .body_Black)
        XCTAssertEqual(testSet[33].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[34].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[34].textImage, .text_TenThousandDays)
        XCTAssertEqual(testSet[35].bodyImage, .body_Black)
        XCTAssertEqual(testSet[35].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[36].bodyImage, .body_Black)
        XCTAssertEqual(testSet[36].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[37].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[37].textImage, .text_ThirtyYears)
    }

    /* ################################################################## */
    /**
     */
    func testJustUnderFortyYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1980, month: 8, day: 17),
                                             endDate: Self.makeDate(year: 2020, month: 8, day: 16)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 17)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[12].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[13].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[13].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[14].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[14].textImage, .text_TenThousandDays)
        XCTAssertEqual(testSet[15].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[15].textImage, .text_ThirtyYears)
        XCTAssertEqual(testSet[16].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[16].textImage, .text_ThirtyFiveYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_BurntOrange)
            XCTAssertEqual(testTag.textImage, .text_ThirtyFiveYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 47)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[22].bodyImage, .body_Black)
        XCTAssertEqual(testSet[22].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[23].bodyImage, .body_Black)
        XCTAssertEqual(testSet[23].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[24].bodyImage, .body_Black)
        XCTAssertEqual(testSet[24].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[25].bodyImage, .body_Black)
        XCTAssertEqual(testSet[25].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[26].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[26].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[27].bodyImage, .body_Black)
        XCTAssertEqual(testSet[27].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[28].bodyImage, .body_Black)
        XCTAssertEqual(testSet[28].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[29].bodyImage, .body_Black)
        XCTAssertEqual(testSet[29].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[30].bodyImage, .body_Black)
        XCTAssertEqual(testSet[30].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[31].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[31].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[32].bodyImage, .body_Black)
        XCTAssertEqual(testSet[32].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[33].bodyImage, .body_Black)
        XCTAssertEqual(testSet[33].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[34].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[34].textImage, .text_TenThousandDays)
        XCTAssertEqual(testSet[35].bodyImage, .body_Black)
        XCTAssertEqual(testSet[35].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[36].bodyImage, .body_Black)
        XCTAssertEqual(testSet[36].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[37].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[37].textImage, .text_ThirtyYears)
        XCTAssertEqual(testSet[38].bodyImage, .body_Black)
        XCTAssertEqual(testSet[38].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[39].bodyImage, .body_Black)
        XCTAssertEqual(testSet[39].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[40].bodyImage, .body_Black)
        XCTAssertEqual(testSet[40].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[41].bodyImage, .body_Black)
        XCTAssertEqual(testSet[41].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[42].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[42].textImage, .text_ThirtyFiveYears)
        XCTAssertEqual(testSet[43].bodyImage, .body_Black)
        XCTAssertEqual(testSet[43].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[44].bodyImage, .body_Black)
        XCTAssertEqual(testSet[44].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[45].bodyImage, .body_Black)
        XCTAssertEqual(testSet[45].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[46].bodyImage, .body_Black)
        XCTAssertEqual(testSet[46].textImage, .text_MultiYear)
    }

    /* ################################################################## */
    /**
     */
    func testFortyYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1980, month: 8, day: 17),
                                             endDate: Self.makeDate(year: 2020, month: 8, day: 17)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 18)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[12].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[13].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[13].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[14].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[14].textImage, .text_TenThousandDays)
        XCTAssertEqual(testSet[15].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[15].textImage, .text_ThirtyYears)
        XCTAssertEqual(testSet[16].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[16].textImage, .text_ThirtyFiveYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[17].textImage, .text_FortyYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Blue)
            XCTAssertEqual(testTag.textImage, .text_FortyYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 48)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[22].bodyImage, .body_Black)
        XCTAssertEqual(testSet[22].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[23].bodyImage, .body_Black)
        XCTAssertEqual(testSet[23].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[24].bodyImage, .body_Black)
        XCTAssertEqual(testSet[24].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[25].bodyImage, .body_Black)
        XCTAssertEqual(testSet[25].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[26].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[26].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[27].bodyImage, .body_Black)
        XCTAssertEqual(testSet[27].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[28].bodyImage, .body_Black)
        XCTAssertEqual(testSet[28].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[29].bodyImage, .body_Black)
        XCTAssertEqual(testSet[29].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[30].bodyImage, .body_Black)
        XCTAssertEqual(testSet[30].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[31].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[31].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[32].bodyImage, .body_Black)
        XCTAssertEqual(testSet[32].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[33].bodyImage, .body_Black)
        XCTAssertEqual(testSet[33].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[34].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[34].textImage, .text_TenThousandDays)
        XCTAssertEqual(testSet[35].bodyImage, .body_Black)
        XCTAssertEqual(testSet[35].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[36].bodyImage, .body_Black)
        XCTAssertEqual(testSet[36].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[37].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[37].textImage, .text_ThirtyYears)
        XCTAssertEqual(testSet[38].bodyImage, .body_Black)
        XCTAssertEqual(testSet[38].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[39].bodyImage, .body_Black)
        XCTAssertEqual(testSet[39].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[40].bodyImage, .body_Black)
        XCTAssertEqual(testSet[40].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[41].bodyImage, .body_Black)
        XCTAssertEqual(testSet[41].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[42].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[42].textImage, .text_ThirtyFiveYears)
        XCTAssertEqual(testSet[43].bodyImage, .body_Black)
        XCTAssertEqual(testSet[43].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[44].bodyImage, .body_Black)
        XCTAssertEqual(testSet[44].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[45].bodyImage, .body_Black)
        XCTAssertEqual(testSet[45].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[46].bodyImage, .body_Black)
        XCTAssertEqual(testSet[46].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[47].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[47].textImage, .text_FortyYears)
    }

    /* ################################################################## */
    /**
     */
    func testFortyFiveYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1975, month: 8, day: 17),
                                             endDate: Self.makeDate(year: 2020, month: 8, day: 17)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 19)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[12].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[13].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[13].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[14].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[14].textImage, .text_TenThousandDays)
        XCTAssertEqual(testSet[15].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[15].textImage, .text_ThirtyYears)
        XCTAssertEqual(testSet[16].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[16].textImage, .text_ThirtyFiveYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[17].textImage, .text_FortyYears)
        XCTAssertEqual(testSet[18].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[18].textImage, .text_FortyFiveYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Yellow)
            XCTAssertEqual(testTag.textImage, .text_FortyFiveYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 53)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[22].bodyImage, .body_Black)
        XCTAssertEqual(testSet[22].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[23].bodyImage, .body_Black)
        XCTAssertEqual(testSet[23].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[24].bodyImage, .body_Black)
        XCTAssertEqual(testSet[24].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[25].bodyImage, .body_Black)
        XCTAssertEqual(testSet[25].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[26].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[26].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[27].bodyImage, .body_Black)
        XCTAssertEqual(testSet[27].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[28].bodyImage, .body_Black)
        XCTAssertEqual(testSet[28].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[29].bodyImage, .body_Black)
        XCTAssertEqual(testSet[29].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[30].bodyImage, .body_Black)
        XCTAssertEqual(testSet[30].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[31].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[31].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[32].bodyImage, .body_Black)
        XCTAssertEqual(testSet[32].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[33].bodyImage, .body_Black)
        XCTAssertEqual(testSet[33].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[34].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[34].textImage, .text_TenThousandDays)
        XCTAssertEqual(testSet[35].bodyImage, .body_Black)
        XCTAssertEqual(testSet[35].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[36].bodyImage, .body_Black)
        XCTAssertEqual(testSet[36].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[37].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[37].textImage, .text_ThirtyYears)
        XCTAssertEqual(testSet[38].bodyImage, .body_Black)
        XCTAssertEqual(testSet[38].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[39].bodyImage, .body_Black)
        XCTAssertEqual(testSet[39].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[40].bodyImage, .body_Black)
        XCTAssertEqual(testSet[40].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[41].bodyImage, .body_Black)
        XCTAssertEqual(testSet[41].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[42].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[42].textImage, .text_ThirtyFiveYears)
        XCTAssertEqual(testSet[43].bodyImage, .body_Black)
        XCTAssertEqual(testSet[43].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[44].bodyImage, .body_Black)
        XCTAssertEqual(testSet[44].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[45].bodyImage, .body_Black)
        XCTAssertEqual(testSet[45].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[46].bodyImage, .body_Black)
        XCTAssertEqual(testSet[46].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[47].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[47].textImage, .text_FortyYears)
        XCTAssertEqual(testSet[48].bodyImage, .body_Black)
        XCTAssertEqual(testSet[48].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[49].bodyImage, .body_Black)
        XCTAssertEqual(testSet[49].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[50].bodyImage, .body_Black)
        XCTAssertEqual(testSet[50].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[51].bodyImage, .body_Black)
        XCTAssertEqual(testSet[51].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[52].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[52].textImage, .text_FortyFiveYears)
    }

    /* ################################################################## */
    /**
     */
    func testJustUnderFiftyYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1970, month: 8, day: 17),
                                             endDate: Self.makeDate(year: 2020, month: 8, day: 16)).cleanTime

        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 19)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[12].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[13].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[13].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[14].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[14].textImage, .text_TenThousandDays)
        XCTAssertEqual(testSet[15].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[15].textImage, .text_ThirtyYears)
        XCTAssertEqual(testSet[16].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[16].textImage, .text_ThirtyFiveYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[17].textImage, .text_FortyYears)
        XCTAssertEqual(testSet[18].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[18].textImage, .text_FortyFiveYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Yellow)
            XCTAssertEqual(testTag.textImage, .text_FortyFiveYears)
        } else {
            XCTFail("No Keytag!")
        }

        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 57)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[22].bodyImage, .body_Black)
        XCTAssertEqual(testSet[22].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[23].bodyImage, .body_Black)
        XCTAssertEqual(testSet[23].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[24].bodyImage, .body_Black)
        XCTAssertEqual(testSet[24].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[25].bodyImage, .body_Black)
        XCTAssertEqual(testSet[25].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[26].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[26].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[27].bodyImage, .body_Black)
        XCTAssertEqual(testSet[27].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[28].bodyImage, .body_Black)
        XCTAssertEqual(testSet[28].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[29].bodyImage, .body_Black)
        XCTAssertEqual(testSet[29].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[30].bodyImage, .body_Black)
        XCTAssertEqual(testSet[30].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[31].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[31].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[32].bodyImage, .body_Black)
        XCTAssertEqual(testSet[32].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[33].bodyImage, .body_Black)
        XCTAssertEqual(testSet[33].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[34].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[34].textImage, .text_TenThousandDays)
        XCTAssertEqual(testSet[35].bodyImage, .body_Black)
        XCTAssertEqual(testSet[35].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[36].bodyImage, .body_Black)
        XCTAssertEqual(testSet[36].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[37].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[37].textImage, .text_ThirtyYears)
        XCTAssertEqual(testSet[38].bodyImage, .body_Black)
        XCTAssertEqual(testSet[38].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[39].bodyImage, .body_Black)
        XCTAssertEqual(testSet[39].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[40].bodyImage, .body_Black)
        XCTAssertEqual(testSet[40].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[41].bodyImage, .body_Black)
        XCTAssertEqual(testSet[41].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[42].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[42].textImage, .text_ThirtyFiveYears)
        XCTAssertEqual(testSet[43].bodyImage, .body_Black)
        XCTAssertEqual(testSet[43].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[44].bodyImage, .body_Black)
        XCTAssertEqual(testSet[44].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[45].bodyImage, .body_Black)
        XCTAssertEqual(testSet[45].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[46].bodyImage, .body_Black)
        XCTAssertEqual(testSet[46].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[47].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[47].textImage, .text_FortyYears)
        XCTAssertEqual(testSet[48].bodyImage, .body_Black)
        XCTAssertEqual(testSet[48].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[49].bodyImage, .body_Black)
        XCTAssertEqual(testSet[49].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[50].bodyImage, .body_Black)
        XCTAssertEqual(testSet[50].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[51].bodyImage, .body_Black)
        XCTAssertEqual(testSet[51].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[52].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[52].textImage, .text_FortyFiveYears)
        XCTAssertEqual(testSet[53].bodyImage, .body_Black)
        XCTAssertEqual(testSet[53].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[54].bodyImage, .body_Black)
        XCTAssertEqual(testSet[54].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[55].bodyImage, .body_Black)
        XCTAssertEqual(testSet[55].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[56].bodyImage, .body_Black)
        XCTAssertEqual(testSet[56].textImage, .text_MultiYear)
    }
    
    /* ################################################################## */
    /**
     */
    func testFiftyYears() {
        let testCalc = LGV_CleantimeDateCalc(startDate: Self.makeDate(year: 1970, month: 8, day: 16),
                                             endDate: Self.makeDate(year: 2020, month: 8, day: 16)).cleanTime
        
        var testSet = LGV_CleantimeKeytagDescription.getAShortStackOfTags(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 20)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[9].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[10].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[10].textImage, .text_TenYears)
        XCTAssertEqual(testSet[11].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[11].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[12].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[13].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[13].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[14].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[14].textImage, .text_TenThousandDays)
        XCTAssertEqual(testSet[15].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[15].textImage, .text_ThirtyYears)
        XCTAssertEqual(testSet[16].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[16].textImage, .text_ThirtyFiveYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[17].textImage, .text_FortyYears)
        XCTAssertEqual(testSet[18].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[18].textImage, .text_FortyFiveYears)
        XCTAssertEqual(testSet[19].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[19].textImage, .text_FiftyYears)

        if let testTag = LGV_CleantimeKeytagDescription.getLastTagThatApplies(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths) {
            XCTAssertEqual(testTag.bodyImage, .body_Gray)
            XCTAssertEqual(testTag.textImage, .text_FiftyYears)
        } else {
            XCTFail("No Keytag!")
        }
        
        testSet = LGV_CleantimeKeytagDescription.getTheFullMonty(totalDays: testCalc.totalDays, totalMonths: testCalc.totalMonths)
        
        XCTAssertEqual(testSet.count, 58)
        XCTAssertEqual(testSet[0].bodyImage, .body_White)
        XCTAssertEqual(testSet[0].textImage, .text_OneDay)
        XCTAssertEqual(testSet[1].bodyImage, .body_DaygloOrange)
        XCTAssertEqual(testSet[1].textImage, .text_ThirtyDays)
        XCTAssertEqual(testSet[2].bodyImage, .body_DaygloGreen)
        XCTAssertEqual(testSet[2].textImage, .text_SixtyDays)
        XCTAssertEqual(testSet[3].bodyImage, .body_Red)
        XCTAssertEqual(testSet[3].textImage, .text_NinetyDays)
        XCTAssertEqual(testSet[4].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[4].textImage, .text_SixMonths)
        XCTAssertEqual(testSet[5].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[5].textImage, .text_NineMonths)
        XCTAssertEqual(testSet[6].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[6].textImage, .text_OneYear)
        XCTAssertEqual(testSet[7].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[7].textImage, .text_EighteenMonths)
        XCTAssertEqual(testSet[8].bodyImage, .body_Black)
        XCTAssertEqual(testSet[8].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[9].bodyImage, .body_Black)
        XCTAssertEqual(testSet[9].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[10].bodyImage, .body_Black)
        XCTAssertEqual(testSet[10].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[11].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[11].textImage, .text_FiveYears)
        XCTAssertEqual(testSet[12].bodyImage, .body_Black)
        XCTAssertEqual(testSet[12].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[13].bodyImage, .body_Black)
        XCTAssertEqual(testSet[13].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[14].bodyImage, .body_Black)
        XCTAssertEqual(testSet[14].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[15].bodyImage, .body_Black)
        XCTAssertEqual(testSet[15].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[16].bodyImage, .body_Speckled)
        XCTAssertEqual(testSet[16].textImage, .text_TenYears)
        XCTAssertEqual(testSet[17].bodyImage, .body_Black)
        XCTAssertEqual(testSet[17].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[18].bodyImage, .body_Black)
        XCTAssertEqual(testSet[18].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[19].bodyImage, .body_Black)
        XCTAssertEqual(testSet[19].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[20].bodyImage, .body_Black)
        XCTAssertEqual(testSet[20].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[21].bodyImage, .body_HunterGreen)
        XCTAssertEqual(testSet[21].textImage, .text_FifteenYears)
        XCTAssertEqual(testSet[22].bodyImage, .body_Black)
        XCTAssertEqual(testSet[22].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[23].bodyImage, .body_Black)
        XCTAssertEqual(testSet[23].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[24].bodyImage, .body_Black)
        XCTAssertEqual(testSet[24].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[25].bodyImage, .body_Black)
        XCTAssertEqual(testSet[25].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[26].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[26].textImage, .text_TwentyYears)
        XCTAssertEqual(testSet[27].bodyImage, .body_Black)
        XCTAssertEqual(testSet[27].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[28].bodyImage, .body_Black)
        XCTAssertEqual(testSet[28].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[29].bodyImage, .body_Black)
        XCTAssertEqual(testSet[29].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[30].bodyImage, .body_Black)
        XCTAssertEqual(testSet[30].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[31].bodyImage, .body_HotPink)
        XCTAssertEqual(testSet[31].textImage, .text_TwentyFiveYears)
        XCTAssertEqual(testSet[32].bodyImage, .body_Black)
        XCTAssertEqual(testSet[32].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[33].bodyImage, .body_Black)
        XCTAssertEqual(testSet[33].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[34].bodyImage, .body_Purple)
        XCTAssertEqual(testSet[34].textImage, .text_TenThousandDays)
        XCTAssertEqual(testSet[35].bodyImage, .body_Black)
        XCTAssertEqual(testSet[35].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[36].bodyImage, .body_Black)
        XCTAssertEqual(testSet[36].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[37].bodyImage, .body_Moonglow)
        XCTAssertEqual(testSet[37].textImage, .text_ThirtyYears)
        XCTAssertEqual(testSet[38].bodyImage, .body_Black)
        XCTAssertEqual(testSet[38].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[39].bodyImage, .body_Black)
        XCTAssertEqual(testSet[39].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[40].bodyImage, .body_Black)
        XCTAssertEqual(testSet[40].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[41].bodyImage, .body_Black)
        XCTAssertEqual(testSet[41].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[42].bodyImage, .body_BurntOrange)
        XCTAssertEqual(testSet[42].textImage, .text_ThirtyFiveYears)
        XCTAssertEqual(testSet[43].bodyImage, .body_Black)
        XCTAssertEqual(testSet[43].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[44].bodyImage, .body_Black)
        XCTAssertEqual(testSet[44].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[45].bodyImage, .body_Black)
        XCTAssertEqual(testSet[45].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[46].bodyImage, .body_Black)
        XCTAssertEqual(testSet[46].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[47].bodyImage, .body_Blue)
        XCTAssertEqual(testSet[47].textImage, .text_FortyYears)
        XCTAssertEqual(testSet[48].bodyImage, .body_Black)
        XCTAssertEqual(testSet[48].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[49].bodyImage, .body_Black)
        XCTAssertEqual(testSet[49].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[50].bodyImage, .body_Black)
        XCTAssertEqual(testSet[50].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[51].bodyImage, .body_Black)
        XCTAssertEqual(testSet[51].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[52].bodyImage, .body_Yellow)
        XCTAssertEqual(testSet[52].textImage, .text_FortyFiveYears)
        XCTAssertEqual(testSet[53].bodyImage, .body_Black)
        XCTAssertEqual(testSet[53].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[54].bodyImage, .body_Black)
        XCTAssertEqual(testSet[54].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[55].bodyImage, .body_Black)
        XCTAssertEqual(testSet[55].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[56].bodyImage, .body_Black)
        XCTAssertEqual(testSet[56].textImage, .text_MultiYear)
        XCTAssertEqual(testSet[57].bodyImage, .body_Gray)
        XCTAssertEqual(testSet[57].textImage, .text_FiftyYears)
    }
}
