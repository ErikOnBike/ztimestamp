"
I am ZTimezoneTests, a test suite for ZTimezone.
"
Class {
	#name : #ZTimezoneTests,
	#superclass : #TestCase,
	#category : #ZTimestamp
}

{ #category : #testing }
ZTimezoneTests >> assertIsTimezoneEuropeBrussels: timezone [
	| winter summer |
	winter := ZTimestamp year: 2014 month: 01 day: 02.
	self assert: (timezone offsetForTimestamp: winter) equals: 1 hour.
	self assert: (timezone subzoneForTimestamp: winter) abbreviation equals: #CET.
	self deny: (timezone subzoneForTimestamp: winter) isDaylightSaving.
	summer := ZTimestamp year: 2014 month: 08 day: 02.
	self assert: (timezone offsetForTimestamp: summer) equals: 2 hours.
	self assert: (timezone subzoneForTimestamp: summer) abbreviation equals: #CEST.
	self assert: (timezone subzoneForTimestamp: summer) isDaylightSaving
]

{ #category : #private }
ZTimezoneTests >> checkZoneInfoLocation [
	[ ZTimezone zoneInfoLocation ] on: Error do: [ self skip ]
]

{ #category : #acccessing }
ZTimezoneTests >> europeBrusselsContents [
	"'/usr/share/zoneinfo/Europe/Brussels' asFileReference binaryReadStreamDo: [ :in | in upToEnd ]."
	
	^ #[84 90 105 102 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 0 0 0 10 0 0 0 0 0 0 0 185 0 0 0 10 0 0 0 18 152 68 73 128 155 12 37 112 155 213 218 240 156 217 174 144 157 164 181 144 158 185 144 144 159 132 151 144 159 206 248 48 160 96 165 240 161 126 187 112 162 46 18 240 163 122 76 240 164 53 129 240 165 94 35 112 166 37 53 240 167 39 155 240 168 42 1 240 169 7 125 240 169 238 52 112 170 231 95 240 171 215 80 240 172 199 65 240 173 201 167 240 174 167 35 240 175 160 79 112 176 135 5 240 177 137 107 240 178 112 76 160 179 114 178 160 180 80 46 160 181 73 90 32 182 48 16 160 183 50 118 160 184 15 242 160 184 255 227 160 185 239 212 160 186 214 139 32 187 216 241 32 188 200 226 32 189 184 211 32 190 159 137 160 191 152 181 32 192 155 27 32 193 120 151 32 194 104 136 32 195 88 121 32 196 63 47 160 197 56 91 32 198 58 193 32 199 88 214 160 199 218 9 160 200 74 25 32 204 231 75 16 205 169 23 144 206 162 67 16 207 146 52 16 208 91 191 96 208 110 94 144 209 114 22 16 210 78 64 144 211 145 64 16 212 75 35 144 13 42 253 112 13 164 99 144 14 139 26 16 15 132 69 144 16 116 54 144 17 100 39 144 18 84 24 144 19 77 68 16 20 51 250 144 21 35 235 144 22 19 220 144 23 3 205 144 23 243 190 144 24 227 175 144 25 211 160 144 26 195 145 144 27 188 189 16 28 172 174 16 29 156 159 16 30 140 144 16 31 124 129 16 32 108 114 16 33 92 99 16 34 76 84 16 35 60 69 16 36 44 54 16 37 28 39 16 38 12 24 16 39 5 67 144 39 245 52 144 40 229 37 144 41 213 22 144 42 197 7 144 43 180 248 144 44 164 233 144 45 148 218 144 46 132 203 144 47 116 188 144 48 100 173 144 49 93 217 16 50 114 180 16 51 61 187 16 52 82 150 16 53 29 157 16 54 50 120 16 54 253 127 16 56 27 148 144 56 221 97 16 57 251 118 144 58 189 67 16 59 219 88 144 60 166 95 144 61 187 58 144 62 134 65 144 63 155 28 144 64 102 35 144 65 132 57 16 66 70 5 144 67 100 27 16 68 37 231 144 69 67 253 16 70 5 201 144 71 35 223 16 71 238 230 16 73 3 193 16 73 206 200 16 74 227 163 16 75 174 170 16 76 204 191 144 77 142 140 16 78 172 161 144 79 110 110 16 80 140 131 144 81 87 138 144 82 108 101 144 83 55 108 144 84 76 71 144 85 23 78 144 86 44 41 144 86 247 48 144 88 21 70 16 88 215 18 144 89 245 40 16 90 182 244 144 91 213 10 16 92 160 17 16 93 180 236 16 94 127 243 16 95 148 206 16 96 95 213 16 97 125 234 144 98 63 183 16 99 93 204 144 100 31 153 16 101 61 174 144 102 8 181 144 103 29 144 144 103 232 151 144 104 253 114 144 105 200 121 144 106 221 84 144 107 168 91 144 108 198 113 16 109 136 61 144 110 166 83 16 111 104 31 144 112 134 53 16 113 81 60 16 114 102 23 16 115 49 30 16 116 69 249 16 117 17 0 16 118 47 21 144 118 240 226 16 120 14 247 144 120 208 196 16 121 238 217 144 122 176 166 16 123 206 187 144 124 153 194 144 125 174 157 144 126 121 164 144 127 142 127 144 1 4 1 2 3 2 3 7 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 2 3 2 3 2 4 3 2 3 2 3 1 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 8 9 0 0 0 0 0 0 0 0 14 16 0 4 0 0 28 32 1 8 0 0 14 16 0 4 0 0 28 32 1 8 0 0 14 16 1 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 28 32 1 8 0 0 14 16 0 4 87 69 84 0 67 69 84 0 67 69 83 84 0 87 69 83 84 0 0 0 1 1 0 1 1 1 1 1 0 0 0 0 0 0 0 1 1 1]
]

{ #category : #testing }
ZTimezoneTests >> testCET [
	
	| timestamp timeA timeB |
	 
	timestamp := ZTimestamp now.
	timeA := (ZTimezone id: 'CET') localToGmt: timestamp.
	timeB := (ZTimezone id: 'Europe/Brussels') localToGmt: timestamp.
	
	self assert: timeA equals: timeB
]

{ #category : #testing }
ZTimezoneTests >> testDaylightSavingTimeTransition [
	"Daylight Saving Time (DST) creates a discontinuity 
	in the local wall time when the transition occurs.
	For timezone Europe/Brussels, on March 30, 2014, at 01:00 GMT,
	the offset goes from 1 hour (CET) to 2 hours (CEST), which means that
	the local wall time jumps from 02:00 to 03:00 on that day.
	Local time within that interval is ill defined."

	| timezone |
	timezone := ZTimezone id: 'Europe/Brussels'.
	"1 second before the transition"
	self
		assert: (timezone gmtToLocal: (ZTimestamp fromString: '2014-03-30T00:59:59Z'))
		equals: (ZTimestamp fromString: '2014-03-30T01:59:59Z').
	"a second later the transition occurs, jumping 1 hour forward"
	self
		assert: (timezone gmtToLocal: (ZTimestamp fromString: '2014-03-30T01:00:00Z'))
		equals: (ZTimestamp fromString: '2014-03-30T03:00:00Z').
	"reverse conversion just before the transition"
	self
		assert: (timezone localToGmt: (ZTimestamp fromString: '2014-03-30T01:59:59Z'))
		equals: (ZTimestamp fromString: '2014-03-30T00:59:59Z').	
	"reverse conversion a second later, after jumping 1 hour forward in local wall time"
	self
		assert: (timezone localToGmt: (ZTimestamp fromString: '2014-03-30T03:00:00Z'))
		equals: (ZTimestamp fromString: '2014-03-30T01:00:00Z').	
	"for an ill defined local wall time inside the jump, the offset is still 1 hour"
	self
		assert: (timezone localToGmt: (ZTimestamp fromString: '2014-03-30T02:30:00Z'))
		equals: (ZTimestamp fromString: '2014-03-30T01:30:00Z').
	"but converting that GMT timestamp gives a different local wall time"
	self
		assert: (timezone gmtToLocal: (ZTimestamp fromString: '2014-03-30T01:30:00Z'))
		equals: (ZTimestamp fromString: '2014-03-30T03:30:00Z').


]

{ #category : #testing }
ZTimezoneTests >> testEuropeBrussels [
	| timezone |
	timezone := ZTimezone id: #'Europe/Brussels'.
	self assert: timezone id equals: #'Europe/Brussels'.
	self assertIsTimezoneEuropeBrussels: timezone
]

{ #category : #testing }
ZTimezoneTests >> testGMT [
	| timezone subTimezone |
	timezone := ZTimezone gmt.
	self assert: timezone id equals: #GMT.
	subTimezone := timezone subzoneForTimestamp: ZTimestamp now.
	self assert: subTimezone abbreviation equals: #GMT.
	self assert: subTimezone offset equals: Duration zero.
	self deny: subTimezone isDaylightSaving.
	self assert: (ZTimezone id: #GMT) equals: timezone
]

{ #category : #testing }
ZTimezoneTests >> testGmtToLocal [
	| timezone |
	timezone := ZTimezone id: 'Europe/Brussels'.
	self 
		assert: (timezone gmtToLocal: (ZTimestamp fromString: '2014-01-15T12:00:00Z'))
		equals: (ZTimestamp fromString: '2014-01-15T13:00:00Z').
	self 
		assert: (timezone gmtToLocal: (ZTimestamp fromString: '2014-08-15T12:00:00Z'))
		equals: (ZTimestamp fromString: '2014-08-15T14:00:00Z').
]

{ #category : #testing }
ZTimezoneTests >> testIdentifiers [
	self checkZoneInfoLocation.
	self deny: ZTimezone timezoneIdentifiers isEmpty.
	self assert: (ZTimezone timezoneIdentifiers includes: #'Europe/Brussels')
]

{ #category : #testing }
ZTimezoneTests >> testLocalToGmt [
	| timezone |
	timezone := ZTimezone id: 'Europe/Brussels'.
	self 
		assert: (timezone localToGmt: (ZTimestamp fromString: '2014-01-15T12:00:00Z'))
		equals: (ZTimestamp fromString: '2014-01-15T11:00:00Z').
	self 
		assert: (timezone localToGmt: (ZTimestamp fromString: '2014-08-15T12:00:00Z'))
		equals: (ZTimestamp fromString: '2014-08-15T10:00:00Z').
]

{ #category : #testing }
ZTimezoneTests >> testLocaltime [
	| timezone subTimezone |
	timezone := ZTimezone localtime.
	self assert: timezone id equals: #localtime.
	subTimezone := timezone subzoneForTimestamp: ZTimestamp now.
	self assert: subTimezone abbreviation equals: #localtime.
	self assert: subTimezone offset equals: ZTimestamp localTimeZone offset.
	self deny: subTimezone isDaylightSaving.
	self assert: (ZTimezone id: #localtime) equals: timezone
]

{ #category : #testing }
ZTimezoneTests >> testParsing [
	| timezone |
	timezone := ZTimezone fromStream: self europeBrusselsContents readStream.
	self assert: timezone transitions size equals: 185.
	self assert: timezone subzones size equals: 10.
	self assertIsTimezoneEuropeBrussels: timezone
]

{ #category : #testing }
ZTimezoneTests >> testROK [
	
	| timestamp timeA timeB |
	 
	timestamp := ZTimestamp now.
	timeA := (ZTimezone id: 'ROK') localToGmt: timestamp.
	timeB := (ZTimezone id: 'Asia/Seoul') localToGmt: timestamp.
	
	self assert: timeA equals: timeB
]

{ #category : #testing }
ZTimezoneTests >> testReadAll [
	| timezones timezone |
	self checkZoneInfoLocation.
	timezones := ZTimezone timezoneIdentifiers 
		collect: [ :each | ZTimezone readTimezoneWithId: each ].
	self deny: timezones isEmpty.
	timezone := timezones 
		detect: [ :each | each id = #'Europe/Brussels' ]
		ifNone: [ self fail ].
	self assertIsTimezoneEuropeBrussels: timezone
]

{ #category : #testing }
ZTimezoneTests >> testReadAllUsingFallback [
	| zoneInfoLocation zonetab timezones europeBrussels |
	"Test downloading and using the fallback dataset, being careful not to modify any class side state"
	zoneInfoLocation := ZTimezone downloadFallbackZoneinfoDataset.
	zonetab := ZTimezone readZoneTabFrom: zoneInfoLocation.
	timezones := zonetab
		collect: [ :each | | id location timezone |
			id := each first.
			location := ZTimezone locationForId: id relativeTo: zoneInfoLocation.
			self assert: location exists.
			timezone := ZTimezone fromFile: location.
			timezone id: id.
			timezone ].
	self deny: timezones isEmpty.
	europeBrussels := timezones 
		detect: [ :each | each id = #'Europe/Brussels' ]
		ifNone: [ self fail ].
	self assertIsTimezoneEuropeBrussels: europeBrussels
]

{ #category : #testing }
ZTimezoneTests >> testTimezoneWithNoSubzoneIndex [
	"The first one is manually constructed, not read"
	self 
		assert: (ZTimezone gmt offsetForTimestamp: DateAndTime now) 
		equals: Duration zero.
	"The second one is read, has only 1 sub zone, but no transitions and an empty index"
	self 
		assert: ((ZTimezone id: 'Etc/GMT') offsetForTimestamp: DateAndTime now) 
		equals: Duration zero
]

{ #category : #testing }
ZTimezoneTests >> testUnknownID [
	self should: [ ZTimezone id: 'FooBar' ] raise: Error
]

{ #category : #testing }
ZTimezoneTests >> testZoneInfoLocation [
	self checkZoneInfoLocation.
	self assert: ZTimezone zoneInfoLocation exists
]
