### CPU Drawing instructions

- #### POINT - Plots a point (CPU)
  Input:
  - d0.w : Point X (0-319)
  - d1.w : Point Y (0-255)

  Output:
    Nothing

  Defines:
  - USE_CLIPPING
  - USE_DBLBUF

  Trashes:
  - d0
  - d1
  - a0
  - a1

  Example: Plot a point at coord X=5 and Y=5
  ```
  moveq #5,d0
  moveq #5,d1
  jsr POINT
  ```

- #### RECT - Draws a rectangle (CPU)
  Input:
  - d0.w : First point X (0-319)
  - d1.w : First point Y (0-255)
  - d5.w : Width in pixels -1
  - d6.w : Height in pixels -1 
  
  Output:
    Nothing
  Defines:
  - USE_CLIPPING
  - USE_DBLBUF
  
  Trashes: nothing
  
  Example: Draw a rectangle with upper left point at the origin with width 11px and  height 3 px
  ```
    move.w            #0,d0
    move.w            #0,d1
    move.w            #10,d5
    move.w            #2,d6
    
    jsr               RECT
```
