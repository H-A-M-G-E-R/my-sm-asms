; Enemy Draw Hook, by H A M
; Adds a hook to execute before drawing an enemy.
; This allows enemies to have trails, effects and more.
; Set the hook by setting !EnemyDrawHook,x where x is the enemy index.
; After the hook, SEC to draw the enemy normally, CLC to not draw it

lorom

!EnemyDrawHook = $7E700A ; 2 bytes, feel free to change it to another unused address in $7E:7000..703E, see https://patrickjohnston.org/ASM/Lists/Super%20Metroid/RAM%20map.asm

; hijack write enemy oam to maintain compatibility with my "enemy drawing queue expansion"
; replace an unnecessary REP #$30 : LDX $0E54
org $A09454
JMP ExecuteEnemyDrawHook ; using JMPs instead of JSR and RTS saves cycles
AfterExecuteEnemyDrawHook:
BRA $00

%BEGIN_FREESPACE(A0)
ExecuteEnemyDrawHook:
{
  LDA.l !EnemyDrawHook,x : BPL .drawNormally
  JSL .execute
  BCS .drawNormally
  PLB : RTS

.drawNormally
  JMP AfterExecuteEnemyDrawHook

.execute
  STA $1784
  LDA $0FA6,x : STA $1786
  ; DB is already set to enemy bank
  JML [$1784]
}

WriteEnemyOamLong:
{
  JSR .execute : LDX $0E54 : RTL

.execute
  PHB : JMP $9459
}
%END_FREESPACE(A0)

;;; Example ;;;

; Gives boyons a cool effect
org $A28751 : JMP HijackBoyonInit

%BEGIN_FREESPACE(A2)
HijackBoyonInit:
{
  STZ $0FB2,x
  LDA.w #BoyonDrawHook : STA.l !EnemyDrawHook,x : RTL
}

BoyonDrawHook:
{
  JSL WriteEnemyOamLong
  JSL $808111 : AND #$000F : SEC : SBC #$0008 : STA $7E7010,x ; x offset
  JSL $808111 : AND #$000F : SEC : SBC #$0008 : STA $7E7012,x ; y offset
  JSL WriteEnemyOamLong
  TDC : STA $7E7010,x : STA $7E7012,x
  CLC : RTL ; don't draw the enemy normally
}
%END_FREESPACE(A2)
