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

/* ###################################################################################################################################### */
// MARK: - Cleantime Keytag Description Struct -
/* ###################################################################################################################################### */
/**
 This will generate a list of String-based enums, that will allow the caller to construct a "keytag chain," with the number of keytags that would be awarded for the given cleandate.
 
 This works in a "layered" fashion, with the "body" as the bottom layer,  and "text" over the body.
 
 This struct is really only a namespace for a functional and static enum implementation.
 */
public struct LGV_CleantimeKeytagDescription {
    /* ################################################################################################################################## */
    // MARK: Private Cyclomatic Complexity Overflow Handler Static Functions.
    /* ################################################################################################################################## */
    /* ############################################################## */
    /**
     Part 2 of the "full chain" generator.
     
     - parameter inCurrent: The current chain.
     - parameter totalDays: The total day count. It is mutually exclusive with totalMonths. It's like Highlander: There can only be one...
     - parameter totalMonths: The total number of months (including years). It is mutually exclusive with totalDays.
     - returns: An Array of the tag descriptions that apply, up to the date; including interim black tags.
     */
    private static func _getTheFullMonty2(_ inCurrent: [LGV_CleantimeKeytagDescription], totalDays inTotalDays: Int, totalMonths inTotalMonths: Int) -> [LGV_CleantimeKeytagDescription] {
        var ret: [LGV_CleantimeKeytagDescription] = inCurrent
        let totalYears = inTotalMonths / 12
        
        ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 120, bodyImage: .body_Speckled, textImage: .text_TenYears))
        
        guard 10 < totalYears else { return ret }

        for _ in 11...min(totalYears, 14) {
            ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 24, bodyImage: .body_Black, textImage: .text_MultiYear))
        }
        
        if 15 <= totalYears {
            ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 180, bodyImage: .body_HunterGreen, textImage: .text_FifteenYears))
        }
        
        guard 15 < totalYears else { return ret }

        for _ in 16...min(totalYears, 19) {
            ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 24, bodyImage: .body_Black, textImage: .text_MultiYear))
        }
        
        if 20 <= totalYears {
            ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 240, bodyImage: .body_Purple, textImage: .text_TwentyYears))
        }
        
        guard 20 < totalYears else { return ret }

        for _ in 21...min(totalYears, 24) {
            ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 24, bodyImage: .body_Black, textImage: .text_MultiYear))
        }
        
        if 25 <= totalYears {
            ret = _getTheFullMonty3(ret, totalDays: inTotalDays, totalMonths: inTotalMonths)
        }

        return ret
    }
    
    /* ############################################################## */
    /**
     Part 3 of the "full chain" generator.
     
     - parameter inCurrent: The current chain.
     - parameter totalDays: The total day count. It is mutually exclusive with totalMonths. It's like Highlander: There can only be one...
     - parameter totalMonths: The total number of months (including years). It is mutually exclusive with totalDays.
     - returns: An Array of the tag descriptions that apply, up to the date; including interim black tags.
     */
    private static func _getTheFullMonty3(_ inCurrent: [LGV_CleantimeKeytagDescription], totalDays inTotalDays: Int, totalMonths inTotalMonths: Int) -> [LGV_CleantimeKeytagDescription] {
        var ret: [LGV_CleantimeKeytagDescription] = inCurrent
        let totalYears = inTotalMonths / 12
        
        ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 300, bodyImage: .body_HotPink, textImage: .text_TwentyFiveYears))
    
        guard 25 < totalYears else { return ret }

        for _ in 26...min(totalYears, 27) {
            ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 24, bodyImage: .body_Black, textImage: .text_MultiYear))
        }
        
        if 10000 <= inTotalDays {
            ret.append(LGV_CleantimeKeytagDescription(totalDays: 10000, totalMonths: 0, bodyImage: .body_Purple, textImage: .text_TenThousandDays))
        }
        
        guard 27 < totalYears else { return ret }
        
        for _ in 28...min(totalYears, 29) {
            ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 24, bodyImage: .body_Black, textImage: .text_MultiYear))
        }
        
        if 30 <= totalYears {
            ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 360, bodyImage: .body_Moonglow, textImage: .text_ThirtyYears))
        }
        
        guard 30 < totalYears else { return ret }
        
        for _ in 31...min(totalYears, 39) {
            ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 24, bodyImage: .body_Black, textImage: .text_MultiYear))
        }
        
        if 40 <= totalYears {
            ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 480, bodyImage: .body_Blue, textImage: .text_FortyYears))
        }
        
        guard 40 < totalYears else { return ret }
        
        for _ in 41...totalYears {
            ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 24, bodyImage: .body_Black, textImage: .text_MultiYear))
        }

        return ret
    }

    /* ################################################################################################################################## */
    // MARK: - Cleantime Keytag Body Resource Name Enum -
    /* ################################################################################################################################## */
    /**
     This enum has the names for all of the various keytag body visual resources.
     
     You can use these, in conjunction with customized (and/or localized) visual assets.
     */
    public enum KeytagResourceNamesBody: String, CaseIterable {
        /* ########################################################## */
        /**
         This means nobody's home.
         */
        case none = ""

        /* ########################################################## */
        /**
         The black tag
         */
        case body_Black

        /* ########################################################## */
        /**
         The dark blue tag
         */
        case body_Blue

        /* ########################################################## */
        /**
         The burnt orange tag
         */
        case body_BurntOrange

        /* ########################################################## */
        /**
         The dayglo green tag
         */
        case body_DaygloGreen

        /* ########################################################## */
        /**
         The dayglo orange tag
         */
        case body_DaygloOrange

        /* ########################################################## */
        /**
         The gray tag
         */
        case body_Gray

        /* ########################################################## */
        /**
         The hot pink tag
         */
        case body_HotPink

        /* ########################################################## */
        /**
         The hunter green tag
         */
        case body_HunterGreen

        /* ########################################################## */
        /**
         The moonglow (glow in the dark) tag
         */
        case body_Moonglow

        /* ########################################################## */
        /**
         The purple tag
         */
        case body_Purple

        /* ########################################################## */
        /**
         The dark red tag
         */
        case body_Red

        /* ########################################################## */
        /**
         The "speckled" white tag
         */
        case body_Speckled

        /* ########################################################## */
        /**
         The pure white tag
         */
        case body_White

        /* ########################################################## */
        /**
         The bright yellow tag
         */
        case body_Yellow
    }

    /* ################################################################################################################################## */
    // MARK: - Cleantime Keytag Text Resource Name Enum -
    /* ################################################################################################################################## */
    /**
     This enum has the names for all of the various keytag text visual resources.
     */
    public enum KeytagResourceNamesText: String, CaseIterable {
        /* ########################################################## */
        /**
         No text
         */
        case none = ""

        /* ########################################################## */
        /**
         The welcome back (relapse return) text
         */
        case text_WelcomeBack

        /* ########################################################## */
        /**
         One day
         */
        case text_OneDay

        /* ########################################################## */
        /**
         Thirty days
         */
        case text_ThirtyDays

        /* ########################################################## */
        /**
         Sixty days
         */
        case text_SixtyDays

        /* ########################################################## */
        /**
         Ninety days
         */
        case text_NinetyDays

        /* ########################################################## */
        /**
         Six months
         */
        case text_SixMonths

        /* ########################################################## */
        /**
         Nine months
         */
        case text_NineMonths

        /* ########################################################## */
        /**
         One year
         */
        case text_OneYear

        /* ########################################################## */
        /**
         Eighteen months
         */
        case text_EighteenMonths

        /* ########################################################## */
        /**
         Two or more years
         */
        case text_MultiYear

        /* ########################################################## */
        /**
         Five years
         */
        case text_FiveYears

        /* ########################################################## */
        /**
         One decade (ten years)
         */
        case text_TenYears

        /* ########################################################## */
        /**
         Fifteen years
         */
        case text_FifteenYears

        /* ########################################################## */
        /**
         Decades (Twenty) years
         */
        case text_TwentyYears

        /* ########################################################## */
        /**
         Twenty-five years
         */
        case text_TwentyFiveYears

        /* ########################################################## */
        /**
         Twenty-seven point four (27.4) years, or ten thousand (10,000) days
         */
        case text_TenThousandDays

        /* ########################################################## */
        /**
         Thirt years
         */
        case text_ThirtyYears

        /* ########################################################## */
        /**
         Forty years
         */
        case text_FortyYears
    }
    
    /* ################################################################################################################################## */
    // MARK: Public Static Constant Properties
    /* ################################################################################################################################## */
    /* ############################################################## */
    /**
     This is a preset collection of all the keytags.
     */
    public static let keytags: [LGV_CleantimeKeytagDescription] = [LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 0, bodyImage: .body_HotPink, textImage: .text_WelcomeBack),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 1, totalMonths: 0, bodyImage: .body_White, textImage: .text_OneDay),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 30, totalMonths: 0, bodyImage: .body_DaygloOrange, textImage: .text_ThirtyDays),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 60, totalMonths: 0, bodyImage: .body_DaygloGreen, textImage: .text_SixtyDays),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 90, totalMonths: 0, bodyImage: .body_Red, textImage: .text_NinetyDays),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 6, bodyImage: .body_Blue, textImage: .text_SixMonths),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 9, bodyImage: .body_Yellow, textImage: .text_NineMonths),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 12, bodyImage: .body_Moonglow, textImage: .text_OneYear),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 18, bodyImage: .body_Gray, textImage: .text_EighteenMonths),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 24, bodyImage: .body_Black, textImage: .text_MultiYear),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 60, bodyImage: .body_BurntOrange, textImage: .text_FiveYears),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 120, bodyImage: .body_Speckled, textImage: .text_TenYears),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 180, bodyImage: .body_HunterGreen, textImage: .text_FifteenYears),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 240, bodyImage: .body_Purple, textImage: .text_TwentyYears),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 300, bodyImage: .body_HotPink, textImage: .text_TwentyFiveYears),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 10000, totalMonths: 0, bodyImage: .body_Purple, textImage: .text_TenThousandDays),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 360, bodyImage: .body_Moonglow, textImage: .text_ThirtyYears),
                                                                   LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 480, bodyImage: .body_Blue, textImage: .text_FortyYears)
                                                                  ]
    
    /* ################################################################################################################################## */
    // MARK: Public Static Functions
    /* ################################################################################################################################## */
    /* ############################################################## */
    /**
     This returns the descriptions of all the tags that apply to the cleantime passed in.
     This is a "short" stack, meaning that only the highest awarded tag is used at various multi-year thresholds.
     
     - parameter totalDays: The total day count. It is mutually exclusive with totalMonths. It's like Highlander: There can only be one...
     - parameter totalMonths: The total number of months (including years). It is mutually exclusive with totalDays.
     - returns: An Array of the tag descriptions that apply, up to the date.
     */
    public static func getAShortStackOfTags(totalDays inTotalDays: Int = 0, totalMonths inTotalMonths: Int = 0) -> [LGV_CleantimeKeytagDescription] { keytags.filter { $0.doesThisTagApply(totalDays: inTotalDays, totalMonths: inTotalMonths) } }
    
    /* ############################################################## */
    /**
     This returns the descriptions of all the tags that apply to the cleantime passed in, but with multiple black (multiYear) tags between multi-year thresholds.
     It will only make a difference after two years.
     
     - parameter totalDays: The total day count. It is mutually exclusive with totalMonths. It's like Highlander: There can only be one...
     - parameter totalMonths: The total number of months (including years). It is mutually exclusive with totalDays.
     - returns: An Array of the tag descriptions that apply, up to the date; including interim black tags.
     */
    public static func getTheFullMonty(totalDays inTotalDays: Int = 0, totalMonths inTotalMonths: Int = 0) -> [LGV_CleantimeKeytagDescription] {
        let totalYears = inTotalMonths / 12
        
        if 2 < totalYears {
            var ret: [LGV_CleantimeKeytagDescription] = getAShortStackOfTags(totalDays: 720, totalMonths: 24)
            
            guard 2 < totalYears else { return ret }

            for _ in 3...min(totalYears, 4) {
                ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 24, bodyImage: .body_Black, textImage: .text_MultiYear))
            }
            
            if 5 <= totalYears {
                ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 60, bodyImage: .body_BurntOrange, textImage: .text_FiveYears))
            }
            
            guard 5 < totalYears else { return ret }
            
            for _ in 6...min(totalYears, 9) {
                ret.append(LGV_CleantimeKeytagDescription(totalDays: 0, totalMonths: 24, bodyImage: .body_Black, textImage: .text_MultiYear))
            }
            
            if 10 <= totalYears {
                ret = _getTheFullMonty2(ret, totalDays: inTotalDays, totalMonths: inTotalMonths)
            }
            
            return ret
        }
        
        return getAShortStackOfTags(totalDays: inTotalDays, totalMonths: inTotalMonths)
    }
    
    /* ############################################################## */
    /**
     This returns the description of the highest tag that applies to the cleantime passed in.
     
     - parameter totalDays: The total day count. It is mutually exclusive with totalMonths. It's like Highlander: There can only be one...
     - parameter totalMonths: The total number of months (including years). It is mutually exclusive with totalDays.
     - returns: An Array of the tag descriptions that apply, up to the date. May be nil, if no tags apply.
     */
    public static func getLastTagThatApplies(totalDays inTotalDays: Int = 0, totalMonths inTotalMonths: Int = 0) -> LGV_CleantimeKeytagDescription? { getAShortStackOfTags(totalDays: inTotalDays, totalMonths: inTotalMonths).last }

    /* ################################################################################################################################## */
    // MARK: Public Instance Constant Properties
    /* ################################################################################################################################## */
    /* ############################################################## */
    /**
     If the tag measures only days, then this will contain the number of days required to implement this tag.
     It is mutually exclusive with totalMonths. It's like Highlander: There can only be one...
     If zero, then it will not be considered.
     */
    public let totalDays: Int
    
    /* ############################################################## */
    /**
     If the tag measures only months (including years), then this will contain the number of months required to implement this tag.
     It is mutually exclusive with totalDays.
     If zero, then it will not be considered.
     */
    public let totalMonths: Int
    
    /* ############################################################## */
    /**
     This is the resource name for the tag body image for this tag.
     */
    public let bodyImage: KeytagResourceNamesBody

    /* ############################################################## */
    /**
     This is the resource name for the text for this tag.
     */
    public let textImage: KeytagResourceNamesText
    
    /* ################################################################################################################################## */
    // MARK: Public Instance Methods
    /* ################################################################################################################################## */
    /* ############################################################## */
    /**
     This lets us know if this tag applies to the cleantime passed in.
     - parameter totalDays: The total day count. It is mutually exclusive with totalMonths. It's like Highlander: There can only be one...
     - parameter totalMonths: The total number of months (including years). It is mutually exclusive with totalDays.
     - returns: True, if the tag applies (is for the exact time, or for less time).
     */
    public func doesThisTagApply(totalDays inTotalDays: Int = 0, totalMonths inTotalMonths: Int = 0) -> Bool {
        ((totalDays == inTotalDays) && (totalMonths == inTotalMonths))
        || (0 < totalDays && totalDays <= inTotalDays)
        || (0 < totalMonths && totalMonths <= inTotalMonths)
    }
}
