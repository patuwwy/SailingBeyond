; Clinkster music converted from music.xrns 2017-02-13 23:50:08

%define USES_SINE 1
%define USES_SAWTOOTH 1
%define USES_SQUARE 0
%define USES_PARABOLA 1
%define USES_TRIANGLE 1
%define USES_NOISE 1
%define USES_VELOCITY 0
%define USES_LONG_NOTES 1
%define USES_DELAY 1
%define USES_PANNING 1
%define USES_INDEXDECAY 1
%define USES_GAIN 1

%define SUBSAMPLES_PER_TICK 10176
%define MAX_INSTRUMENT_SUBSAMPLES 2818048
%define MAX_TOTAL_INSTRUMENT_SAMPLES 3014656
%define MAX_RELEASE_SUBSAMPLES 720896
%define TOTAL_SAMPLES 3932160
%define MAX_TRACK_INSTRUMENT_RENDERS 14

%define MAX_DELAY_LENGTH 12721
%define LEFT_DELAY_LENGTH 12721
%define RIGHT_DELAY_LENGTH 12721
%define DELAY_STRENGTH 0.52118899

%define NUMTRACKS 12
%define LOGNUMTICKS 11
%define MUSIC_LENGTH 1472
%define TICKS_PER_SECOND 17.33333333


	section instdata data align=1

_InstrumentData:
	; 00:  hihat 3 / 08|Clinkster (Basic)
	db	1,2,20,24,9,23,12,27,5,32,32,-22,37,-10,-14,-5,-1,-21,-1,-8
	db	50,2,0,-1
	; 01:  Guitar / 04|heavyguitar
	db	0,2,5,5,2,12,8,17,7,14,14,0,-24,0,0,16,-11,28,-6,-11
	db	62,46,0,-1
	db	-1
	; 02:  kick / 00|bassdrum
	db	0,0,0,0,0,0,1,0,-4,23,23,19,0,-82,0,0,10,-114,-14,-86
	db	28,2,0,9,2,0,-1
	; 03:  snare / 01|snare1
	db	0,4,26,10,0,6,20,4,6,34,29,-2,0,-70,0,0,35,-101,-23,-99
	db	36,5,0,6,3,0,1,8,0,12,3,0,-1
	; 04:  hihat 2 / 05|woodblock
	db	1,2,21,38,12,15,24,22,-2,72,47,15,4,-17,0,-22,-28,-23,-96,-107
	db	36,2,0,11,12,0,11,22,8,6,2,1,0,11,14,10,6,2,0,-1
	; 05:  PAD / Lead / 02|VST: Clinkster (Basic)
	db	3,2,5,5,5,5,13,5,14,27,20,0,0,0,0,0,-12,12,18,10
	db	41,32,0,3,4,0,0,8,4,0,1,8,0,1,16,0,13,2,0,2,4,0,4,16,12,4,0,1,12,0,-1
	; 06:  PAD / Lead / 02|VST: Clinkster (Basic)
	db	3,2,5,5,5,5,13,5,14,27,20,0,0,0,0,0,-12,12,18,10
	db	57,32,11,0,0,16,0,1,4,0,1,40,32,8,4,0,1,40,32,0,2,8,0,-1
	; 07:  PAD / Lead / 02|VST: Clinkster (Basic)
	db	3,2,5,5,5,5,13,5,14,27,20,0,0,0,0,0,-12,12,18,10
	db	65,2,0,1,32,0,1,48,40,0,-1
	; 08:  Bass / 03|Clinkster (Basic)
	db	0,2,5,5,0,9,1,12,8,29,29,-72,-82,-110,-70,0,-4,-59,-27,-14
	db	26,64,56,37,2,0,2,4,0,1,32,4,0,1,32,3,0,0,32,4,2,0,1,3,0,1,64,0,-1
	; 09:  Reese bass / 06|Clinkster (Basic)
	db	0,2,5,5,33,9,1,12,8,15,15,-72,0,0,-70,4,0,-59,-27,-14
	db	26,64,0,2,32,0,1,63,0,1,63,16,0,0,64,32,16,0,1,63,32,0,1,64,63,0,-1
	; 10:  Track 09 / 07|VST: Clinkster (Basic)
	db	3,3,5,5,5,5,13,5,13,39,39,0,0,0,0,0,-14,16,26,24
	db	38,16,0,6,32,16,0,0,16,0,1,16,8,0,1,-1,128,24,16,0,11,-1,176,2,0,2,2,0,3,20,0,-1
	; 11:  Track 09 / 07|VST: Clinkster (Basic)
	db	3,3,5,5,5,5,13,5,13,39,39,0,0,0,0,0,-14,16,26,24
	db	53,16,0,6,32,16,0,1,16,0,1,40,2,0,0,64,16,2,0,1,34,16,8,0,1,34,2,0,-1
	db	-1,-1

	section notepos data align=1

_NotePositions:
	; 00:  hihat 3 / 08|Clinkster (Basic)
	; position 10 - pattern 10
	db	-5,200,32

	; 01:  Guitar / 04|heavyguitar
	; position 10 - pattern 10
	db	-5,192

	; 02:  kick / 00|bassdrum
	; position 3 - pattern 3
	db	-2,64,20,12,20,12,20,12,20
	; position 4 - pattern 4
	db	12,20,12,20,12,20,12,20
	; position 5 - pattern 5
	db	12,20,12,20,12,20,12,20
	; position 6 - pattern 6
	db	12,20,12,20,12,20,12,20
	; position 7 - pattern 7
	db	12,20,12,20,12,20,12,20
	; position 8 - pattern 8
	db	12,20,12,20,12,20,12,20
	; position 10 - pattern 10
	db	-1,140,20,12,20

	; 03:  snare / 01|snare1
	; position 3 - pattern 3
	db	-2,72,16,32,16,16,16,16
	; position 4 - pattern 4
	db	16,16,32,16,16,16,16
	; position 5 - pattern 5
	db	16,16,32,16,16,16,16
	; position 6 - pattern 6
	db	16,16,32,16,16,16,16
	; position 7 - pattern 7
	db	16,16,32,16,16,16,16
	; position 8 - pattern 8
	db	16,16,32,16,16,16,16
	; position 10 - pattern 10
	db	-1,144,16,32

	; 04:  hihat 2 / 05|woodblock
	; position 3 - pattern 3
	db	-2,76,12,4,12,22,10,6,6,8,12,22
	; position 4 - pattern 4
	db	14,12,4,12,22,10,6,6,8,12,22
	; position 5 - pattern 5
	db	14,12,4,12,22,10,6,6,8,12,22
	; position 6 - pattern 6
	db	14,12,4,12,22,10,6,6,8,12,22
	; position 7 - pattern 7
	db	14,12,4,12,22,10,6,6,8,12,22
	; position 8 - pattern 8
	db	14,12,4,12,22,10,6,6,8,12,22
	; position 10 - pattern 10
	db	-1,136,6,6,8,12,22

	; 05:  PAD / Lead / 02|VST: Clinkster (Basic)
	; position 4 - pattern 4
	db	-3,48
	; position 5 - pattern 5
	db	-1,128
	; position 6 - pattern 6
	db	-1,128
	; position 7 - pattern 7
	db	48,16,64
	; position 8 - pattern 8
	db	-1,128
	; position 9 - pattern 9
	db	16,64,32
	; position 10 - pattern 10
	db	96,16,16

	; 06:  PAD / Lead / 02|VST: Clinkster (Basic)
	; position 7 - pattern 7
	db	-4,64,64
	; position 8 - pattern 8
	db	64,48
	; position 9 - pattern 9
	db	80,32,32,32
	; position 10 - pattern 10
	db	96,16,16

	; 07:  PAD / Lead / 02|VST: Clinkster (Basic)
	; position 5 - pattern 5
	db	-3,64
	; position 7 - pattern 7
	db	-2,0,64
	; position 8 - pattern 8
	db	64

	; 08:  Bass / 03|Clinkster (Basic)
	; position 0 - pattern 0
	db	0,64,32
	; position 1 - pattern 1
	db	32,64,32
	; position 2 - pattern 2
	db	32
	; position 9 - pattern 9
	db	-4,64,64,32
	; position 10 - pattern 10
	db	32,64,16,16
	; position 11 - pattern 11
	db	32

	; 09:  Reese bass / 06|Clinkster (Basic)
	; position 3 - pattern 3
	db	-2,64,64
	; position 4 - pattern 4
	db	64,64
	; position 5 - pattern 5
	db	64,64
	; position 6 - pattern 6
	db	64,64
	; position 7 - pattern 7
	db	64,64
	; position 8 - pattern 8
	db	64,64
	; position 9 - pattern 9
	db	64,64,32
	; position 10 - pattern 10
	db	32,64,16,16

	; 10:  Track 09 / 07|VST: Clinkster (Basic)
	; position 0 - pattern 0
	db	0
	; position 1 - pattern 1
	db	-1,128
	; position 3 - pattern 3
	db	-1,192,64
	; position 4 - pattern 4
	db	64,64
	; position 5 - pattern 5
	db	64,64
	; position 6 - pattern 6
	db	64,64
	; position 7 - pattern 7
	db	64,64
	; position 8 - pattern 8
	db	64,64
	; position 9 - pattern 9
	db	64,36,28
	; position 10 - pattern 10
	db	-1,160
	; position 11 - pattern 11
	db	32

	; 11:  Track 09 / 07|VST: Clinkster (Basic)
	; position 0 - pattern 0
	db	60,34
	; position 3 - pattern 3
	db	-1,226,64
	; position 4 - pattern 4
	db	64,64
	; position 5 - pattern 5
	db	64,40,24
	; position 6 - pattern 6
	db	64,40,24
	; position 7 - pattern 7
	db	64,64
	; position 8 - pattern 8
	db	64,64
	; position 10 - pattern 10
	db	-2,32


	section notesamp data align=1

_NoteSamples:
	; 00:  hihat 3 / 08|Clinkster (Basic)
	; position 10 - pattern 10
	db	0,0
	db	-1

	; 01:  Guitar / 04|heavyguitar
	; position 10 - pattern 10
	db	0
	db	-1

	; 02:  kick / 00|bassdrum
	; position 3 - pattern 3
	db	1,1,1,0,1,1,1,0
	; position 4 - pattern 4
	db	1,1,1,0,1,1,1,0
	; position 5 - pattern 5
	db	1,1,1,0,1,1,1,0
	; position 6 - pattern 6
	db	1,1,1,0,1,1,1,0
	; position 7 - pattern 7
	db	1,1,1,0,1,1,1,0
	; position 8 - pattern 8
	db	1,1,1,0,1,1,1,0
	; position 10 - pattern 10
	db	1,1,1,0
	db	-1

	; 03:  snare / 01|snare1
	; position 3 - pattern 3
	db	0,1,3,3,3,3,3
	; position 4 - pattern 4
	db	0,1,3,3,3,3,3
	; position 5 - pattern 5
	db	0,1,3,3,3,3,3
	; position 6 - pattern 6
	db	0,1,3,3,3,3,3
	; position 7 - pattern 7
	db	0,1,3,3,3,3,3
	; position 8 - pattern 8
	db	0,1,3,3,3,3,3
	; position 10 - pattern 10
	db	2,3,3
	db	-1

	; 04:  hihat 2 / 05|woodblock
	; position 3 - pattern 3
	db	5,6,0,2,8,4,9,3,1,2,7
	; position 4 - pattern 4
	db	5,6,0,2,8,4,9,3,1,2,7
	; position 5 - pattern 5
	db	5,6,0,2,8,4,9,3,1,2,7
	; position 6 - pattern 6
	db	5,6,0,2,8,4,9,3,1,2,7
	; position 7 - pattern 7
	db	5,6,0,2,8,4,9,3,1,2,7
	; position 8 - pattern 8
	db	5,6,0,2,8,4,9,3,1,2,10
	; position 10 - pattern 10
	db	4,9,3,1,2,10
	db	-1

	; 05:  PAD / Lead / 02|VST: Clinkster (Basic)
	; position 4 - pattern 4
	db	6
	; position 5 - pattern 5
	db	7
	; position 6 - pattern 6
	db	9
	; position 7 - pattern 7
	db	11,8,10
	; position 8 - pattern 8
	db	6
	; position 9 - pattern 9
	db	5,0,2
	; position 10 - pattern 10
	db	1,3,4
	db	-1

	; 06:  PAD / Lead / 02|VST: Clinkster (Basic)
	; position 7 - pattern 7
	db	4,5
	; position 8 - pattern 8
	db	8,9
	; position 9 - pattern 9
	db	2,1,0,6
	; position 10 - pattern 10
	db	3,7,10
	db	-1

	; 07:  PAD / Lead / 02|VST: Clinkster (Basic)
	; position 5 - pattern 5
	db	0
	; position 7 - pattern 7
	db	3,1
	; position 8 - pattern 8
	db	2
	db	-1

	; 08:  Bass / 03|Clinkster (Basic)
	; position 0 - pattern 0
	db	0,9,5
	; position 1 - pattern 1
	db	13,7,5
	; position 2 - pattern 2
	db	1
	; position 9 - pattern 9
	db	6,4,10
	; position 10 - pattern 10
	db	3,8,11,12
	; position 11 - pattern 11
	db	2
	db	-1

	; 09:  Reese bass / 06|Clinkster (Basic)
	; position 3 - pattern 3
	db	11,5
	; position 4 - pattern 4
	db	3,5
	; position 5 - pattern 5
	db	11,5
	; position 6 - pattern 6
	db	8,5
	; position 7 - pattern 7
	db	11,10
	; position 8 - pattern 8
	db	3,5
	; position 9 - pattern 9
	db	2,1,6
	; position 10 - pattern 10
	db	0,4,7,9
	db	-1

	; 10:  Track 09 / 07|VST: Clinkster (Basic)
	; position 0 - pattern 0
	db	6
	; position 1 - pattern 1
	db	9
	; position 3 - pattern 3
	db	0,3
	; position 4 - pattern 4
	db	1,3
	; position 5 - pattern 5
	db	0,3
	; position 6 - pattern 6
	db	4,3
	; position 7 - pattern 7
	db	8,8
	; position 8 - pattern 8
	db	2,3
	; position 9 - pattern 9
	db	11,10,12
	; position 10 - pattern 10
	db	5
	; position 11 - pattern 11
	db	7
	db	-1

	; 11:  Track 09 / 07|VST: Clinkster (Basic)
	; position 0 - pattern 0
	db	12,9
	; position 3 - pattern 3
	db	0,0
	; position 4 - pattern 4
	db	1,3
	; position 5 - pattern 5
	db	8,5,7
	; position 6 - pattern 6
	db	4,13,7
	; position 7 - pattern 7
	db	6,10
	; position 8 - pattern 8
	db	2,3
	; position 10 - pattern 10
	db	11
	db	-1

