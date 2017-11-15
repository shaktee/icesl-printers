;(**** QIDI Avatar IV ****)
;(**** startup gcode ****)
;(**** init ****)
M136                                ;(enable build progress)
M73 P0                              ;(set initial build percentage)
G21                                 ;(set units to mm)
G90                                 ;(set positioning to absolute)
;(**** homing ****)
G162 X Y F2500                      ;(home XY axes maximum)
G161 Z F1100                        ;(home Z axis minimum)
G92 X230 Y145 Z-5 A0 B0             ;(set Z to -5)
G1 X230 Y145 Z0.0                   ;(move Z to "0")
G161 Z F100                         ;(home Z axis minimum)
M132 X Y Z                          ;(recall stored home offsets for XYZ axis)
;(**** Z=0 correction ****)
;G92 Z-0.10		             ;(extra Z space for PETG and SoftPLA)
;(**** heating ****)
G1 X-112.5 Y-72.5 Z50 F1800         ;(move to waiting position)
G130 X20 Y20 Z20 A20 B20            ;(lower stepper Vrefs while heating)
M140 S<HBPTEMP> T0                  ;(set HBP temperature)
M6 T0                               ;(wait for HBP to reach temperature)
M104 S<T0TEMP> T0                   ;(set extruder 1 temperature)
;M104 S<T1TEMP> T1                   ;(set extruder 0 temperature)
M6 T0                               ;(wait for extruder 1 reach temperature)
;M6 T1                               ;(wait for extruder 0to reach temperature)
T1                                  ;(select tool 1 (offset calcualtion))
G130 X127 Y127 Z40 A127 B127        ;(set stepper motor Vref to defaults)
;(**** prime ****)
G1 X0 Y-72.5 Z0.2 F1800 A4          ;(push out 4 mm and move down half way)
G1 X112.5 Y-72.5 Z0.2 F1800 A8      ;(push out 4 mm and move prime full way)
;G1 X0 Y-72.5 Z0.2 F1800.0 B4        ;(push out 4 mm and move down half way)
;G1 X112.5 Y-72.5 Z0.2 F1800 B4      ;(push out 4 mm and move prime full way)
;G1 X0 Y-72.5 Z0.2 F1800 A4 B4       ;(push out 4 mm and move down half way)
;G1 X112.5 Y-72.5 Z0.2 F1800 A8 B8   ;(push out 4 mm and move prime full way)
G92 A0 B0                           ;(reset counters after prime)
;(**** end of startup gcode ****)