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
 This is the container struct for the specialized cleantime keytag descriptions.
 */
public struct LGV_CleantimeKeytagDescription {
    // MARK: Private CC Overflow Handlers.
    
    /* ############################################################## */
    /**
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
    // MARK: - Cleantime Keytag Body Resource Names -
    /* ################################################################################################################################## */
    /**
     This enum has the names for all of the various keytag body visual resources.
     */
    public enum KeytagResourceNamesBody: String {
        /* ########################################################## */
        /**
         */
        case none = ""

        /* ########################################################## */
        /**
         */
        case body_Black

        /* ########################################################## */
        /**
         */
        case body_Blue

        /* ########################################################## */
        /**
         */
        case body_BurntOrange

        /* ########################################################## */
        /**
         */
        case body_DaygloGreen

        /* ########################################################## */
        /**
         */
        case body_DaygloOrange

        /* ########################################################## */
        /**
         */
        case body_Gray

        /* ########################################################## */
        /**
         */
        case body_HotPink

        /* ########################################################## */
        /**
         */
        case body_HunterGreen

        /* ########################################################## */
        /**
         */
        case body_Moonglow

        /* ########################################################## */
        /**
         */
        case body_Purple

        /* ########################################################## */
        /**
         */
        case body_Red

        /* ########################################################## */
        /**
         */
        case body_Speckled

        /* ########################################################## */
        /**
         */
        case body_White

        /* ########################################################## */
        /**
         */
        case body_Yellow
    }

    /* ################################################################################################################################## */
    // MARK: - Cleantime Keytag Ring Resource Names -
    /* ################################################################################################################################## */
    /**
     This enum has the names for all of the various keytag ring visual resources.
     */
    public enum KeytagResourceNamesRing: String {
        /* ########################################################## */
        /**
         */
        case none = ""

        /* ########################################################## */
        /**
         */
        case ring_Closed

        /* ########################################################## */
        /**
         */
        case ring_Open
    }

    /* ################################################################################################################################## */
    // MARK: - Cleantime Keytag Text Resource Names -
    /* ################################################################################################################################## */
    /**
     This enum has the names for all of the various keytag text visual resources.
     */
    public enum KeytagResourceNamesText: String {
        // MARK: Text Names
        /* ########################################################## */
        /**
         */
        case none = ""

        /* ########################################################## */
        /**
         */
        case text_WelcomeBack

        /* ########################################################## */
        /**
         */
        case text_OneDay

        /* ########################################################## */
        /**
         */
        case text_ThirtyDays

        /* ########################################################## */
        /**
         */
        case text_SixtyDays

        /* ########################################################## */
        /**
         */
        case text_NinetyDays

        /* ########################################################## */
        /**
         */
        case text_SixMonths

        /* ########################################################## */
        /**
         */
        case text_NineMonths

        /* ########################################################## */
        /**
         */
        case text_OneYear

        /* ########################################################## */
        /**
         */
        case text_EighteenMonths

        /* ########################################################## */
        /**
         */
        case text_MultiYear

        /* ########################################################## */
        /**
         */
        case text_FiveYears

        /* ########################################################## */
        /**
         */
        case text_TenYears

        /* ########################################################## */
        /**
         */
        case text_FifteenYears

        /* ########################################################## */
        /**
         */
        case text_TwentyYears

        /* ########################################################## */
        /**
         */
        case text_TwentyFiveYears

        /* ########################################################## */
        /**
         */
        case text_TenThousandDays

        /* ########################################################## */
        /**
         */
        case text_ThirtyYears

        /* ########################################################## */
        /**
         */
        case text_FortyYears
    }
    
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
    
    /* ############################################################## */
    /**
     This returns the descriptions of all the tags that apply to the cleantime passed in.
     - parameter totalDays: The total day count. It is mutually exclusive with totalMonths. It's like Highlander: There can only be one...
     - parameter totalMonths: The total number of months (including years). It is mutually exclusive with totalDays.
     - returns: An Array of the tag descriptions that apply, up to the date.
     */
    public static func getAShortStackOfTags(totalDays inTotalDays: Int = 0, totalMonths inTotalMonths: Int = 0) -> [LGV_CleantimeKeytagDescription] { keytags.filter { $0.doesThisTagApply(totalDays: inTotalDays, totalMonths: inTotalMonths) } }
    
    /* ############################################################## */
    /**
     This returns the descriptions of all the tags that apply to the cleantime passed in, but with multiple black (multiYear) tags.
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
        } else {
            return getAShortStackOfTags(totalDays: inTotalDays, totalMonths: inTotalMonths)
        }
    }
    
    /* ############################################################## */
    /**
     This returns the description of just the last tag that applies to the cleantime passed in.
     - parameter totalDays: The total day count. It is mutually exclusive with totalMonths. It's like Highlander: There can only be one...
     - parameter totalMonths: The total number of months (including years). It is mutually exclusive with totalDays.
     - returns: An Array of the tag descriptions that apply, up to the date. May be nil, if no tags apply.
     */
    public static func getLastTagThatApplies(totalDays inTotalDays: Int = 0, totalMonths inTotalMonths: Int = 0) -> LGV_CleantimeKeytagDescription? { getAShortStackOfTags(totalDays: inTotalDays, totalMonths: inTotalMonths).last }

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
