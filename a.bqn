_Rf←{("raylib.dll"•FFI𝕗){𝔽}},_Rfv←{F←𝕗_Rf,{𝕊:F⟨⟩}}# RaylibFfi RaylibFfiVoid
Stl←""             ‿"SetTraceLogLevel" ‿">i64"                                             _Rf
Iw ←""             ‿"InitWindow"       ‿"i64"‿"i64"‿"*u8:c8"                               _Rf
Cw ←""             ‿"CloseWindow"                                                          _Rfv
Gcm←"i64"          ‿"GetCurrentMonitor"                                                    _Rfv
Gmw←"i64"          ‿"GetMonitorWidth"  ‿">i64"                                             _Rf
Gmh←"i64"          ‿"GetMonitorHeight" ‿">i64"                                             _Rf
Sws←""             ‿"SetWindowSize"    ‿"i64"‿"i64"                                        _Rf
Swp←""             ‿"SetWindowPosition"‿"i64"‿"i64"                                        _Rf
Wsc←"u8"           ‿"WindowShouldClose"                                                    _Rfv
Imd←"u8"           ‿"IsMouseButtonDown"‿">i64"                                             _Rf
Gmp←"{f32,f32}"    ‿"GetMousePosition"                                                     _Rfv
Bd ←""             ‿"BeginDrawing"                                                         _Rfv
Ed ←""             ‿"EndDrawing"                                                           _Rfv
Cb ←""             ‿"ClearBackground"  ‿">{u8,u8,u8,u8}"                                   _Rf
Dcs←""             ‿"DrawCircleSector" ‿"{f32,f32}"‿"f32"‿"f32"‿"f32"‿"i64"‿"{u8,u8,u8,u8}"_Rf
Cfh←"{u8,u8,u8,u8}"‿"ColorFromHSV"     ‿"f32"‿"f32"‿"f32"                                  _Rf
Cth←"{f32,f32,f32}"‿"ColorToHSV"       ‿">{u8,u8,u8,u8}"                                   _Rf

pzi←↕2‿6,Pzf←{⌽˘∘⌽⌾(2‿3⊸↑)⌾(𝕨⊸⌽˘)𝕩}# PuZzleInit 𝕨PuzZleFlip𝕩. puzzlerot is easy enough. v https://sashamaps.net/docs/resources/20-colors/
hues←Cfh¨(⊢≍0.6⊸×⌾(1↓⊢)¨)Cth¨255∾˜¨(16⊸×⊸+˜´⌽)⚇1(⊑"0123456789abcdef"⊐⊢)⚇0(<˘3‿2⥊1↓⊢)¨⟨"#e6194b","#3cb44b","#ffe119","#4363d8","#f58231","#911eb4"⟩
Stl 7,Iw⟨1,1,"cheese"∾@⟩,sz←{Swp⌊2÷˜𝕩-(⊢⊣Sws)s←⌊⋈˜⌊´0.8×𝕩,⊑s}(Gmw⋈Gmh)Gcm@,wc←⋈˜wr←2÷˜sz#depend on SiZe; WindowCenter WindowRadius
rr←0.3‿0.5,sp←pzi,stp←sp,sa←0‿0,sph←0,scc←0‿0,sri←0#RingRadii State:Puzzle TempPuzzle Angles Phase[none rot flip] ClickCoordinates RelevantIndex
sp↩stp{i←1↓𝕨,𝕨{⊑𝕨?𝕩Pzf˜⊑i;(1⊑i)⊸⌽⌾((⊑i)⊏⊢)𝕩}𝕩}´↩{𝕩∾•rand.Range¨⊢◶⟨2‿6,6⟩𝕩}¨•rand.Range¨1e3⥊2,Atd←π÷˜180×•math.Atan2´,Hyp←•math.Hypot´
{𝕊:Bd@,Cb 4⥊0#draw loop
 {0=sph?∨´Imd¨0‿1?wr≥d←Hyp v←wc-˜scc↩Gmp@?{Imd 0?sph↩1,sri↩1⌊⊑rr⍋d÷sz;sph↩2,sri↩6|⌊60÷˜Atd v};#sph↩1:row,2:column
  1=sph?a←(Atd wc-˜Gmp@)-Atd scc-wc,        {Imd 0?sa a⌾(sri⊑⊢)↩;sp(-6|⌊0.5+60÷˜a)⊸⌽⌾(sri⊏⊢)↩,stp↩sp,sa↩0‿0,sph↩0};
  2=sph?a←(Atd wc-˜Gmp@)-⌊⌾(÷⟜60)Atd scc-wc,{Imd 1?j←6|⌊60÷˜a,stp↩{2=j?sri Pzf sp;4=j?sp Pzf˜6|sri-2;sp};sp↩stp,sph↩0};
 @},Dcs¨⌽(↕∘≢{i‿j𝕊𝕩:⟨wc,sz×i⊑rr⟩∾((i⊑sa)+60×1⊸+⊸⋈j)∾⟨sz,𝕩⊑hues⟩}¨⊢)stp
Ed@}•_while_(¬Wsc)@,Cw@
