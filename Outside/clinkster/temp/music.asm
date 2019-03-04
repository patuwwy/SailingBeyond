; Clinkster music converted from music.xrns 2018-09-01 00:38:22

%define USES_SINE 1
%define USES_SAWTOOTH 1
%define USES_SQUARE 1
%define USES_PARABOLA 1
%define USES_TRIANGLE 1
%define USES_NOISE 1
%define USES_VELOCITY 1
%define USES_LONG_NOTES 1
%define USES_DELAY 0
%define USES_PANNING 0
%define USES_INDEXDECAY 1
%define USES_GAIN 1

%define SUBSAMPLES_PER_TICK 15120
%define MAX_INSTRUMENT_SUBSAMPLES 8257536
%define MAX_TOTAL_INSTRUMENT_SAMPLES 4784128
%define MAX_RELEASE_SUBSAMPLES 524288
%define TOTAL_SAMPLES 10092544
%define MAX_TRACK_INSTRUMENT_RENDERS 93

%define MAX_DELAY_LENGTH 0
%define LEFT_DELAY_LENGTH 0
%define RIGHT_DELAY_LENGTH 0
%define DELAY_STRENGTH 0.00000000

%define NUMTRACKS 50
%define LOGNUMTICKS 12
%define MUSIC_LENGTH 2624
%define TICKS_PER_SECOND 11.66666667


	section instdata data align=1

_InstrumentData:
	; 00:  Lo Pad / 0B|Lo Pad
	db	0,1,6,3,0,1,5,0,32,6,0,7,0,0,14,55,30,-120,28
	db	28,127,32,0,2,127,32,0,1,127,32,0,0,127,32,0,0,127,64,127,32,0,0,127,32,0,0,127,32,0,0,127,32,0,3,127,32,0,4,127,32,0,1,127,32,0,0,127,32,0,-1
	; 01:  Lo Pad / 0C|Instant Lo Pad
	db	0,1,6,3,0,1,5,0,32,6,0,7,0,0,14,55,-7,-120,3
	db	35,127,64,127,16,0,0,127,32,0,0,127,8,0,0,127,32,127,8,0,0,127,32,0,0,8,8,16,8,32,8,127,96,127,64,127,32,127,20,127,8,0,1,127,32,127,12,0,0,127,32,127,20,0,1,127,32,127,12,0,1,127,32,0,-1
	; 02:  Lo Pad / 0B|Lo Pad
	db	0,1,6,3,0,1,5,0,32,6,0,7,0,0,14,55,30,-120,28
	db	40,127,32,0,2,127,32,0,1,127,32,0,0,127,32,0,0,127,64,127,32,0,0,127,32,0,0,127,32,0,0,127,32,0,3,127,32,0,4,127,32,0,1,127,32,0,0,127,32,0,-1
	; 03:  Lo Pad / 0C|Instant Lo Pad
	db	0,1,6,3,0,1,5,0,32,6,0,7,0,0,14,55,-7,-120,3
	db	47,1,8,2,8,4,8,8,8,16,8,32,8,127,64,127,16,0,0,127,32,0,0,127,8,0,0,127,32,127,8,0,0,127,32,0,0,1,8,2,8,4,8,8,8,16,8,32,8,127,96,127,32,127,20,127,16,127,8,0,1,127,32,127,12,0,0,127,32,127,20,0,1,127,32,127,12,0,1,127,32,0,-1
	; 04:  Bassline / 01|Distort Bass
	db	0,0,4,1,0,1,3,0,32,20,0,19,0,0,-46,56,-32,-120,-24
	db	22,127,32,0,0,127,16,127,8,127,2,0,0,127,32,0,0,127,32,0,0,127,32,0,0,127,32,0,0,127,-1,128,127,32,127,16,127,8,0,1,127,32,0,0,127,32,0,3,127,32,127,6,127,4,0,1,127,8,0,0,127,32,127,8,0,-1
	; 05:  Bassline / 00|Prodigy Mod
	db	1,1,7,5,0,37,2,0,19,20,-7,19,0,0,-22,-11,-34,-120,-18
	db	15,127,56,0,-1
	; 06:  Bassline / 00|Prodigy Mod
	db	1,1,7,5,0,37,2,0,19,20,-7,19,0,0,-22,-11,-34,-120,-18
	db	15,127,16,0,4,127,16,0,-1
	; 07:  Stopa / 02|Dirty Kick
	db	0,2,0,0,0,54,1,0,0,22,26,51,-42,-103,-92,-2,-26,13,-30
	db	23,1,1,2,1,3,1,4,1,5,1,6,1,7,1,8,1,12,1,16,1,32,1,48,1,64,1,80,1,96,1,127,1,0,-1
	; 08:  Stopa / 09|Transient Kick
	db	0,3,0,0,0,49,1,0,0,22,34,65,-52,-120,-94,0,-42,-8,-30
	db	23,4,1,8,1,16,1,32,1,48,1,64,1,96,1,127,1,0,-1
	; 09:  Stopa / 10|Stick Kick
	db	0,3,0,0,0,46,1,0,0,22,24,36,-66,-121,-109,0,-60,-2,-6
	db	23,1,1,2,1,3,1,4,1,5,1,6,1,7,1,8,1,12,1,16,1,32,1,48,1,64,1,80,1,96,1,127,1,0,-1
	; 10:  Stopa / 02|Dirty Kick
	db	0,2,0,0,0,54,1,0,0,22,26,51,-42,-103,-92,-2,-26,13,-30
	db	23,4,1,8,1,16,1,32,1,48,1,64,1,96,1,127,1,0,-1
	; 11:  Werbel / 03|Dirty Snare
	db	2,1,6,4,0,65,3,0,0,22,14,-11,25,43,-58,-6,-40,1,-50
	db	35,8,1,16,1,32,1,64,1,96,1,127,1,0,-1
	; 12:  Werbel / 05|Snare Reverb
	db	5,0,14,0,0,0,3,0,-1,22,-85,0,6,0,0,-17,-13,5,-31
	db	35,8,20,8,4,16,4,32,4,127,4,127,2,0,-1
	; 13:  Werbel / 04|Noisy Snare
	db	0,5,0,0,0,5,1,0,0,22,50,-112,-70,-4,-4,0,-35,2,-33
	db	35,8,1,16,1,32,1,64,1,96,1,127,1,0,-1
	; 14:  Werbel / 05|Snare Reverb
	db	5,0,14,0,0,0,3,0,-1,22,-85,0,6,0,0,-17,-13,5,-31
	db	35,4,22,8,34,8,14,8,4,8,2,16,26,16,14,16,4,16,2,32,2,64,2,127,12,127,4,127,2,0,-1
	; 15:  Hihat / 06|Rezo Hihat
	db	2,2,5,4,0,49,1,0,-2,22,109,93,-1,1,37,0,-44,-22,-31
	db	71,16,18,16,2,32,2,127,2,0,-1
	; 16:  Hihat / 07|Shaker
	db	0,5,0,0,0,20,1,0,-3,22,70,-118,0,0,-70,0,-15,-8,-41
	db	71,64,4,127,20,127,4,0,-1
	; 17:  Plucki / 08|FM Pluck
	db	0,1,10,5,0,2,4,0,-1,14,0,43,0,0,-15,0,-32,31,-15
	db	35,127,36,0,23,127,2,0,6,127,2,0,0,127,26,127,6,0,1,127,48,0,1,127,20,127,4,127,2,0,2,127,4,0,1,127,48,127,40,127,24,127,6,0,1,127,2,0,0,127,10,127,6,0,1,127,2,0,1,127,2,0,9,127,2,0,1,127,2,0,-1
	; 18:  Plucki / 08|FM Pluck
	db	0,1,10,5,0,2,4,0,-1,14,0,43,0,0,-15,0,-32,31,-15
	db	47,127,38,0,23,127,30,127,20,0,4,127,36,0,4,127,24,0,-1
	; 19:  Plucki / 08|FM Pluck
	db	0,1,10,5,0,2,4,0,-1,14,0,43,0,0,-15,0,-32,31,-15
	db	35,127,40,0,42,127,64,127,52,0,4,127,24,0,-1
	; 20:  Plucki / 08|FM Pluck
	db	0,1,10,5,0,2,4,0,-1,14,0,43,0,0,-15,0,-32,31,-15
	db	74,127,-1,128,0,4,127,-1,128,127,48,0,-1
	; 21:  Plucki / 08|FM Pluck
	db	0,1,10,5,0,2,4,0,-1,14,0,43,0,0,-15,0,-32,31,-15
	db	74,127,-1,128,127,44,0,1,127,-1,128,0,-1
	; 22:  Percussions / 0A|Square Perc
	db	0,2,10,8,0,1,1,0,-1,5,32,70,-108,-13,34,87,-78,-19,-14
	db	38,127,1,0,4,127,1,0,1,127,1,0,1,127,1,0,4,127,1,0,1,127,1,0,4,127,1,0,-1
	; 23:  Percussions / 0A|Square Perc
	db	0,2,10,8,0,1,1,0,-1,5,32,70,-108,-13,34,87,-78,-19,-14
	db	38,32,1,0,6,32,1,0,1,32,1,0,4,32,1,0,1,32,1,0,4,32,1,0,-1
	; 24:  Pady / 0D|Pady
	db	4,4,10,8,0,2,3,0,32,9,12,0,0,0,16,0,26,-120,30
	db	47,127,32,0,1,127,32,0,0,127,32,0,1,127,32,0,1,127,32,127,24,0,0,127,32,127,24,0,0,127,32,0,0,127,80,127,32,0,1,127,32,0,0,127,32,0,0,127,32,0,0,127,32,0,0,127,32,0,0,127,32,0,4,127,32,0,1,127,32,0,-1
	; 25:  Pady / 0D|Pady
	db	4,4,10,8,0,2,3,0,32,9,12,0,0,0,16,0,26,-120,30
	db	50,127,32,0,3,127,32,0,1,127,32,0,0,127,32,0,1,127,32,127,24,0,0,127,32,0,0,127,80,0,0,127,32,0,2,127,32,0,0,127,32,0,0,127,32,0,0,127,32,0,0,127,32,0,1,127,32,0,1,127,32,0,0,127,32,0,-1
	; 26:  Pady / 0D|Pady
	db	4,4,10,8,0,2,3,0,32,9,12,0,0,0,16,0,26,-120,30
	db	54,127,32,0,1,127,32,0,0,127,32,0,1,127,32,0,1,127,32,127,24,0,0,127,80,127,32,0,1,127,32,0,0,127,32,0,0,127,32,0,1,127,32,0,0,127,32,0,1,127,32,0,0,127,32,0,0,127,32,0,0,127,32,0,1,127,32,0,1,127,32,0,-1
	; 27:  Pady / 0D|Pady
	db	4,4,10,8,0,2,3,0,32,9,12,0,0,0,16,0,26,-120,30
	db	59,127,32,0,1,127,32,0,0,127,32,127,24,0,0,127,32,0,0,127,80,127,32,0,1,127,32,0,0,127,32,0,1,127,32,0,1,127,32,0,0,127,32,0,0,127,32,0,0,127,32,0,0,127,32,0,2,127,32,0,0,127,32,0,-1
	; 28:  Pady / 0D|Pady
	db	4,4,10,8,0,2,3,0,32,9,12,0,0,0,16,0,26,-120,30
	db	50,127,32,0,1,127,32,0,4,127,32,0,1,127,32,0,6,127,80,127,32,127,24,0,0,127,32,127,24,0,1,127,32,0,0,127,32,0,0,127,32,0,1,127,32,0,1,127,32,0,2,127,32,0,0,127,32,0,-1
	; 29:  Pady / 0D|Pady
	db	4,4,10,8,0,2,3,0,32,9,12,0,0,0,16,0,26,-120,30
	db	54,127,32,0,2,127,32,0,3,127,32,0,0,127,32,0,6,127,80,127,32,0,1,127,24,0,0,127,32,0,0,127,32,0,0,127,32,0,0,127,32,0,1,127,32,0,1,127,32,0,1,127,32,0,-1
	; 30:  Pady / 0D|Pady
	db	4,4,10,8,0,2,3,0,32,9,12,0,0,0,16,0,26,-120,30
	db	59,127,32,0,2,127,32,0,1,127,32,0,1,127,32,0,4,127,32,0,1,127,80,127,32,127,24,0,0,127,32,0,1,127,32,0,1,127,32,0,0,127,-2,224,0,-1
	; 31:  Pady / 0D|Pady
	db	4,4,10,8,0,2,3,0,32,9,12,0,0,0,16,0,26,-120,30
	db	61,127,32,0,0,127,32,0,3,127,32,0,0,127,32,0,6,127,32,127,24,0,1,127,80,127,32,0,1,127,32,0,0,127,32,0,-1
	; 32:  Rising / 0E|Rising Mod
	db	0,1,10,9,0,1,4,5,32,8,24,0,0,10,12,0,7,-120,10
	db	35,127,-2,192,0,11,127,-2,192,0,-1
	; 33:  Low Droplets / 0F|LFO Drop
	db	4,3,3,6,0,55,4,0,0,12,12,-34,-34,8,-16,0,4,26,-16
	db	43,127,1,0,8,127,1,0,6,127,1,0,5,127,1,0,29,127,1,0,0,127,1,0,-1
	; 34:  Low Droplets / 0F|LFO Drop
	db	4,3,3,6,0,55,4,0,0,12,12,-34,-34,8,-16,0,4,26,-16
	db	59,64,1,0,12,64,1,0,16,127,1,0,-1
	; 35:  Low Droplets / 0F|LFO Drop
	db	4,3,3,6,0,55,4,0,0,12,12,-34,-34,8,-16,0,4,26,-16
	db	59,32,1,0,48,32,1,0,-1
	; 36:  Low Droplets / 0F|LFO Drop
	db	4,3,3,6,0,55,4,0,0,12,12,-34,-34,8,-16,0,4,26,-16
	db	95,16,1,0,-1
	; 37:  Rings / 11|Rings
	db	3,4,14,8,0,76,4,0,0,16,0,19,0,-14,-22,0,10,26,2
	db	12,127,1,0,1,32,1,127,1,0,9,127,1,0,1,64,1,0,2,80,1,0,3,127,1,0,4,32,1,127,1,0,2,32,1,127,1,0,1,127,1,0,28,127,1,0,-1
	; 38:  Rings / 12|#Rings
	db	3,4,14,8,0,76,4,0,0,16,0,19,0,-14,-22,0,-25,17,-2
	db	15,4,1,8,1,16,1,32,1,48,1,64,1,96,1,127,1,0,-1
	; 39:  Rings / 11|Rings
	db	3,4,14,8,0,76,4,0,0,16,0,19,0,-14,-22,0,10,26,2
	db	24,127,1,0,3,127,1,0,0,127,1,0,11,127,1,0,1,127,1,0,23,127,1,0,1,127,1,0,-1
	; 40:  Rings / 12|#Rings
	db	3,4,14,8,0,76,4,0,0,16,0,19,0,-14,-22,0,-25,17,-2
	db	15,1,1,2,1,4,1,8,1,16,1,32,1,48,1,64,1,0,-1
	; 41:  Rings / 11|Rings
	db	3,4,14,8,0,76,4,0,0,16,0,19,0,-14,-22,0,10,26,2
	db	19,127,1,0,6,127,1,0,1,127,1,0,4,127,1,0,4,64,1,0,2,64,1,0,5,127,1,0,-1
	; 42:  Rings / 12|#Rings
	db	3,4,14,8,0,76,4,0,0,16,0,19,0,-14,-22,0,-25,17,-2
	db	24,127,1,0,0,96,1,0,0,64,1,0,0,48,1,0,0,32,1,0,0,16,1,0,0,8,1,0,0,4,1,0,16,4,1,0,0,8,1,0,0,16,1,0,0,32,1,0,0,48,1,0,0,64,1,0,0,96,1,0,0,127,1,0,-1
	; 43:  Short Bass / 13|Short Bass
	db	1,3,2,10,0,14,1,0,0,16,0,19,0,0,-70,0,-30,0,-15
	db	27,127,1,0,0,127,1,0,1,127,1,0,0,127,1,0,3,127,1,0,0,127,1,0,2,127,1,0,0,127,1,0,1,127,1,0,0,127,1,0,1,127,1,0,1,127,1,0,2,127,1,0,1,127,1,0,-1
	; 44:  Sinus / 14|Sinus
	db	0,0,6,0,0,0,1,0,-5,16,0,0,0,0,0,0,-32,-14,-20
	db	69,32,1,48,1,96,1,112,1,127,1,0,2,127,1,0,1,2,1,18,1,36,1,52,1,66,1,82,1,100,1,116,1,127,1,0,0,127,1,0,0,1,1,16,1,34,1,50,1,64,1,80,1,98,1,114,1,127,1,0,0,127,1,0,0,4,1,20,1,38,1,42,1,54,1,58,1,68,1,84,1,102,1,106,1,118,1,122,1,127,1,0,0,6,1,10,1,22,1,26,1,40,1,44,1,56,1,60,1,70,1,74,1,86,1,90,1,104,1,108,1,120,1,124,1,127,1,0,0,127,1,0,0,8,1,12,1,24,1,28,1,46,1,62,1,64,1,72,1,76,1,88,1,92,1,110,1,126,1,127,1,0,0,127,1,0,0,14,1,30,1,78,1,94,1,127,1,0,0,64,1,127,1,0,0,127,1,0,0,64,1,127,1,0,0,127,1,0,0,64,1,0,0,64,1,127,1,0,0,64,1,0,0,64,1,0,1,64,1,0,0,64,1,0,0,64,1,0,0,64,1,0,1,64,1,0,-1
	; 45:  Sinus / 14|Sinus
	db	0,0,6,0,0,0,1,0,-5,16,0,0,0,0,0,0,-32,-14,-20
	db	69,13,1,21,1,45,1,53,1,64,1,0,2,64,1,0,1,6,1,15,1,23,1,30,1,38,1,47,1,55,1,62,1,64,1,0,0,64,1,0,0,5,1,14,1,22,1,29,1,37,1,46,1,54,1,61,1,64,1,0,0,64,1,0,0,7,1,16,1,18,1,24,1,26,1,31,1,39,1,48,1,50,1,56,1,58,1,63,1,64,1,0,0,1,1,2,1,8,1,10,1,17,1,19,1,25,1,27,1,32,1,34,1,40,1,42,1,49,1,51,1,57,1,59,1,64,1,0,0,64,1,0,0,1,1,3,1,9,1,11,1,20,1,28,1,32,1,33,1,35,1,41,1,43,1,52,1,60,1,64,1,0,0,64,1,0,0,4,1,12,1,36,1,44,1,64,1,0,0,32,1,64,1,0,0,64,1,0,0,32,1,64,1,0,0,64,1,0,0,32,1,0,0,32,1,64,1,0,0,32,1,0,0,32,1,0,1,32,1,0,0,32,1,0,0,32,1,0,0,32,1,0,1,32,1,0,-1
	; 46:  Sinus / 14|Sinus
	db	0,0,6,0,0,0,1,0,-5,16,0,0,0,0,0,0,-32,-14,-20
	db	69,5,1,9,1,21,1,25,1,32,1,0,2,32,1,0,1,1,1,6,1,10,1,13,1,17,1,22,1,26,1,29,1,32,1,0,0,32,1,0,0,1,1,5,1,9,1,13,1,17,1,21,1,25,1,29,1,32,1,0,0,32,1,0,0,2,1,6,1,7,1,10,1,11,1,14,1,18,1,22,1,23,1,26,1,27,1,30,1,32,1,0,0,2,1,3,1,7,1,8,1,11,1,12,1,14,1,15,1,18,1,19,1,23,1,24,1,27,1,28,1,30,1,31,1,32,1,0,0,32,1,0,0,1,1,3,1,4,1,8,1,12,1,15,1,16,1,19,1,20,1,24,1,28,1,31,1,32,1,0,0,32,1,0,0,1,1,4,1,16,1,20,1,32,1,0,0,16,1,32,1,0,0,32,1,0,0,16,1,32,1,0,0,32,1,0,0,16,1,0,0,16,1,32,1,0,0,16,1,0,0,16,1,0,1,16,1,0,0,16,1,0,0,16,1,0,0,16,1,0,1,16,1,0,-1
	; 47:  Solo / 15|Solo
	db	1,0,13,10,0,1,3,0,32,17,0,-77,0,0,27,0,-34,-120,-9
	db	62,127,1,0,0,127,1,0,0,127,20,0,2,127,4,0,1,127,4,0,0,127,1,0,0,127,17,127,12,127,4,127,1,0,0,127,11,0,1,127,20,127,12,127,4,127,2,127,1,0,0,127,1,0,0,127,7,127,3,127,1,0,1,127,11,127,4,127,2,127,1,0,0,127,11,127,4,127,3,0,1,127,8,0,1,127,4,0,-1
	; 48:  Solo / 15|Solo
	db	1,0,13,10,0,1,3,0,32,17,0,-77,0,0,27,0,-34,-120,-9
	db	62,64,1,0,0,64,1,0,0,127,20,0,2,64,4,0,1,64,4,0,0,64,1,0,0,64,17,64,12,64,4,64,1,0,0,64,11,0,1,64,16,64,8,64,4,64,2,64,1,0,0,64,1,0,0,64,7,64,3,64,1,0,1,64,11,64,4,64,2,64,1,0,0,64,11,64,4,64,3,0,1,64,8,0,1,64,4,0,-1
	; 49:  Solo / 15|Solo
	db	1,0,13,10,0,1,3,0,32,17,0,-77,0,0,27,0,-34,-120,-9
	db	62,32,1,0,0,32,1,0,0,127,20,0,2,32,4,0,1,32,4,0,0,32,1,0,0,32,17,32,12,32,4,32,1,0,0,32,11,0,1,32,12,32,4,32,2,32,1,0,0,32,1,0,0,32,7,32,3,32,1,0,1,32,11,32,4,32,2,32,1,0,0,32,11,32,4,32,3,0,1,32,8,0,1,32,4,0,-1
	db	-1

	section notepos data align=1

_NotePositions:
	; 00:  Lo Pad / 0B|Lo Pad
	; position 0 - pattern 0
	db	0
	; position 1 - pattern 1
	db	64,32
	; position 2 - pattern 2
	db	32,32
	; position 3 - pattern 3
	db	32,32
	; position 4 - pattern 4
	db	32,32
	; position 5 - pattern 5
	db	32,32
	; position 6 - pattern 6
	db	32,32
	; position 7 - pattern 7
	db	32,32
	; position 8 - pattern 8
	db	32,32
	; position 9 - pattern 9
	db	32,32
	; position 10 - pattern 10
	db	32,32
	; position 28 - pattern 23
	db	-5,96,32
	; position 29 - pattern 24
	db	32,32
	; position 30 - pattern 25
	db	32,32
	; position 31 - pattern 26
	db	32,32

	; 01:  Lo Pad / 0C|Instant Lo Pad
	; position 11 - pattern 11
	db	-3,192
	; position 12 - pattern 12
	db	64,32
	; position 13 - pattern 13
	db	32,32,12
	; position 14 - pattern 12
	db	20,32
	; position 15 - pattern 14
	db	32,32,12
	; position 16 - pattern 15
	db	20,32
	; position 17 - pattern 16
	db	32,32,12
	; position 18 - pattern 15
	db	20,32
	; position 19 - pattern 17
	db	32,32,12
	; position 20 - pattern 18
	db	20
	; position 21 - pattern 18
	db	64
	; position 22 - pattern 19
	db	64
	; position 23 - pattern 19
	db	64
	; position 24 - pattern 20
	db	64
	; position 25 - pattern 20
	db	64
	; position 26 - pattern 21
	db	64
	; position 27 - pattern 22
	db	64,40,8,8
	; position 32 - pattern 27
	db	-2,8,32
	; position 33 - pattern 28
	db	32,32
	; position 34 - pattern 29
	db	32,32
	; position 35 - pattern 30
	db	32,32
	; position 36 - pattern 31
	db	32,32
	; position 37 - pattern 32
	db	32
	; position 38 - pattern 33
	db	96,8,8,8

	; 02:  Lo Pad / 0B|Lo Pad
	; position 0 - pattern 0
	db	0
	; position 1 - pattern 1
	db	64,32
	; position 2 - pattern 2
	db	32,32
	; position 3 - pattern 3
	db	32,32
	; position 4 - pattern 4
	db	32,32
	; position 5 - pattern 5
	db	32,32
	; position 6 - pattern 6
	db	32,32
	; position 7 - pattern 7
	db	32,32
	; position 8 - pattern 8
	db	32,32
	; position 9 - pattern 9
	db	32,32
	; position 10 - pattern 10
	db	32,32
	; position 28 - pattern 23
	db	-5,96,32
	; position 29 - pattern 24
	db	32,32
	; position 30 - pattern 25
	db	32,32
	; position 31 - pattern 26
	db	32,32

	; 03:  Lo Pad / 0C|Instant Lo Pad
	; position 11 - pattern 11
	db	-3,192
	; position 12 - pattern 12
	db	64,32
	; position 13 - pattern 13
	db	32,32,12
	; position 14 - pattern 12
	db	20,32
	; position 15 - pattern 14
	db	32,32,12
	; position 16 - pattern 15
	db	20,32
	; position 17 - pattern 16
	db	32,32,12
	; position 18 - pattern 15
	db	20,32
	; position 19 - pattern 17
	db	32,32,12
	; position 20 - pattern 18
	db	20,16,8,8,8,8,8
	; position 21 - pattern 18
	db	8,16,8,8,8,8,8
	; position 22 - pattern 19
	db	8,16,8,8,8,8,8
	; position 23 - pattern 19
	db	8,16,8,8,8,8,8
	; position 24 - pattern 20
	db	8,16,8,8,8,8,8
	; position 25 - pattern 20
	db	8,16,8,8,8,8,8
	; position 26 - pattern 21
	db	8,16,8,8,8,8,8
	; position 27 - pattern 22
	db	8,16,8,8,8,8,8
	; position 32 - pattern 27
	db	-2,8,32
	; position 33 - pattern 28
	db	32,32
	; position 34 - pattern 29
	db	32,32
	; position 35 - pattern 30
	db	32,32
	; position 36 - pattern 31
	db	32,32
	; position 37 - pattern 32
	db	32
	; position 38 - pattern 33
	db	96,8,8,8

	; 04:  Bassline / 01|Distort Bass
	; position 11 - pattern 11
	db	-3,212,4,28,4,2
	; position 20 - pattern 18
	db	-3,6
	; position 21 - pattern 18
	db	64
	; position 22 - pattern 19
	db	64
	; position 23 - pattern 19
	db	64
	; position 24 - pattern 20
	db	64
	; position 25 - pattern 20
	db	64
	; position 26 - pattern 21
	db	64
	; position 27 - pattern 22
	db	64,40,8,8
	; position 28 - pattern 23
	db	8,32
	; position 29 - pattern 24
	db	32,32
	; position 30 - pattern 25
	db	32,32
	; position 31 - pattern 26
	db	32,32
	; position 32 - pattern 27
	db	32,32
	; position 33 - pattern 28
	db	32,32
	; position 34 - pattern 29
	db	32,32
	; position 35 - pattern 30
	db	32,32
	; position 36 - pattern 31
	db	32,32
	; position 37 - pattern 32
	db	32

	; 05:  Bassline / 00|Prodigy Mod
	; position 11 - pattern 11
	db	-3,200

	; 06:  Bassline / 00|Prodigy Mod
	; position 20 - pattern 18
	db	-6,0
	; position 21 - pattern 18
	db	64
	; position 22 - pattern 19
	db	64
	; position 23 - pattern 19
	db	64
	; position 24 - pattern 20
	db	64
	; position 25 - pattern 20
	db	64
	; position 26 - pattern 21
	db	64
	; position 27 - pattern 22
	db	64

	; 07:  Stopa / 02|Dirty Kick
	; position 7 - pattern 7
	db	-2,192,4,4,5
	; position 11 - pattern 11
	db	-1,243
	; position 12 - pattern 12
	db	64,3,3,3,3,3,1,2,2,2,10,3,3,3,3,3,1,2,2,2
	; position 13 - pattern 13
	db	10,3,3,3,3,3,1,2,2,2,10,3,3,3,3,3,1,2,2,2
	; position 14 - pattern 12
	db	10,3,3,3,3,3,1,2,2,2,10,3,3,3,3,3,1,2,2,2
	; position 15 - pattern 14
	db	10,3,3,3,3,3,1,2,2,2,10,3,3,3,3,3,1,2,2,2
	; position 16 - pattern 15
	db	10,3,3,3,3,3,1,2,2,2,10,3,3,3,3,3,1,2,2,2
	; position 17 - pattern 16
	db	10,3,3,3,3,3,1,2,2,2,10,3,3,3,3,3,1,2,2,2
	; position 18 - pattern 15
	db	10,3,3,3,3,3,1,2,2,2,10,3,3,3,3,3,1,2,2,2
	; position 19 - pattern 17
	db	10,3,3,3,3,3,1,2,2,2,10,3,3,3,3,3,1,2,2,2,6
	; position 20 - pattern 18
	db	4,6,12,4,10,6,12,4,4
	; position 21 - pattern 18
	db	6,6,12,4,10,6,12,4,4
	; position 22 - pattern 19
	db	6,6,12,4,10,6,12,4,4
	; position 23 - pattern 19
	db	6,6,12,4,10,6,12,4,4
	; position 24 - pattern 20
	db	6,6,12,4,10,6,12,4,4
	; position 25 - pattern 20
	db	6,6,12,4,10,6,12,4,4
	; position 26 - pattern 21
	db	6,6,12,4,10,6,12,4,4
	; position 27 - pattern 22
	db	6,6,12,4,10,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2

	; 08:  Stopa / 09|Transient Kick
	; position 32 - pattern 27
	db	-9,0,4,4,4,4,4,4,4
	; position 33 - pattern 28
	db	36,4,4,4,4,4,4,4
	; position 34 - pattern 29
	db	36,4,4,4,4,4,4,4
	; position 35 - pattern 30
	db	36,4,4,4,4,4,4,4
	; position 36 - pattern 31
	db	36,4,4,4,4,4,4,4
	; position 37 - pattern 32
	db	36,4,4,4,4,4,4,4
	; position 38 - pattern 33
	db	36,4,4,4,4,4,4,4

	; 09:  Stopa / 10|Stick Kick
	; position 11 - pattern 11
	db	-3,192,4,4,4,4,4,4,4
	; position 12 - pattern 12
	db	36,3,3,3,3,2,1,1,2,2,2,10,3,3,3,3,2,1,1,2,2,2
	; position 13 - pattern 13
	db	10,3,3,3,3,2,1,1,2,2,2,10,3,3,3,3,2,1,1,2,2,2
	; position 14 - pattern 12
	db	10,3,3,3,3,2,1,1,2,2,2,10,3,3,3,3,2,1,1,2,2,2
	; position 15 - pattern 14
	db	10,3,3,3,3,2,1,1,2,2,2,10,3,3,3,3,2,1,1,2,2,2
	; position 16 - pattern 15
	db	10,3,3,3,3,2,1,1,2,2,2,10,3,3,3,3,2,1,1,2,2,2
	; position 17 - pattern 16
	db	10,3,3,3,3,2,1,1,2,2,2,10,3,3,3,3,2,1,1,2,2,2
	; position 18 - pattern 15
	db	10,3,3,3,3,2,1,1,2,2,2,10,3,3,3,3,2,1,1,2,2,2
	; position 19 - pattern 17
	db	10,3,3,3,3,2,1,1,2,2,2,10,3,3,3,3,2,1,1,2,2,2,6
	; position 20 - pattern 18
	db	4,4,2,4,4,4,4,4,4,2,4,2,4,4,4,4,4,4
	; position 21 - pattern 18
	db	2,4,2,4,4,4,4,4,4,2,4,2,4,4,4,4,4,4
	; position 22 - pattern 19
	db	2,4,2,4,4,4,4,4,4,2,4,2,4,4,4,4,4,4
	; position 23 - pattern 19
	db	2,4,2,4,4,4,4,4,4,2,4,2,4,4,4,4,4,4
	; position 24 - pattern 20
	db	2,4,2,4,4,4,4,4,4,2,4,2,4,4,4,4,4,4
	; position 25 - pattern 20
	db	2,4,2,4,4,4,4,4,4,2,4,2,4,4,4,4,4,4
	; position 26 - pattern 21
	db	2,4,2,4,4,4,4,4,4,2,4,2,4,4,4,4,4,4
	; position 27 - pattern 22
	db	2,4,2,4,4,4,4,4,4,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2

	; 10:  Stopa / 02|Dirty Kick
	; position 32 - pattern 27
	db	-9,0,4,4,4,4,4,4,4
	; position 33 - pattern 28
	db	36,4,4,4,4,4,4,4
	; position 34 - pattern 29
	db	36,4,4,4,4,4,4,4
	; position 35 - pattern 30
	db	36,4,4,4,4,4,4,4
	; position 36 - pattern 31
	db	36,4,4,4,4,4,4,4
	; position 37 - pattern 32
	db	36,4,4,4,4,4,4,4
	; position 38 - pattern 33
	db	36,4,4,4,4,4,4,4

	; 11:  Werbel / 03|Dirty Snare
	; position 12 - pattern 12
	db	-4,24,32
	; position 13 - pattern 13
	db	32,32
	; position 14 - pattern 12
	db	32,32
	; position 15 - pattern 14
	db	32,32,2,2,2
	; position 16 - pattern 15
	db	26,32
	; position 17 - pattern 16
	db	32,32
	; position 18 - pattern 15
	db	32,32
	; position 19 - pattern 17
	db	32,32,2,4
	; position 20 - pattern 18
	db	14,14,2,2,14,12,2,2,2
	; position 21 - pattern 18
	db	14,14,2,2,14,12,2,2,2
	; position 22 - pattern 19
	db	14,14,2,2,14,12,2,2,2
	; position 23 - pattern 19
	db	14,14,2,2,14,12,2,2,2
	; position 24 - pattern 20
	db	14,14,2,2,14,12,2,2,2
	; position 25 - pattern 20
	db	14,14,2,2,14,12,2,2,2
	; position 26 - pattern 21
	db	14,14,2,2,14,12,2,2,2
	; position 27 - pattern 22
	db	14,14,2,2

	; 12:  Werbel / 05|Snare Reverb
	; position 20 - pattern 18
	db	-6,24
	; position 21 - pattern 18
	db	64
	; position 22 - pattern 19
	db	64
	; position 23 - pattern 19
	db	64
	; position 24 - pattern 20
	db	64
	; position 25 - pattern 20
	db	64
	; position 26 - pattern 21
	db	64
	; position 27 - pattern 22
	db	64
	; position 32 - pattern 27
	db	-2,56,4,4,4,20,4,4,4
	; position 33 - pattern 28
	db	20,4,4,4,20,4,4,4
	; position 34 - pattern 29
	db	20,4,4,4,20,4,4,4
	; position 35 - pattern 30
	db	20,4,4,4,20,4,4,4
	; position 36 - pattern 31
	db	20,4,4,4,20,4,4,4
	; position 37 - pattern 32
	db	20,4,4,4,20,4,4,4
	; position 38 - pattern 33
	db	20,4,4,4,20,4,4,4

	; 13:  Werbel / 04|Noisy Snare
	; position 12 - pattern 12
	db	-4,24,32
	; position 13 - pattern 13
	db	32,32,6
	; position 14 - pattern 12
	db	26,32
	; position 15 - pattern 14
	db	32,31,1,2,2,2
	; position 16 - pattern 15
	db	26,32
	; position 17 - pattern 16
	db	32,32,6
	; position 18 - pattern 15
	db	26,32
	; position 19 - pattern 17
	db	32,32,2,4
	; position 20 - pattern 18
	db	26,2,2,2,14
	; position 21 - pattern 18
	db	44,2,2,2,14
	; position 22 - pattern 19
	db	44,2,2,2,14,12
	; position 23 - pattern 19
	db	32,2,2,2,14,12
	; position 24 - pattern 20
	db	32,2,2,2,14,12
	; position 25 - pattern 20
	db	32,2,2,2,14,12
	; position 26 - pattern 21
	db	32,2,2,2,14,12
	; position 27 - pattern 22
	db	32,2,2,2

	; 14:  Werbel / 05|Snare Reverb
	; position 12 - pattern 12
	db	-4,0,2,22,2,2,2,2,2,22,2,2,2
	; position 13 - pattern 13
	db	26,2,2,2,26,2,2,2
	; position 14 - pattern 12
	db	2,2,22,2,2,2,2,2,22,2,2,2
	; position 15 - pattern 14
	db	26,2,2,2,26,2,2,2
	; position 16 - pattern 15
	db	2,2,22,2,2,2,2,2,22,2,2,2
	; position 17 - pattern 16
	db	26,2,2,2,26,2,2,2
	; position 18 - pattern 15
	db	2,2,22,2,2,2,2,2,22,2,2,2
	; position 19 - pattern 17
	db	26,2,2,2,26,2,2,2
	; position 20 - pattern 18
	db	14,12,2,2,2,14,4,4,4,2,2,2
	; position 21 - pattern 18
	db	14,12,2,2,2,14,4,4,4,2,2,2
	; position 22 - pattern 19
	db	14,12,2,2,2,14,4,4,4,2,2,2
	; position 23 - pattern 19
	db	14,12,2,2,2,14,4,4,4,2,2,2
	; position 24 - pattern 20
	db	14,12,2,2,2,14,4,4,4,2,2,2
	; position 25 - pattern 20
	db	14,12,2,2,2,14,4,4,4,2,2,2
	; position 26 - pattern 21
	db	14,12,2,2,2,14,4,4,4,2,2,2
	; position 27 - pattern 22
	db	14,12,2,2,2

	; 15:  Hihat / 06|Rezo Hihat
	; position 12 - pattern 12
	db	-4,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 13 - pattern 13
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 14 - pattern 12
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 15 - pattern 14
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 16 - pattern 15
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 17 - pattern 16
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 18 - pattern 15
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 19 - pattern 17
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 20 - pattern 18
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 21 - pattern 18
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 22 - pattern 19
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 23 - pattern 19
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 24 - pattern 20
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 25 - pattern 20
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 26 - pattern 21
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 27 - pattern 22
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2

	; 16:  Hihat / 07|Shaker
	; position 12 - pattern 12
	db	-4,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 13 - pattern 13
	db	4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 14 - pattern 12
	db	4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 15 - pattern 14
	db	4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 16 - pattern 15
	db	4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 17 - pattern 16
	db	4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 18 - pattern 15
	db	4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 19 - pattern 17
	db	4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 20 - pattern 18
	db	4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 21 - pattern 18
	db	4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 22 - pattern 19
	db	4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 23 - pattern 19
	db	4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 24 - pattern 20
	db	4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 25 - pattern 20
	db	4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 26 - pattern 21
	db	4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
	; position 27 - pattern 22
	db	4,4,4,4,4,4,4,4,4,4,4,4

	; 17:  Plucki / 08|FM Pluck
	; position 12 - pattern 12
	db	-4,8,36
	; position 13 - pattern 13
	db	24,20
	; position 14 - pattern 12
	db	48,36
	; position 15 - pattern 14
	db	24,20
	; position 16 - pattern 15
	db	48,36
	; position 17 - pattern 16
	db	24,20
	; position 18 - pattern 15
	db	48,36
	; position 19 - pattern 17
	db	24,20
	; position 22 - pattern 19
	db	-1,170,2,2,6,4,4,4,4,6,2,2,6,2,2,2,2,2,2
	; position 23 - pattern 19
	db	10,2,2,6,4,4,4,4,6,2,2,6,2,2,2,2,2,2
	; position 24 - pattern 20
	db	10,2,2,6,4,4,4,4,6,2,2,6,2,2,2,2,2,2
	; position 25 - pattern 20
	db	10,2,2,6,4,4,4,4,6,2,2,6,2,2,2,2,2,2
	; position 26 - pattern 21
	db	10,2,2,6,4,4,4,4,6,2,2,6,2,2,2,2,2,2
	; position 27 - pattern 22
	db	10,2,2,6,4,4,4,4,6,2,2

	; 18:  Plucki / 08|FM Pluck
	; position 12 - pattern 12
	db	-4,10,38
	; position 13 - pattern 13
	db	24,36
	; position 14 - pattern 12
	db	30,38
	; position 15 - pattern 14
	db	24,36
	; position 16 - pattern 15
	db	30,38
	; position 17 - pattern 16
	db	24,36
	; position 18 - pattern 15
	db	30,38
	; position 19 - pattern 17
	db	24,36

	; 19:  Plucki / 08|FM Pluck
	; position 12 - pattern 12
	db	-4,12,40
	; position 13 - pattern 13
	db	24
	; position 14 - pattern 12
	db	64,40
	; position 15 - pattern 14
	db	24
	; position 16 - pattern 15
	db	64,40
	; position 17 - pattern 16
	db	24
	; position 18 - pattern 15
	db	64,40
	; position 19 - pattern 17
	db	24

	; 20:  Plucki / 08|FM Pluck
	; position 13 - pattern 13
	db	-4,80
	; position 15 - pattern 14
	db	-1,128
	; position 17 - pattern 16
	db	-1,128
	; position 19 - pattern 17
	db	-1,128

	; 21:  Plucki / 08|FM Pluck
	; position 13 - pattern 13
	db	-4,84
	; position 15 - pattern 14
	db	-1,128
	; position 17 - pattern 16
	db	-1,128
	; position 19 - pattern 17
	db	-1,128

	; 22:  Percussions / 0A|Square Perc
	; position 12 - pattern 12
	db	-4,2,6,6,4,6,6,4,6,6,4,6,6
	; position 13 - pattern 13
	db	4,6,6,4,6,6,4,6,6,4,6,6
	; position 14 - pattern 12
	db	4,6,6,4,6,6,4,6,6,4,6,6
	; position 15 - pattern 14
	db	4,6,6,4,6,6,4,6,6,4,6,6
	; position 16 - pattern 15
	db	4,6,6,4,6,6,4,6,6,4,6,6
	; position 17 - pattern 16
	db	4,6,6,4,6,6,4,6,6,4,6,6
	; position 18 - pattern 15
	db	4,6,6,4,6,6,4,6,6,4,6,6
	; position 19 - pattern 17
	db	4,6,6,4,6,6,4,6,6,4,6,6
	; position 20 - pattern 18
	db	4,6,6,4,6,6,4,6,6,4,6,6
	; position 21 - pattern 18
	db	4,6,6,4,6,6,4,6,6,4,6,6
	; position 22 - pattern 19
	db	4,6,6,4,6,6,4,6,6,4,6,6
	; position 23 - pattern 19
	db	4,6,6,4,6,6,4,6,6,4,6,6
	; position 24 - pattern 20
	db	4,6,6,4,6,6,4,6,6,4,6,6
	; position 25 - pattern 20
	db	4,6,6,4,6,6,4,6,6,4,6,6
	; position 26 - pattern 21
	db	4,6,6,4,6,6,4,6,6,4,6,6
	; position 27 - pattern 22
	db	4,6,6,4,6,6,4,6,6,4,6

	; 23:  Percussions / 0A|Square Perc
	; position 12 - pattern 12
	db	-4,4,6,6,4,6,6,4,6,6,4,6
	; position 13 - pattern 13
	db	10,6,6,4,6,6,4,6,6,4,6
	; position 14 - pattern 12
	db	10,6,6,4,6,6,4,6,6,4,6
	; position 15 - pattern 14
	db	10,6,6,4,6,6,4,6,6,4,6
	; position 16 - pattern 15
	db	10,6,6,4,6,6,4,6,6,4,6
	; position 17 - pattern 16
	db	10,6,6,4,6,6,4,6,6,4,6
	; position 18 - pattern 15
	db	10,6,6,4,6,6,4,6,6,4,6
	; position 19 - pattern 17
	db	10,6,6,4,6,6,4,6,6,4,6
	; position 20 - pattern 18
	db	10,6,6,4,6,6,4,6,6,4,6
	; position 21 - pattern 18
	db	10,6,6,4,6,6,4,6,6,4,6
	; position 22 - pattern 19
	db	10,6,6,4,6,6,4,6,6,4,6
	; position 23 - pattern 19
	db	10,6,6,4,6,6,4,6,6,4,6
	; position 24 - pattern 20
	db	10,6,6,4,6,6,4,6,6,4,6
	; position 25 - pattern 20
	db	10,6,6,4,6,6,4,6,6,4,6
	; position 26 - pattern 21
	db	10,6,6,4,6,6,4,6,6,4,6
	; position 27 - pattern 22
	db	10,6,6,4,6,6,4,6,6,4

	; 24:  Pady / 0D|Pady
	; position 3 - pattern 3
	db	-1,192,32
	; position 4 - pattern 4
	db	32,32
	; position 5 - pattern 5
	db	32,32
	; position 6 - pattern 6
	db	32,32
	; position 7 - pattern 7
	db	32,32
	; position 8 - pattern 8
	db	32,32
	; position 9 - pattern 9
	db	32,32
	; position 10 - pattern 10
	db	32,32
	; position 16 - pattern 15
	db	-2,96,32
	; position 17 - pattern 16
	db	32,32
	; position 18 - pattern 15
	db	32,32
	; position 19 - pattern 17
	db	32,32
	; position 24 - pattern 20
	db	-2,32
	; position 25 - pattern 20
	db	64
	; position 26 - pattern 21
	db	64
	; position 27 - pattern 22
	db	64,32
	; position 28 - pattern 23
	db	32,32
	; position 29 - pattern 24
	db	32,32
	; position 30 - pattern 25
	db	32,32
	; position 31 - pattern 26
	db	32,32
	; position 32 - pattern 27
	db	32,32
	; position 33 - pattern 28
	db	32,32
	; position 34 - pattern 29
	db	32,32
	; position 35 - pattern 30
	db	32,32
	; position 36 - pattern 31
	db	32,32
	; position 37 - pattern 32
	db	32
	; position 38 - pattern 33
	db	64

	; 25:  Pady / 0D|Pady
	; position 3 - pattern 3
	db	-1,192,32
	; position 4 - pattern 4
	db	32,32
	; position 5 - pattern 5
	db	32,32
	; position 6 - pattern 6
	db	32,32
	; position 7 - pattern 7
	db	32,32
	; position 8 - pattern 8
	db	32,32
	; position 9 - pattern 9
	db	32,32
	; position 10 - pattern 10
	db	32,32
	; position 16 - pattern 15
	db	-2,96,32
	; position 17 - pattern 16
	db	32,32
	; position 18 - pattern 15
	db	32,32
	; position 19 - pattern 17
	db	32,32
	; position 24 - pattern 20
	db	-2,32
	; position 25 - pattern 20
	db	64
	; position 26 - pattern 21
	db	64
	; position 27 - pattern 22
	db	64,32
	; position 28 - pattern 23
	db	32,32
	; position 29 - pattern 24
	db	32,32
	; position 30 - pattern 25
	db	32,32
	; position 31 - pattern 26
	db	32,32
	; position 32 - pattern 27
	db	32,32
	; position 33 - pattern 28
	db	32,32
	; position 34 - pattern 29
	db	32,32
	; position 35 - pattern 30
	db	32,32
	; position 36 - pattern 31
	db	32,32
	; position 37 - pattern 32
	db	32
	; position 38 - pattern 33
	db	64

	; 26:  Pady / 0D|Pady
	; position 3 - pattern 3
	db	-1,192,32
	; position 4 - pattern 4
	db	32,32
	; position 5 - pattern 5
	db	32,32
	; position 6 - pattern 6
	db	32,32
	; position 7 - pattern 7
	db	32,32
	; position 8 - pattern 8
	db	32,32
	; position 9 - pattern 9
	db	32,32
	; position 10 - pattern 10
	db	32,32
	; position 16 - pattern 15
	db	-2,96,32
	; position 17 - pattern 16
	db	32,32
	; position 18 - pattern 15
	db	32,32
	; position 19 - pattern 17
	db	32,32
	; position 24 - pattern 20
	db	-2,32
	; position 25 - pattern 20
	db	64
	; position 26 - pattern 21
	db	64
	; position 27 - pattern 22
	db	64,32
	; position 28 - pattern 23
	db	32,32
	; position 29 - pattern 24
	db	32,32
	; position 30 - pattern 25
	db	32,32
	; position 31 - pattern 26
	db	32,32
	; position 32 - pattern 27
	db	32,32
	; position 33 - pattern 28
	db	32,32
	; position 34 - pattern 29
	db	32,32
	; position 35 - pattern 30
	db	32,32
	; position 36 - pattern 31
	db	32,32
	; position 37 - pattern 32
	db	32
	; position 38 - pattern 33
	db	64

	; 27:  Pady / 0D|Pady
	; position 3 - pattern 3
	db	-1,192,32
	; position 4 - pattern 4
	db	32,32
	; position 5 - pattern 5
	db	32,32
	; position 6 - pattern 6
	db	32,32
	; position 7 - pattern 7
	db	32,32
	; position 8 - pattern 8
	db	32,32
	; position 9 - pattern 9
	db	32,32
	; position 10 - pattern 10
	db	32,32
	; position 16 - pattern 15
	db	-2,96,32
	; position 17 - pattern 16
	db	32,32
	; position 18 - pattern 15
	db	32,32
	; position 19 - pattern 17
	db	32,32
	; position 24 - pattern 20
	db	-2,32
	; position 25 - pattern 20
	db	64
	; position 26 - pattern 21
	db	64
	; position 27 - pattern 22
	db	64,32
	; position 28 - pattern 23
	db	32,32
	; position 29 - pattern 24
	db	32,32
	; position 30 - pattern 25
	db	32,32
	; position 31 - pattern 26
	db	32,32
	; position 32 - pattern 27
	db	32,32
	; position 33 - pattern 28
	db	32,32
	; position 34 - pattern 29
	db	32,32
	; position 35 - pattern 30
	db	32,32
	; position 36 - pattern 31
	db	32,32
	; position 37 - pattern 32
	db	32
	; position 38 - pattern 33
	db	64

	; 28:  Pady / 0D|Pady
	; position 9 - pattern 9
	db	-3,64,32
	; position 10 - pattern 10
	db	32,32
	; position 16 - pattern 15
	db	-2,96,32
	; position 17 - pattern 16
	db	32,32
	; position 18 - pattern 15
	db	32,32
	; position 19 - pattern 17
	db	32,32
	; position 24 - pattern 20
	db	-2,32
	; position 25 - pattern 20
	db	64
	; position 26 - pattern 21
	db	64
	; position 27 - pattern 22
	db	64,32
	; position 28 - pattern 23
	db	32,32
	; position 29 - pattern 24
	db	32,32
	; position 30 - pattern 25
	db	32,32
	; position 31 - pattern 26
	db	32,32
	; position 32 - pattern 27
	db	32,32
	; position 33 - pattern 28
	db	32,32
	; position 34 - pattern 29
	db	32,32
	; position 35 - pattern 30
	db	32,32
	; position 36 - pattern 31
	db	32,32
	; position 37 - pattern 32
	db	32
	; position 38 - pattern 33
	db	64

	; 29:  Pady / 0D|Pady
	; position 9 - pattern 9
	db	-3,64,32
	; position 10 - pattern 10
	db	32,32
	; position 16 - pattern 15
	db	-2,96,32
	; position 17 - pattern 16
	db	32,32
	; position 18 - pattern 15
	db	32,32
	; position 19 - pattern 17
	db	32,32
	; position 24 - pattern 20
	db	-2,32
	; position 25 - pattern 20
	db	64
	; position 26 - pattern 21
	db	64
	; position 27 - pattern 22
	db	64,32
	; position 28 - pattern 23
	db	32,32
	; position 29 - pattern 24
	db	32,32
	; position 30 - pattern 25
	db	32,32
	; position 31 - pattern 26
	db	32,32
	; position 32 - pattern 27
	db	32,32
	; position 33 - pattern 28
	db	32,32
	; position 34 - pattern 29
	db	32,32
	; position 35 - pattern 30
	db	32,32
	; position 36 - pattern 31
	db	32,32
	; position 37 - pattern 32
	db	32
	; position 38 - pattern 33
	db	64

	; 30:  Pady / 0D|Pady
	; position 9 - pattern 9
	db	-3,64,32
	; position 10 - pattern 10
	db	32,32
	; position 16 - pattern 15
	db	-2,96,32
	; position 17 - pattern 16
	db	32,32
	; position 18 - pattern 15
	db	32,32
	; position 19 - pattern 17
	db	32,32
	; position 24 - pattern 20
	db	-2,32
	; position 25 - pattern 20
	db	64
	; position 26 - pattern 21
	db	64
	; position 27 - pattern 22
	db	64,32
	; position 28 - pattern 23
	db	32,32
	; position 29 - pattern 24
	db	32,32
	; position 30 - pattern 25
	db	32,32
	; position 31 - pattern 26
	db	32,32

	; 31:  Pady / 0D|Pady
	; position 9 - pattern 9
	db	-3,64,32
	; position 10 - pattern 10
	db	32,32
	; position 16 - pattern 15
	db	-2,96,32
	; position 17 - pattern 16
	db	32,32
	; position 18 - pattern 15
	db	32,32
	; position 19 - pattern 17
	db	32,32
	; position 24 - pattern 20
	db	-2,32
	; position 25 - pattern 20
	db	64
	; position 26 - pattern 21
	db	64
	; position 27 - pattern 22
	db	64,32

	; 32:  Rising / 0E|Rising Mod
	; position 5 - pattern 5
	db	-2,64
	; position 32 - pattern 27
	db	-7,192

	; 33:  Low Droplets / 0F|LFO Drop
	; position 0 - pattern 0
	db	32
	; position 3 - pattern 3
	db	-1,160
	; position 10 - pattern 10
	db	-2,224
	; position 11 - pattern 11
	db	80
	; position 16 - pattern 15
	db	-2,24
	; position 18 - pattern 15
	db	-1,128
	; position 19 - pattern 17
	db	104
	; position 27 - pattern 22
	db	-2,240

	; 34:  Low Droplets / 0F|LFO Drop
	; position 0 - pattern 0
	db	38
	; position 3 - pattern 3
	db	-1,160
	; position 5 - pattern 5
	db	124
	; position 27 - pattern 22
	db	-6,162

	; 35:  Low Droplets / 0F|LFO Drop
	; position 0 - pattern 0
	db	44
	; position 3 - pattern 3
	db	-1,160
	; position 5 - pattern 5
	db	120

	; 36:  Low Droplets / 0F|LFO Drop
	; position 0 - pattern 0
	db	34

	; 37:  Rings / 11|Rings
	; position 5 - pattern 5
	db	-2,64
	; position 9 - pattern 9
	db	-2,0,16,16,8,8
	; position 10 - pattern 10
	db	16,16,16
	; position 11 - pattern 11
	db	80
	; position 19 - pattern 17
	db	-3,0
	; position 27 - pattern 22
	db	-3,0
	; position 30 - pattern 25
	db	-1,144
	; position 31 - pattern 26
	db	64,32
	; position 37 - pattern 32
	db	-2,96
	; position 38 - pattern 33
	db	64
	; position 39 - pattern 34
	db	64
	; position 40 - pattern 40
	db	64

	; 38:  Rings / 12|#Rings
	; position 32 - pattern 27
	db	-9,32,4,4,4,4,4,4,4
	; position 33 - pattern 28
	db	36,4,4,4,4,4,4,4
	; position 34 - pattern 29
	db	36,4,4,4,4,4,4,4
	; position 35 - pattern 30
	db	36,4,4,4,4,4,4,4
	; position 36 - pattern 31
	db	36,4,4,4,4,4,4,4
	; position 37 - pattern 32
	db	36,4,4,4,4,4,4,4
	; position 38 - pattern 33
	db	36,4,4,4,4,4,4,4

	; 39:  Rings / 11|Rings
	; position 9 - pattern 9
	db	-3,68,32
	; position 10 - pattern 10
	db	32
	; position 11 - pattern 11
	db	112
	; position 27 - pattern 22
	db	-4,253
	; position 30 - pattern 25
	db	-1,147
	; position 31 - pattern 26
	db	64,32
	; position 37 - pattern 32
	db	-2,96
	; position 38 - pattern 33
	db	64
	; position 39 - pattern 34
	db	64

	; 40:  Rings / 12|#Rings
	; position 32 - pattern 27
	db	-9,34,4,4,4,4,4,4,4
	; position 33 - pattern 28
	db	36,4,4,4,4,4,4,4
	; position 34 - pattern 29
	db	36,4,4,4,4,4,4,4
	; position 35 - pattern 30
	db	36,4,4,4,4,4,4,4
	; position 36 - pattern 31
	db	36,4,4,4,4,4,4,4
	; position 37 - pattern 32
	db	36,4,4,4,4,4,4,4
	; position 38 - pattern 33
	db	36,4,4,4,4,4,4,4

	; 41:  Rings / 11|Rings
	; position 9 - pattern 9
	db	-3,72,30
	; position 10 - pattern 10
	db	34
	; position 11 - pattern 11
	db	112
	; position 27 - pattern 22
	db	-4,250
	; position 31 - pattern 26
	db	-1,246
	; position 39 - pattern 34
	db	-2,224

	; 42:  Rings / 12|#Rings
	; position 32 - pattern 27
	db	-9,32,4,4,4,4,4,4,4
	; position 33 - pattern 28
	db	36,4,4,4,4,4,4,4
	; position 34 - pattern 29
	db	36,4,4,4,4,4,4,4
	; position 35 - pattern 30
	db	36,4,4,4,4,4,4,4
	; position 36 - pattern 31
	db	36,4,4,4,4,4,4,4
	; position 37 - pattern 32
	db	36,4,4,4,4,4,4,4
	; position 38 - pattern 33
	db	36,4,4,4,4,4,4,4

	; 43:  Short Bass / 13|Short Bass
	; position 24 - pattern 20
	db	-7,0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 25 - pattern 20
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 26 - pattern 21
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 27 - pattern 22
	db	2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
	; position 32 - pattern 27
	db	-2,30,2,6,8,2,6,8,2,6,8,2,6
	; position 33 - pattern 28
	db	8,2,6,8,2,6,8,2,6,8,2,6
	; position 34 - pattern 29
	db	8,2,6,8,2,6,8,2,6,8,2,6
	; position 35 - pattern 30
	db	8,2,6,8,2,6,8,2,6,8,2,6
	; position 36 - pattern 31
	db	8,2,6,8,2,6,8,2,6,8,2,6
	; position 37 - pattern 32
	db	8,2,6,8,2,6,8,2,6,8,2,6
	; position 38 - pattern 33
	db	8,2,6,8,2,6,8,2,6,8,2,6

	; 44:  Sinus / 14|Sinus
	; position 28 - pattern 23
	db	-8,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 29 - pattern 24
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 30 - pattern 25
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 31 - pattern 26
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 32 - pattern 27
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 33 - pattern 28
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 34 - pattern 29
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 35 - pattern 30
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 36 - pattern 31
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 37 - pattern 32
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 38 - pattern 33
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 39 - pattern 34
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

	; 45:  Sinus / 14|Sinus
	; position 28 - pattern 23
	db	-8,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 29 - pattern 24
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 30 - pattern 25
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 31 - pattern 26
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 32 - pattern 27
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 33 - pattern 28
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 34 - pattern 29
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 35 - pattern 30
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 36 - pattern 31
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 37 - pattern 32
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 38 - pattern 33
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 39 - pattern 34
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

	; 46:  Sinus / 14|Sinus
	; position 28 - pattern 23
	db	-8,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 29 - pattern 24
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 30 - pattern 25
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 31 - pattern 26
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 32 - pattern 27
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 33 - pattern 28
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 34 - pattern 29
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 35 - pattern 30
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 36 - pattern 31
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 37 - pattern 32
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 38 - pattern 33
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; position 39 - pattern 34
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

	; 47:  Solo / 15|Solo
	; position 34 - pattern 29
	db	-9,128,1,11,8,4,4,1,7,4,12
	; position 35 - pattern 30
	db	12,1,3,2,4,4,1,17,1,11
	; position 36 - pattern 31
	db	20,1,11,8,4,4,1,11,12
	; position 37 - pattern 32
	db	12,1,3,2,4,4,1,1
	; position 38 - pattern 33
	db	48,1,3,2,4,4,1,1

	; 48:  Solo / 15|Solo
	; position 34 - pattern 29
	db	-9,132,1,11,8,4,4,1,7,4,12
	; position 35 - pattern 30
	db	12,1,3,2,4,4,1,17,1,11
	; position 36 - pattern 31
	db	20,1,11,8,4,4,1,11,12
	; position 37 - pattern 32
	db	12,1,3,2,4,4,1,1
	; position 38 - pattern 33
	db	48,1,3,2,4,4,1,1

	; 49:  Solo / 15|Solo
	; position 34 - pattern 29
	db	-9,136,1,11,8,4,4,1,7,4,12
	; position 35 - pattern 30
	db	12,1,3,2,4,4,1,17,1,11
	; position 36 - pattern 31
	db	20,1,11,8,4,4,1,11,12
	; position 37 - pattern 32
	db	12,1,3,2,4,4,1,1
	; position 38 - pattern 33
	db	48,1,3,2,4,4,1,1


	section notesamp data align=1

_NoteSamples:
	; 00:  Lo Pad / 0B|Lo Pad
	; position 0 - pattern 0
	db	4
	; position 1 - pattern 1
	db	10,9
	; position 2 - pattern 2
	db	8,11
	; position 3 - pattern 3
	db	5,9
	; position 4 - pattern 4
	db	8,11
	; position 5 - pattern 5
	db	5,9
	; position 6 - pattern 6
	db	8,11
	; position 7 - pattern 7
	db	10,9
	; position 8 - pattern 8
	db	12,11
	; position 9 - pattern 9
	db	1,2
	; position 10 - pattern 10
	db	6,5
	; position 28 - pattern 23
	db	1,0
	; position 29 - pattern 24
	db	5,3
	; position 30 - pattern 25
	db	1,0
	; position 31 - pattern 26
	db	8,7
	db	-1

	; 01:  Lo Pad / 0C|Instant Lo Pad
	; position 11 - pattern 11
	db	0
	; position 12 - pattern 12
	db	21,19
	; position 13 - pattern 13
	db	12,16,18
	; position 14 - pattern 12
	db	21,19
	; position 15 - pattern 14
	db	17,20,13
	; position 16 - pattern 15
	db	21,19
	; position 17 - pattern 16
	db	12,16,18
	; position 18 - pattern 15
	db	21,19
	; position 19 - pattern 17
	db	17,20,13
	; position 20 - pattern 18
	db	1
	; position 21 - pattern 18
	db	1
	; position 22 - pattern 19
	db	1
	; position 23 - pattern 19
	db	1
	; position 24 - pattern 20
	db	1
	; position 25 - pattern 20
	db	1
	; position 26 - pattern 21
	db	11
	; position 27 - pattern 22
	db	1,14,5,3
	; position 32 - pattern 27
	db	17,15
	; position 33 - pattern 28
	db	12,6
	; position 34 - pattern 29
	db	17,15
	; position 35 - pattern 30
	db	12,6
	; position 36 - pattern 31
	db	2,4
	; position 37 - pattern 32
	db	10
	; position 38 - pattern 33
	db	14,9,8,7
	db	-1

	; 02:  Lo Pad / 0B|Lo Pad
	; position 0 - pattern 0
	db	4
	; position 1 - pattern 1
	db	10,9
	; position 2 - pattern 2
	db	8,11
	; position 3 - pattern 3
	db	5,9
	; position 4 - pattern 4
	db	8,11
	; position 5 - pattern 5
	db	5,9
	; position 6 - pattern 6
	db	8,11
	; position 7 - pattern 7
	db	10,9
	; position 8 - pattern 8
	db	12,11
	; position 9 - pattern 9
	db	1,2
	; position 10 - pattern 10
	db	6,5
	; position 28 - pattern 23
	db	1,0
	; position 29 - pattern 24
	db	5,3
	; position 30 - pattern 25
	db	1,0
	; position 31 - pattern 26
	db	8,7
	db	-1

	; 03:  Lo Pad / 0C|Instant Lo Pad
	; position 11 - pattern 11
	db	6
	; position 12 - pattern 12
	db	30,28
	; position 13 - pattern 13
	db	20,25,27
	; position 14 - pattern 12
	db	30,28
	; position 15 - pattern 14
	db	26,29,21
	; position 16 - pattern 15
	db	30,28
	; position 17 - pattern 16
	db	20,25,27
	; position 18 - pattern 15
	db	30,28
	; position 19 - pattern 17
	db	26,29,21
	; position 20 - pattern 18
	db	7,5,4,3,2,1,0
	; position 21 - pattern 18
	db	7,5,4,3,2,1,0
	; position 22 - pattern 19
	db	7,5,4,3,2,1,0
	; position 23 - pattern 19
	db	7,5,4,3,2,1,0
	; position 24 - pattern 20
	db	7,5,4,3,2,1,0
	; position 25 - pattern 20
	db	7,5,4,3,2,1,0
	; position 26 - pattern 21
	db	22,18,17,16,15,14,13
	; position 27 - pattern 22
	db	7,5,4,3,23,11,9
	; position 32 - pattern 27
	db	26,24
	; position 33 - pattern 28
	db	20,12
	; position 34 - pattern 29
	db	26,24
	; position 35 - pattern 30
	db	20,12
	; position 36 - pattern 31
	db	8,10
	; position 37 - pattern 32
	db	19
	; position 38 - pattern 33
	db	23,18,17,16
	db	-1

	; 04:  Bassline / 01|Distort Bass
	; position 11 - pattern 11
	db	16,2,16,3,15
	; position 20 - pattern 18
	db	1
	; position 21 - pattern 18
	db	1
	; position 22 - pattern 19
	db	1
	; position 23 - pattern 19
	db	1
	; position 24 - pattern 20
	db	1
	; position 25 - pattern 20
	db	1
	; position 26 - pattern 21
	db	10
	; position 27 - pattern 22
	db	1,11,19,17
	; position 28 - pattern 23
	db	13,9
	; position 29 - pattern 24
	db	14,0
	; position 30 - pattern 25
	db	13,9
	; position 31 - pattern 26
	db	18,5
	; position 32 - pattern 27
	db	13,12
	; position 33 - pattern 28
	db	9,7
	; position 34 - pattern 29
	db	13,12
	; position 35 - pattern 30
	db	9,7
	; position 36 - pattern 31
	db	4,6
	; position 37 - pattern 32
	db	8
	db	-1

	; 05:  Bassline / 00|Prodigy Mod
	; position 11 - pattern 11
	db	0
	db	-1

	; 06:  Bassline / 00|Prodigy Mod
	; position 20 - pattern 18
	db	0
	; position 21 - pattern 18
	db	0
	; position 22 - pattern 19
	db	0
	; position 23 - pattern 19
	db	0
	; position 24 - pattern 20
	db	0
	; position 25 - pattern 20
	db	0
	; position 26 - pattern 21
	db	1
	; position 27 - pattern 22
	db	0
	db	-1

	; 07:  Stopa / 02|Dirty Kick
	; position 7 - pattern 7
	db	15,10,9,7
	; position 11 - pattern 11
	db	15
	; position 12 - pattern 12
	db	15,10,15,10,15,10,15,12,15,15,15,10,15,10,15,10,15,12,15,15
	; position 13 - pattern 13
	db	15,10,15,10,15,10,15,12,15,15,15,10,15,10,15,10,15,12,15,15
	; position 14 - pattern 12
	db	15,10,15,10,15,10,15,12,15,15,15,10,15,10,15,10,15,12,15,15
	; position 15 - pattern 14
	db	15,10,15,10,15,10,15,12,15,15,15,10,15,10,15,10,15,12,15,15
	; position 16 - pattern 15
	db	15,10,15,10,15,10,15,12,15,15,15,10,15,10,15,10,15,12,15,15
	; position 17 - pattern 16
	db	15,10,15,10,15,10,15,12,15,15,15,10,15,10,15,10,15,12,15,15
	; position 18 - pattern 15
	db	15,10,15,10,15,10,15,12,15,15,15,10,15,10,15,10,15,12,15,15
	; position 19 - pattern 17
	db	15,10,15,10,15,10,15,12,15,15,15,10,15,10,15,10,15,12,15,15,15
	; position 20 - pattern 18
	db	15,15,15,15,15,15,15,15,15
	; position 21 - pattern 18
	db	15,15,15,15,15,15,15,15,15
	; position 22 - pattern 19
	db	15,15,15,15,15,15,15,15,15
	; position 23 - pattern 19
	db	15,15,15,15,15,15,15,15,15
	; position 24 - pattern 20
	db	15,15,15,15,15,15,15,15,15
	; position 25 - pattern 20
	db	15,15,15,15,15,15,15,15,15
	; position 26 - pattern 21
	db	15,15,15,15,15,15,15,15,15
	; position 27 - pattern 22
	db	15,15,15,15,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0
	db	-1

	; 08:  Stopa / 09|Transient Kick
	; position 32 - pattern 27
	db	7,6,5,4,3,2,1,0
	; position 33 - pattern 28
	db	7,6,5,4,3,2,1,0
	; position 34 - pattern 29
	db	7,6,5,4,3,2,1,0
	; position 35 - pattern 30
	db	7,6,5,4,3,2,1,0
	; position 36 - pattern 31
	db	7,6,5,4,3,2,1,0
	; position 37 - pattern 32
	db	7,6,5,4,3,2,1,0
	; position 38 - pattern 33
	db	7,6,5,4,3,2,1,0
	db	-1

	; 09:  Stopa / 10|Stick Kick
	; position 11 - pattern 11
	db	15,12,10,9,7,3,1,0
	; position 12 - pattern 12
	db	15,10,15,10,15,15,10,15,12,15,15,15,10,15,10,15,15,10,15,12,15,15
	; position 13 - pattern 13
	db	15,10,15,10,15,15,10,15,12,15,15,15,10,15,10,15,15,10,15,12,15,15
	; position 14 - pattern 12
	db	15,10,15,10,15,15,10,15,12,15,15,15,10,15,10,15,15,10,15,12,15,15
	; position 15 - pattern 14
	db	15,10,15,10,15,15,10,15,12,15,15,15,10,15,10,15,15,10,15,12,15,15
	; position 16 - pattern 15
	db	15,10,15,10,15,15,10,15,12,15,15,15,10,15,10,15,15,10,15,12,15,15
	; position 17 - pattern 16
	db	15,10,15,10,15,15,10,15,12,15,15,15,10,15,10,15,15,10,15,12,15,15
	; position 18 - pattern 15
	db	15,10,15,10,15,15,10,15,12,15,15,15,10,15,10,15,15,10,15,12,15,15
	; position 19 - pattern 17
	db	15,10,15,10,15,15,10,15,12,15,15,15,10,15,10,15,15,10,15,12,15,15,15
	; position 20 - pattern 18
	db	15,10,15,10,9,15,15,10,9,15,15,15,10,9,15,15,15,10
	; position 21 - pattern 18
	db	15,10,15,10,9,15,15,10,9,15,15,15,10,9,15,15,15,10
	; position 22 - pattern 19
	db	15,10,15,10,9,15,15,10,9,15,15,15,10,9,15,15,15,10
	; position 23 - pattern 19
	db	15,10,15,10,9,15,15,10,9,15,15,15,10,9,15,15,15,10
	; position 24 - pattern 20
	db	15,10,15,10,9,15,15,10,9,15,15,15,10,9,15,15,15,10
	; position 25 - pattern 20
	db	15,10,15,10,9,15,15,10,9,15,15,15,10,9,15,15,15,10
	; position 26 - pattern 21
	db	15,10,15,10,9,15,15,10,9,15,15,15,10,9,15,15,15,10
	; position 27 - pattern 22
	db	15,10,15,10,9,15,15,10,9,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0
	db	-1

	; 10:  Stopa / 02|Dirty Kick
	; position 32 - pattern 27
	db	7,6,5,4,3,2,1,0
	; position 33 - pattern 28
	db	7,6,5,4,3,2,1,0
	; position 34 - pattern 29
	db	7,6,5,4,3,2,1,0
	; position 35 - pattern 30
	db	7,6,5,4,3,2,1,0
	; position 36 - pattern 31
	db	7,6,5,4,3,2,1,0
	; position 37 - pattern 32
	db	7,6,5,4,3,2,1,0
	; position 38 - pattern 33
	db	7,6,5,4,3,2,1,0
	db	-1

	; 11:  Werbel / 03|Dirty Snare
	; position 12 - pattern 12
	db	5,5
	; position 13 - pattern 13
	db	5,5
	; position 14 - pattern 12
	db	5,5
	; position 15 - pattern 14
	db	5,5,2,3,4
	; position 16 - pattern 15
	db	5,5
	; position 17 - pattern 16
	db	5,5
	; position 18 - pattern 15
	db	5,5
	; position 19 - pattern 17
	db	5,5,5,5
	; position 20 - pattern 18
	db	5,2,1,0,5,5,2,1,0
	; position 21 - pattern 18
	db	5,2,1,0,5,5,2,1,0
	; position 22 - pattern 19
	db	5,2,1,0,5,5,2,1,0
	; position 23 - pattern 19
	db	5,2,1,0,5,5,2,1,0
	; position 24 - pattern 20
	db	5,2,1,0,5,5,2,1,0
	; position 25 - pattern 20
	db	5,2,1,0,5,5,2,1,0
	; position 26 - pattern 21
	db	5,2,1,0,5,5,2,1,0
	; position 27 - pattern 22
	db	5,2,1,0
	db	-1

	; 12:  Werbel / 05|Snare Reverb
	; position 20 - pattern 18
	db	5
	; position 21 - pattern 18
	db	5
	; position 22 - pattern 19
	db	5
	; position 23 - pattern 19
	db	5
	; position 24 - pattern 20
	db	5
	; position 25 - pattern 20
	db	5
	; position 26 - pattern 21
	db	5
	; position 27 - pattern 22
	db	5
	; position 32 - pattern 27
	db	4,3,2,0,4,3,2,0
	; position 33 - pattern 28
	db	4,3,2,0,4,3,2,0
	; position 34 - pattern 29
	db	4,3,2,0,4,3,2,0
	; position 35 - pattern 30
	db	4,3,2,0,4,3,2,0
	; position 36 - pattern 31
	db	4,3,2,0,4,3,2,0
	; position 37 - pattern 32
	db	4,3,2,0,4,3,2,0
	; position 38 - pattern 33
	db	4,3,2,0,4,3,2,1
	db	-1

	; 13:  Werbel / 04|Noisy Snare
	; position 12 - pattern 12
	db	5,5
	; position 13 - pattern 13
	db	5,5,5
	; position 14 - pattern 12
	db	5,5
	; position 15 - pattern 14
	db	5,5,5,2,3,4
	; position 16 - pattern 15
	db	5,5
	; position 17 - pattern 16
	db	5,5,5
	; position 18 - pattern 15
	db	5,5
	; position 19 - pattern 17
	db	5,5,5,5
	; position 20 - pattern 18
	db	5,2,1,0,5
	; position 21 - pattern 18
	db	5,2,1,0,5
	; position 22 - pattern 19
	db	5,2,1,0,5,5
	; position 23 - pattern 19
	db	5,2,1,0,5,5
	; position 24 - pattern 20
	db	5,2,1,0,5,5
	; position 25 - pattern 20
	db	5,2,1,0,5,5
	; position 26 - pattern 21
	db	5,2,1,0,5,5
	; position 27 - pattern 22
	db	5,2,1,0
	db	-1

	; 14:  Werbel / 05|Snare Reverb
	; position 12 - pattern 12
	db	4,0,13,10,9,8,4,0,13,10,9,5
	; position 13 - pattern 13
	db	13,10,9,5,13,10,9,8
	; position 14 - pattern 12
	db	4,0,13,10,9,8,4,0,13,10,9,5
	; position 15 - pattern 14
	db	13,10,9,5,13,10,9,8
	; position 16 - pattern 15
	db	4,0,13,10,9,8,4,0,13,10,9,5
	; position 17 - pattern 16
	db	13,10,9,5,13,10,9,8
	; position 18 - pattern 15
	db	4,0,13,10,9,8,4,0,13,10,9,5
	; position 19 - pattern 17
	db	13,10,9,5,13,10,9,6
	; position 20 - pattern 18
	db	11,13,9,8,2,12,7,3,13,9,8,2
	; position 21 - pattern 18
	db	11,13,9,8,2,12,7,3,13,9,8,2
	; position 22 - pattern 19
	db	11,13,9,8,2,12,7,3,13,9,8,2
	; position 23 - pattern 19
	db	11,13,9,8,2,12,7,3,13,9,8,2
	; position 24 - pattern 20
	db	11,13,9,8,2,12,7,3,13,9,8,2
	; position 25 - pattern 20
	db	11,13,9,8,2,12,7,3,13,9,8,2
	; position 26 - pattern 21
	db	11,13,9,8,2,12,7,3,13,9,8,2
	; position 27 - pattern 22
	db	11,13,9,8,1
	db	-1

	; 15:  Hihat / 06|Rezo Hihat
	; position 12 - pattern 12
	db	3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2
	; position 13 - pattern 13
	db	3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2
	; position 14 - pattern 12
	db	3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2
	; position 15 - pattern 14
	db	3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2
	; position 16 - pattern 15
	db	3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2
	; position 17 - pattern 16
	db	3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2
	; position 18 - pattern 15
	db	3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2
	; position 19 - pattern 17
	db	3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2
	; position 20 - pattern 18
	db	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	; position 21 - pattern 18
	db	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	; position 22 - pattern 19
	db	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	; position 23 - pattern 19
	db	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	; position 24 - pattern 20
	db	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	; position 25 - pattern 20
	db	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	; position 26 - pattern 21
	db	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1
	; position 27 - pattern 22
	db	2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,0
	db	-1

	; 16:  Hihat / 07|Shaker
	; position 12 - pattern 12
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 13 - pattern 13
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 14 - pattern 12
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 15 - pattern 14
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 16 - pattern 15
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 17 - pattern 16
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 18 - pattern 15
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 19 - pattern 17
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 20 - pattern 18
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 21 - pattern 18
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 22 - pattern 19
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 23 - pattern 19
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 24 - pattern 20
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 25 - pattern 20
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 26 - pattern 21
	db	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2
	; position 27 - pattern 22
	db	0,2,0,2,0,2,0,2,0,2,0,1
	db	-1

	; 17:  Plucki / 08|FM Pluck
	; position 12 - pattern 12
	db	0,12
	; position 13 - pattern 13
	db	6,5
	; position 14 - pattern 12
	db	0,12
	; position 15 - pattern 14
	db	6,10
	; position 16 - pattern 15
	db	0,12
	; position 17 - pattern 16
	db	6,5
	; position 18 - pattern 15
	db	0,12
	; position 19 - pattern 17
	db	6,11
	; position 22 - pattern 19
	db	8,14,16,7,9,7,9,13,1,2,4,17,19,18,20,2,14,15
	; position 23 - pattern 19
	db	8,14,16,7,9,7,9,13,1,2,4,17,19,18,20,2,14,15
	; position 24 - pattern 20
	db	8,14,16,7,9,7,9,13,1,2,4,17,19,18,20,2,14,15
	; position 25 - pattern 20
	db	8,14,16,7,9,7,9,13,1,2,4,17,19,18,20,2,14,15
	; position 26 - pattern 21
	db	8,14,16,7,9,7,9,13,1,2,4,17,19,18,20,2,14,15
	; position 27 - pattern 22
	db	8,14,16,7,9,7,9,13,1,2,3
	db	-1

	; 18:  Plucki / 08|FM Pluck
	; position 12 - pattern 12
	db	0,4
	; position 13 - pattern 13
	db	3,1
	; position 14 - pattern 12
	db	0,4
	; position 15 - pattern 14
	db	3,1
	; position 16 - pattern 15
	db	0,4
	; position 17 - pattern 16
	db	3,1
	; position 18 - pattern 15
	db	0,4
	; position 19 - pattern 17
	db	3,2
	db	-1

	; 19:  Plucki / 08|FM Pluck
	; position 12 - pattern 12
	db	0,3
	; position 13 - pattern 13
	db	1
	; position 14 - pattern 12
	db	0,3
	; position 15 - pattern 14
	db	1
	; position 16 - pattern 15
	db	0,3
	; position 17 - pattern 16
	db	1
	; position 18 - pattern 15
	db	0,3
	; position 19 - pattern 17
	db	2
	db	-1

	; 20:  Plucki / 08|FM Pluck
	; position 13 - pattern 13
	db	0
	; position 15 - pattern 14
	db	1
	; position 17 - pattern 16
	db	0
	; position 19 - pattern 17
	db	2
	db	-1

	; 21:  Plucki / 08|FM Pluck
	; position 13 - pattern 13
	db	2
	; position 15 - pattern 14
	db	0
	; position 17 - pattern 16
	db	2
	; position 19 - pattern 17
	db	1
	db	-1

	; 22:  Percussions / 0A|Square Perc
	; position 12 - pattern 12
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 13 - pattern 13
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 14 - pattern 12
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 15 - pattern 14
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 16 - pattern 15
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 17 - pattern 16
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 18 - pattern 15
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 19 - pattern 17
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 20 - pattern 18
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 21 - pattern 18
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 22 - pattern 19
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 23 - pattern 19
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 24 - pattern 20
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 25 - pattern 20
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 26 - pattern 21
	db	6,5,2,6,5,0,6,5,3,6,4,1
	; position 27 - pattern 22
	db	6,5,2,6,5,0,6,5,3,6,4
	db	-1

	; 23:  Percussions / 0A|Square Perc
	; position 12 - pattern 12
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 13 - pattern 13
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 14 - pattern 12
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 15 - pattern 14
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 16 - pattern 15
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 17 - pattern 16
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 18 - pattern 15
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 19 - pattern 17
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 20 - pattern 18
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 21 - pattern 18
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 22 - pattern 19
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 23 - pattern 19
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 24 - pattern 20
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 25 - pattern 20
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 26 - pattern 21
	db	5,4,1,5,4,0,5,4,2,5,3
	; position 27 - pattern 22
	db	5,4,1,5,4,0,5,4,2,5
	db	-1

	; 24:  Pady / 0D|Pady
	; position 3 - pattern 3
	db	0,1
	; position 4 - pattern 4
	db	3,3
	; position 5 - pattern 5
	db	2,4
	; position 6 - pattern 6
	db	4,8
	; position 7 - pattern 7
	db	11,13
	; position 8 - pattern 8
	db	16,16
	; position 9 - pattern 9
	db	6,11
	; position 10 - pattern 10
	db	6,9
	; position 16 - pattern 15
	db	14,16
	; position 17 - pattern 16
	db	18,17
	; position 18 - pattern 15
	db	14,16
	; position 19 - pattern 17
	db	17,18
	; position 24 - pattern 20
	db	5
	; position 25 - pattern 20
	db	5
	; position 26 - pattern 21
	db	7
	; position 27 - pattern 22
	db	5,11
	; position 28 - pattern 23
	db	10,6
	; position 29 - pattern 24
	db	10,12
	; position 30 - pattern 25
	db	10,6
	; position 31 - pattern 26
	db	12,15
	; position 32 - pattern 27
	db	10,17
	; position 33 - pattern 28
	db	16,15
	; position 34 - pattern 29
	db	10,17
	; position 35 - pattern 30
	db	16,15
	; position 36 - pattern 31
	db	10,17
	; position 37 - pattern 32
	db	16
	; position 38 - pattern 33
	db	16
	db	-1

	; 25:  Pady / 0D|Pady
	; position 3 - pattern 3
	db	0,1
	; position 4 - pattern 4
	db	1,2
	; position 5 - pattern 5
	db	1,3
	; position 6 - pattern 6
	db	3,4
	; position 7 - pattern 7
	db	8,10
	; position 8 - pattern 8
	db	10,12
	; position 9 - pattern 9
	db	3,8
	; position 10 - pattern 10
	db	6,7
	; position 16 - pattern 15
	db	10,13
	; position 17 - pattern 16
	db	16,16
	; position 18 - pattern 15
	db	10,13
	; position 19 - pattern 17
	db	16,15
	; position 24 - pattern 20
	db	5
	; position 25 - pattern 20
	db	5
	; position 26 - pattern 21
	db	5
	; position 27 - pattern 22
	db	5,8
	; position 28 - pattern 23
	db	4,3
	; position 29 - pattern 24
	db	4,8
	; position 30 - pattern 25
	db	4,3
	; position 31 - pattern 26
	db	8,9
	; position 32 - pattern 27
	db	4,14
	; position 33 - pattern 28
	db	13,11
	; position 34 - pattern 29
	db	4,14
	; position 35 - pattern 30
	db	13,11
	; position 36 - pattern 31
	db	4,14
	; position 37 - pattern 32
	db	13
	; position 38 - pattern 33
	db	13
	db	-1

	; 26:  Pady / 0D|Pady
	; position 3 - pattern 3
	db	0,1
	; position 4 - pattern 4
	db	2,4
	; position 5 - pattern 5
	db	3,3
	; position 6 - pattern 6
	db	4,8
	; position 7 - pattern 7
	db	10,11
	; position 8 - pattern 8
	db	12,15
	; position 9 - pattern 9
	db	3,8
	; position 10 - pattern 10
	db	7,6
	; position 16 - pattern 15
	db	13,13
	; position 17 - pattern 16
	db	17,18
	; position 18 - pattern 15
	db	13,13
	; position 19 - pattern 17
	db	18,16
	; position 24 - pattern 20
	db	5
	; position 25 - pattern 20
	db	5
	; position 26 - pattern 21
	db	5
	; position 27 - pattern 22
	db	5,10
	; position 28 - pattern 23
	db	7,3
	; position 29 - pattern 24
	db	7,9
	; position 30 - pattern 25
	db	7,3
	; position 31 - pattern 26
	db	9,11
	; position 32 - pattern 27
	db	7,16
	; position 33 - pattern 28
	db	13,14
	; position 34 - pattern 29
	db	7,16
	; position 35 - pattern 30
	db	13,14
	; position 36 - pattern 31
	db	7,16
	; position 37 - pattern 32
	db	13
	; position 38 - pattern 33
	db	13
	db	-1

	; 27:  Pady / 0D|Pady
	; position 3 - pattern 3
	db	0,1
	; position 4 - pattern 4
	db	1,4
	; position 5 - pattern 5
	db	2,6
	; position 6 - pattern 6
	db	7,7
	; position 7 - pattern 7
	db	10,12
	; position 8 - pattern 8
	db	12,14
	; position 9 - pattern 9
	db	2,7
	; position 10 - pattern 10
	db	6,5
	; position 16 - pattern 15
	db	12,13
	; position 17 - pattern 16
	db	15,16
	; position 18 - pattern 15
	db	12,13
	; position 19 - pattern 17
	db	16,15
	; position 24 - pattern 20
	db	3
	; position 25 - pattern 20
	db	3
	; position 26 - pattern 21
	db	3
	; position 27 - pattern 22
	db	3,8
	; position 28 - pattern 23
	db	7,2
	; position 29 - pattern 24
	db	7,9
	; position 30 - pattern 25
	db	7,2
	; position 31 - pattern 26
	db	9,11
	; position 32 - pattern 27
	db	7,15
	; position 33 - pattern 28
	db	13,13
	; position 34 - pattern 29
	db	7,15
	; position 35 - pattern 30
	db	13,13
	; position 36 - pattern 31
	db	7,15
	; position 37 - pattern 32
	db	13
	; position 38 - pattern 33
	db	13
	db	-1

	; 28:  Pady / 0D|Pady
	; position 9 - pattern 9
	db	5,9
	; position 10 - pattern 10
	db	7,4
	; position 16 - pattern 15
	db	0,1
	; position 17 - pattern 16
	db	3,2
	; position 18 - pattern 15
	db	0,1
	; position 19 - pattern 17
	db	2,3
	; position 24 - pattern 20
	db	6
	; position 25 - pattern 20
	db	6
	; position 26 - pattern 21
	db	8
	; position 27 - pattern 22
	db	6,11
	; position 28 - pattern 23
	db	7,5
	; position 29 - pattern 24
	db	7,10
	; position 30 - pattern 25
	db	7,5
	; position 31 - pattern 26
	db	10,12
	; position 32 - pattern 27
	db	7,15
	; position 33 - pattern 28
	db	14,13
	; position 34 - pattern 29
	db	7,15
	; position 35 - pattern 30
	db	14,13
	; position 36 - pattern 31
	db	7,15
	; position 37 - pattern 32
	db	14
	; position 38 - pattern 33
	db	14
	db	-1

	; 29:  Pady / 0D|Pady
	; position 9 - pattern 9
	db	5,8
	; position 10 - pattern 10
	db	5,4
	; position 16 - pattern 15
	db	0,1
	; position 17 - pattern 16
	db	3,3
	; position 18 - pattern 15
	db	0,1
	; position 19 - pattern 17
	db	3,2
	; position 24 - pattern 20
	db	6
	; position 25 - pattern 20
	db	6
	; position 26 - pattern 21
	db	6
	; position 27 - pattern 22
	db	6,9
	; position 28 - pattern 23
	db	5,5
	; position 29 - pattern 24
	db	5,7
	; position 30 - pattern 25
	db	5,5
	; position 31 - pattern 26
	db	7,10
	; position 32 - pattern 27
	db	5,13
	; position 33 - pattern 28
	db	12,11
	; position 34 - pattern 29
	db	5,13
	; position 35 - pattern 30
	db	12,11
	; position 36 - pattern 31
	db	5,13
	; position 37 - pattern 32
	db	12
	; position 38 - pattern 33
	db	12
	db	-1

	; 30:  Pady / 0D|Pady
	; position 9 - pattern 9
	db	4,8
	; position 10 - pattern 10
	db	4,5
	; position 16 - pattern 15
	db	0,0
	; position 17 - pattern 16
	db	2,3
	; position 18 - pattern 15
	db	0,0
	; position 19 - pattern 17
	db	3,1
	; position 24 - pattern 20
	db	7
	; position 25 - pattern 20
	db	7
	; position 26 - pattern 21
	db	7
	; position 27 - pattern 22
	db	7,10
	; position 28 - pattern 23
	db	6,8
	; position 29 - pattern 24
	db	6,9
	; position 30 - pattern 25
	db	6,8
	; position 31 - pattern 26
	db	9,11
	db	-1

	; 31:  Pady / 0D|Pady
	; position 9 - pattern 9
	db	7,8
	; position 10 - pattern 10
	db	4,6
	; position 16 - pattern 15
	db	0,1
	; position 17 - pattern 16
	db	2,3
	; position 18 - pattern 15
	db	0,1
	; position 19 - pattern 17
	db	3,2
	; position 24 - pattern 20
	db	5
	; position 25 - pattern 20
	db	5
	; position 26 - pattern 21
	db	5
	; position 27 - pattern 22
	db	5,9
	db	-1

	; 32:  Rising / 0E|Rising Mod
	; position 5 - pattern 5
	db	1
	; position 32 - pattern 27
	db	0
	db	-1

	; 33:  Low Droplets / 0F|LFO Drop
	; position 0 - pattern 0
	db	2
	; position 3 - pattern 3
	db	2
	; position 10 - pattern 10
	db	0
	; position 11 - pattern 11
	db	1
	; position 16 - pattern 15
	db	4
	; position 18 - pattern 15
	db	4
	; position 19 - pattern 17
	db	3
	; position 27 - pattern 22
	db	5
	db	-1

	; 34:  Low Droplets / 0F|LFO Drop
	; position 0 - pattern 0
	db	0
	; position 3 - pattern 3
	db	0
	; position 5 - pattern 5
	db	1
	; position 27 - pattern 22
	db	2
	db	-1

	; 35:  Low Droplets / 0F|LFO Drop
	; position 0 - pattern 0
	db	0
	; position 3 - pattern 3
	db	0
	; position 5 - pattern 5
	db	1
	db	-1

	; 36:  Low Droplets / 0F|LFO Drop
	; position 0 - pattern 0
	db	0
	db	-1

	; 37:  Rings / 11|Rings
	; position 5 - pattern 5
	db	5
	; position 9 - pattern 9
	db	8,7,2,4,1
	; position 10 - pattern 10
	db	10,9,3
	; position 11 - pattern 11
	db	0
	; position 19 - pattern 17
	db	6
	; position 27 - pattern 22
	db	6
	; position 30 - pattern 25
	db	6
	; position 31 - pattern 26
	db	12,3
	; position 37 - pattern 32
	db	3
	; position 38 - pattern 33
	db	11
	; position 39 - pattern 34
	db	3
	; position 40 - pattern 40
	db	0
	db	-1

	; 38:  Rings / 12|#Rings
	; position 32 - pattern 27
	db	7,6,5,4,3,2,1,0
	; position 33 - pattern 28
	db	7,6,5,4,3,2,1,0
	; position 34 - pattern 29
	db	7,6,5,4,3,2,1,0
	; position 35 - pattern 30
	db	7,6,5,4,3,2,1,0
	; position 36 - pattern 31
	db	7,6,5,4,3,2,1,0
	; position 37 - pattern 32
	db	7,6,5,4,3,2,1,0
	; position 38 - pattern 33
	db	7,6,5,4,3,2,1,0
	db	-1

	; 39:  Rings / 11|Rings
	; position 9 - pattern 9
	db	5,1
	; position 10 - pattern 10
	db	6
	; position 11 - pattern 11
	db	2
	; position 27 - pattern 22
	db	4
	; position 30 - pattern 25
	db	0
	; position 31 - pattern 26
	db	0,2
	; position 37 - pattern 32
	db	2
	; position 38 - pattern 33
	db	1
	; position 39 - pattern 34
	db	3
	db	-1

	; 40:  Rings / 12|#Rings
	; position 32 - pattern 27
	db	7,6,5,4,3,2,1,0
	; position 33 - pattern 28
	db	7,6,5,4,3,2,1,0
	; position 34 - pattern 29
	db	7,6,5,4,3,2,1,0
	; position 35 - pattern 30
	db	7,6,5,4,3,2,1,0
	; position 36 - pattern 31
	db	7,6,5,4,3,2,1,0
	; position 37 - pattern 32
	db	7,6,5,4,3,2,1,0
	; position 38 - pattern 33
	db	7,6,5,4,3,2,1,0
	db	-1

	; 41:  Rings / 11|Rings
	; position 9 - pattern 9
	db	4,6
	; position 10 - pattern 10
	db	5
	; position 11 - pattern 11
	db	1
	; position 27 - pattern 22
	db	0
	; position 31 - pattern 26
	db	3
	; position 39 - pattern 34
	db	2
	db	-1

	; 42:  Rings / 12|#Rings
	; position 32 - pattern 27
	db	15,14,13,12,11,10,9,8
	; position 33 - pattern 28
	db	0,1,2,3,4,5,6,7
	; position 34 - pattern 29
	db	15,14,13,12,11,10,9,8
	; position 35 - pattern 30
	db	0,1,2,3,4,5,6,7
	; position 36 - pattern 31
	db	15,14,13,12,11,10,9,8
	; position 37 - pattern 32
	db	0,1,2,3,4,5,6,7
	; position 38 - pattern 33
	db	0,1,2,3,4,5,6,7
	db	-1

	; 43:  Short Bass / 13|Short Bass
	; position 24 - pattern 20
	db	4,4,11,4,10,11,4,3,4,4,11,4,10,2,3,4,4,4,11,4,10,11,4,3,4,4,11,4,10,2,3,4
	; position 25 - pattern 20
	db	4,4,11,4,10,11,4,3,4,4,11,4,10,2,3,4,4,4,11,4,10,11,4,3,4,4,11,4,10,2,3,4
	; position 26 - pattern 21
	db	7,7,13,7,12,13,7,5,7,7,13,7,12,4,5,7,7,7,13,7,12,13,7,5,7,7,13,7,12,4,5,7
	; position 27 - pattern 22
	db	4,4,11,4,10,11,4,3,4,4,11,4,10,2,3,4,4,4,11,4
	; position 32 - pattern 27
	db	3,9,3,3,9,3,2,8,2,2,8,2
	; position 33 - pattern 28
	db	1,7,1,1,7,1,0,6,0,0,6,0
	; position 34 - pattern 29
	db	3,9,3,3,9,3,2,8,2,2,8,2
	; position 35 - pattern 30
	db	1,7,1,1,7,1,0,6,0,0,6,0
	; position 36 - pattern 31
	db	3,9,3,3,9,3,2,8,2,2,8,2
	; position 37 - pattern 32
	db	1,7,1,1,7,1,1,7,1,1,7,1
	; position 38 - pattern 33
	db	1,7,1,1,7,1,1,7,1,1,7,1
	db	-1

	; 44:  Sinus / 14|Sinus
	; position 28 - pattern 23
	db	70,55,38,55,38,14,24,4,70,55,38,55,38,14,24,4,76,70,55,70,55,38,14,24,76,70,55,70,55,38,14,24,70,55,38,55,38,14,24,4,70,55,38,55,38,14,24,4,76,70,55,70,55,38,14,24,76,70,55,70,55,38,14,24
	; position 29 - pattern 24
	db	70,55,38,55,38,14,24,4,70,55,38,55,38,14,24,4,76,70,55,70,55,38,14,24,76,70,55,70,55,38,14,24,78,71,70,71,70,25,55,5,78,71,70,71,70,25,55,5,81,78,71,78,71,70,25,55,81,78,71,78,71,70,25,55
	; position 30 - pattern 25
	db	70,55,38,55,38,14,24,4,70,55,38,55,38,14,24,4,76,70,55,70,55,38,14,24,76,70,55,70,55,38,14,24,70,55,38,55,38,14,24,4,70,55,38,55,38,14,24,4,76,70,55,70,55,38,14,24,76,70,55,70,55,38,14,24
	; position 31 - pattern 26
	db	78,71,70,71,70,25,55,5,78,71,70,71,70,25,55,5,81,78,71,78,71,70,25,55,81,78,71,78,71,70,25,55,82,79,78,79,78,56,71,15,82,79,78,79,78,56,71,15,85,82,79,82,79,78,56,71,85,82,79,82,79,78,56,71
	; position 32 - pattern 27
	db	88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,86,80,83,88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,86,80,83
	; position 33 - pattern 28
	db	88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,86,80,83,91,89,88,89,88,84,87,77,91,89,88,89,88,84,87,77,92,91,89,91,89,88,84,87,92,91,89,91,89,88,84,87
	; position 34 - pattern 29
	db	88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,86,80,83,88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,86,80,83
	; position 35 - pattern 30
	db	88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,86,80,83,91,89,88,89,88,84,87,77,91,89,88,89,88,84,87,77,92,91,89,91,89,88,84,87,92,91,89,91,89,88,84,87
	; position 36 - pattern 31
	db	88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,86,80,83,88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,86,80,83
	; position 37 - pattern 32
	db	88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,86,80,83,88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,86,80,83
	; position 38 - pattern 33
	db	70,55,38,55,38,14,24,4,70,55,38,55,38,14,24,4,76,70,55,70,55,38,14,24,76,70,55,70,55,38,14,24,70,55,38,55,38,14,24,4,70,55,38,55,38,14,24,4,76,70,55,70,55,38,14,24,76,70,55,70,55,38,14,24
	; position 39 - pattern 34
	db	69,54,37,53,36,13,23,3,68,52,35,51,34,12,22,2,75,67,50,66,49,33,11,21,74,65,48,64,47,32,10,20,62,46,31,45,30,9,19,1,61,44,29,43,28,8,18,0,73,60,42,59,41,27,7,17,72,58,40,57,39,26,6,16
	db	-1

	; 45:  Sinus / 14|Sinus
	; position 28 - pattern 23
	db	38,14,24,70,55,38,55,38,14,24,4,70,55,38,55,38,14,24,4,76,70,55,70,55,38,14,24,76,70,55,70,55,38,14,24,70,55,38,55,38,14,24,4,70,55,38,55,38,14,24,4,76,70,55,70,55,38,14,24,76,70,55,70,55
	; position 29 - pattern 24
	db	38,14,24,70,55,38,55,38,14,24,4,70,55,38,55,38,14,24,4,76,70,55,70,55,38,14,24,76,70,55,70,55,70,25,55,78,71,70,71,70,25,55,5,78,71,70,71,70,25,55,5,81,78,71,78,71,70,25,55,81,78,71,78,71
	; position 30 - pattern 25
	db	38,14,24,70,55,38,55,38,14,24,4,70,55,38,55,38,14,24,4,76,70,55,70,55,38,14,24,76,70,55,70,55,38,14,24,70,55,38,55,38,14,24,4,70,55,38,55,38,14,24,4,76,70,55,70,55,38,14,24,76,70,55,70,55
	; position 31 - pattern 26
	db	70,25,55,78,71,70,71,70,25,55,5,78,71,70,71,70,25,55,5,81,78,71,78,71,70,25,55,81,78,71,78,71,78,56,71,82,79,78,79,78,56,71,15,82,79,78,79,78,56,71,15,85,82,79,82,79,78,56,71,85,82,79,82,79
	; position 32 - pattern 27
	db	86,80,83,88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,86,80,83,88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87
	; position 33 - pattern 28
	db	86,80,83,88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,88,84,87,91,89,88,89,88,84,87,77,91,89,88,89,88,84,87,77,92,91,89,91,89,88,84,87,92,91,89,91,89
	; position 34 - pattern 29
	db	86,80,83,88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,86,80,83,88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87
	; position 35 - pattern 30
	db	86,80,83,88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,88,84,87,91,89,88,89,88,84,87,77,91,89,88,89,88,84,87,77,92,91,89,91,89,88,84,87,92,91,89,91,89
	; position 36 - pattern 31
	db	86,80,83,88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,86,80,83,88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87
	; position 37 - pattern 32
	db	86,80,83,88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87,86,80,83,88,87,86,87,86,80,83,63,88,87,86,87,86,80,83,63,90,88,87,88,87,86,80,83,90,88,87,88,87
	; position 38 - pattern 33
	db	38,14,24,70,55,38,55,38,14,24,4,70,55,38,55,38,14,24,4,76,70,55,70,55,38,14,24,76,70,55,70,55,38,14,24,70,55,38,55,38,14,24,4,70,55,38,55,38,14,24,4,76,70,55,70,55,38,14,24,76,70,55,70,55
	; position 39 - pattern 34
	db	37,13,23,69,54,36,53,35,12,22,3,68,52,34,51,33,11,21,2,75,67,50,66,49,32,10,20,74,65,48,64,47,31,9,19,62,46,30,45,29,8,18,1,61,44,28,43,27,7,17,0,73,60,42,59,41,26,6,16,72,58,40,57,39
	db	-1

	; 46:  Sinus / 14|Sinus
	; position 28 - pattern 23
	db	55,69,55,38,14,24,69,55,38,55,38,14,24,4,69,55,38,55,38,14,24,4,75,69,55,69,55,38,14,24,75,69,55,69,55,38,14,24,69,55,38,55,38,14,24,4,69,55,38,55,38,14,24,4,75,69,55,69,55,38,14,24,75,69
	; position 29 - pattern 24
	db	55,69,55,38,14,24,69,55,38,55,38,14,24,4,69,55,38,55,38,14,24,4,75,69,55,69,55,38,14,24,75,69,70,77,70,69,25,55,77,70,69,70,69,25,55,5,77,70,69,70,69,25,55,5,80,77,70,77,70,69,25,55,80,77
	; position 30 - pattern 25
	db	55,69,55,38,14,24,69,55,38,55,38,14,24,4,69,55,38,55,38,14,24,4,75,69,55,69,55,38,14,24,75,69,55,69,55,38,14,24,69,55,38,55,38,14,24,4,69,55,38,55,38,14,24,4,75,69,55,69,55,38,14,24,75,69
	; position 31 - pattern 26
	db	70,77,70,69,25,55,77,70,69,70,69,25,55,5,77,70,69,70,69,25,55,5,80,77,70,77,70,69,25,55,80,77,78,81,78,77,56,70,81,78,77,78,77,56,70,15,81,78,77,78,77,56,70,15,84,81,78,81,78,77,56,70,84,81
	; position 32 - pattern 27
	db	86,87,86,85,79,82,87,86,85,86,85,79,82,63,87,86,85,86,85,79,82,63,89,87,86,87,86,85,79,82,89,87,86,87,86,85,79,82,87,86,85,86,85,79,82,63,87,86,85,86,85,79,82,63,89,87,86,87,86,85,79,82,89,87
	; position 33 - pattern 28
	db	86,87,86,85,79,82,87,86,85,86,85,79,82,63,87,86,85,86,85,79,82,63,89,87,86,87,86,85,79,82,89,87,88,90,88,87,83,86,90,88,87,88,87,83,86,76,90,88,87,88,87,83,86,76,91,90,88,90,88,87,83,86,91,90
	; position 34 - pattern 29
	db	86,87,86,85,79,82,87,86,85,86,85,79,82,63,87,86,85,86,85,79,82,63,89,87,86,87,86,85,79,82,89,87,86,87,86,85,79,82,87,86,85,86,85,79,82,63,87,86,85,86,85,79,82,63,89,87,86,87,86,85,79,82,89,87
	; position 35 - pattern 30
	db	86,87,86,85,79,82,87,86,85,86,85,79,82,63,87,86,85,86,85,79,82,63,89,87,86,87,86,85,79,82,89,87,88,90,88,87,83,86,90,88,87,88,87,83,86,76,90,88,87,88,87,83,86,76,91,90,88,90,88,87,83,86,91,90
	; position 36 - pattern 31
	db	86,87,86,85,79,82,87,86,85,86,85,79,82,63,87,86,85,86,85,79,82,63,89,87,86,87,86,85,79,82,89,87,86,87,86,85,79,82,87,86,85,86,85,79,82,63,87,86,85,86,85,79,82,63,89,87,86,87,86,85,79,82,89,87
	; position 37 - pattern 32
	db	86,87,86,85,79,82,87,86,85,86,85,79,82,63,87,86,85,86,85,79,82,63,89,87,86,87,86,85,79,82,89,87,86,87,86,85,79,82,87,86,85,86,85,79,82,63,87,86,85,86,85,79,82,63,89,87,86,87,86,85,79,82,89,87
	; position 38 - pattern 33
	db	55,69,55,38,14,24,69,55,38,55,38,14,24,4,69,55,38,55,38,14,24,4,75,69,55,69,55,38,14,24,75,69,55,69,55,38,14,24,69,55,38,55,38,14,24,4,69,55,38,55,38,14,24,4,75,69,55,69,55,38,14,24,75,69
	; position 39 - pattern 34
	db	54,68,53,37,13,23,67,52,36,51,35,12,22,3,66,50,34,49,33,11,21,2,74,65,48,64,47,32,10,20,73,63,46,62,45,31,9,19,61,44,30,43,29,8,18,1,60,42,28,41,27,7,17,0,72,59,40,58,39,26,6,16,71,57
	db	-1

	; 47:  Solo / 15|Solo
	; position 34 - pattern 29
	db	23,24,27,25,21,15,17,21,7,12
	; position 35 - pattern 30
	db	23,26,22,13,4,5,6,9,10,11
	; position 36 - pattern 31
	db	23,24,27,28,21,19,20,7,12
	; position 37 - pattern 32
	db	16,18,14,8,3,0,1,2
	; position 38 - pattern 33
	db	16,18,14,8,3,0,1,2
	db	-1

	; 48:  Solo / 15|Solo
	; position 34 - pattern 29
	db	23,24,27,25,21,15,17,21,7,12
	; position 35 - pattern 30
	db	23,26,22,13,4,5,6,9,10,11
	; position 36 - pattern 31
	db	23,24,27,28,21,19,20,7,12
	; position 37 - pattern 32
	db	16,18,14,8,3,0,1,2
	; position 38 - pattern 33
	db	16,18,14,8,3,0,1,2
	db	-1

	; 49:  Solo / 15|Solo
	; position 34 - pattern 29
	db	22,23,26,24,20,14,16,20,7,12
	; position 35 - pattern 30
	db	22,25,21,12,4,5,6,9,10,11
	; position 36 - pattern 31
	db	22,23,26,27,20,18,19,7,12
	; position 37 - pattern 32
	db	15,17,13,8,3,0,1,2
	; position 38 - pattern 33
	db	15,17,13,8,3,0,1,2
	db	-1

