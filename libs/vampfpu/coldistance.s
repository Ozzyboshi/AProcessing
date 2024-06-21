COLDIST:
; Carica i valori dei punti nei registri FP
    fmove.w d0,fp0      ; Carica x1 in fp0
    fmove.w d1,fp1      ; Carica y1 in fp1
    fmove.w d2,fp2      ; Carica z1 in fp2
    fmove.w d3,fp3      ; Carica x2 in fp3
    fmove.w d4,fp4      ; Carica y2 in fp4
    fmove.w d5,fp5      ; Carica z2 in fp5

    ; Calcola le differenze
    fsub fp3,fp0        ; fp0 = x1 - x2
    fsub fp4,fp1        ; fp1 = y1 - y2
    fsub fp5,fp2        ; fp2 = z1 - z2

    ; Eleva al quadrato le differenze
    fmul fp0,fp0        ; fp0 = (x1 - x2)^2
    fmul fp1,fp1        ; fp1 = (y1 - y2)^2
    fmul fp2,fp2        ; fp2 = (z1 - z2)^2

    ; Somma i quadrati
    fadd fp1,fp0        ; fp0 = (x1 - x2)^2 + (y1 - y2)^2
    fadd fp2,fp0        ; fp0 = (x1 - x2)^2 + (y1 - y2)^2 + (z1 - z2)^2

    ; Calcola la radice quadrata della somma
    fsqrt fp0,fp0       ; fp0 = sqrt((x1 - x2)^2 + (y1 - y2)^2 + (z1 - z2)^2)
    rts