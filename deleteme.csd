<CsoundSynthesizer>
<CsOptions>
-o dac -d
</CsOptions>
<CsInstruments>
; Example by Bjørn Houdorf, february 2013
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1
; First we hear each grain, but later on it sounds more like a drum roll.
; If your computer have problems with running this CSD-file in real-time,
; you can render to a soundfile. Just write "-o filename" in the <CsOptions>,
; instead of "-o dac"
gareverbL init 0
gareverbR init 0
giFt1 ftgen 0, 0, 1025, 10, 2, 1 ; GEN20, Hanning window for grain envelope
; The soundfile(s) you use should be in the same folder as your csd-file
; The soundfile "fox.wav" can be downloaded at http://csound-tutorial.net/node/1/58
giFt2 ftgen 0, 0, 131072, 1, "PnoEXT1.wav", 0, 0, 0
; Instead you can use your own soundfile(s)
instr 1 ; Granular synthesis of soundfile
ipitch = sr/ftlen(giFt2) ; Original frequency of the input sound
kdens1 expon 1, p3, 11
kdens2 expon 1, p3, 11
kdens3 expon 1, p3, 11
kamp line 1, p3, 0.05
a1 grain 1, ipitch, kdens1, 1, 0, 1, giFt2, giFt1, 1
a2 grain 1, ipitch, kdens2, 1, 0, 1, giFt2, giFt1, 1
a3 grain 1, ipitch, kdens3, 1, 0, 1, giFt2, giFt1, 1
aleft = kamp*(a1+a2)
aright = kamp*(a2+a3)
outs aleft, aright ; Output granulation
gareverbL = gareverbL + a1+a2 ; send granulation to Instr 2 (Reverb)
gareverbR = gareverbR + a2+a3
endin
instr 2 ; Reverb
kkamp line 0, p3, 0.08
aL reverb gareverbL, 10*kkamp ; reverberate what is in gareverbL
aR reverb gareverbR, 10*kkamp ; and garaverbR
outs kkamp*aL, kkamp*aR ; and output the result
gareverbL = 0 ; empty the receivers for the next loop
gareverbR = 0
endin
</CsInstruments>
<CsScore>
i1 0 50 ; Granulation
i2 0 60 ; Reverb
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
