**FREE

Dcl-F TICTACDF workstn indds(indy);

Dcl-DS indy;
  exit ind pos(3);
  new ind pos(5);
  fld ind pos(30);
  fld2 ind pos(31);
  fld3 ind pos(32);
  fld4 ind pos(33);
  fld5 ind pos(34);
  fld6 ind pos(35);
  fld7 ind pos(36);
  fld8 ind pos(37);
  fld9 ind pos(38);
END-DS;

Dcl-S turncounter zoned(5);
turncounter = 1;
emsg = 'O goes first';

DoW (exit = *off);
  ExFmt TicTacScrn;
  clear Emsg;

//assigning output to allow pressing enter between turns
//Top Right
  If (TPRTI = 'X' OR TPRTI = 'O');
    If (%REM(turncounter:2) = 0 AND TPRTI = 'X');
      TPRT = TPRTI;
      fld = *on;
      turncounter += 1;
    ElseIf (%REM(turncounter:2) <> 0 AND TPRTI = 'O');
      TPRT = TPRTI;
      fld = *on;
      turncounter += 1;
    Else;
      Emsg = 'Not your turn';
    ENDIf;
//Top Mid
  ElseIf (TPMDI = 'X' OR TPMDI = 'O');
   If (%REM(turncounter:2) = 0 AND TPMDI = 'X');
      TPMD = TPMDI;
      fld2 = *on;
      turncounter += 1;
    ElseIf (%REM(turncounter:2) <> 0 AND TPMDI = 'O');
      TPMDI = TPMDI;
      fld2 = *on;
      turncounter += 1;
    Else;
      Emsg = 'Not your turn';
    ENDIf;
//Top Left
  ElseIf (TPLFI = 'X' OR TPLFI = 'O');
    If (%REM(turncounter:2) = 0 AND TPLFI = 'X');
      TPLF = TPLFI;
      fld3 = *on;
      turncounter += 1;
    ElseIf (%REM(turncounter:2) <> 0 AND TPLFI = 'O');
      TPLF = TPLFI;
      fld3 = *on;
      turncounter += 1;
    Else;
      Emsg = 'Not your turn';
    ENDIf;
//Mid Right
  ElseIf (MDRTI = 'X' OR MDRTI = 'O');
    If (%REM(turncounter:2) = 0 AND MDRTI = 'X');
      MDRT = MDRTI;
      fld4 = *on;
      turncounter += 1;
    ElseIf (%REM(turncounter:2) <> 0 AND MDRTI = 'O');
      MDRT = MDRTI;
      fld4 = *on;
      turncounter += 1;
    Else;
      Emsg = 'Not your turn';
    ENDIf;
//Mid Mid
  ElseIf (MDMDI = 'X' OR MDMDI = 'O');
    If (%REM(turncounter:2) = 0 AND MDMDI = 'X');
      MDMD = MDMDI;
      fld5 = *on;
      turncounter += 1;
    ElseIf (%REM(turncounter:2) <> 0 AND MDMDI = 'O');
      MDMD = MDMDI;
      fld5 = *on;
      turncounter += 1;
    Else;
      Emsg = 'Not your turn';
    ENDIf;
//Mid Left
  ElseIf (MDLFI = 'X' OR MDLFI = 'O');
     If (%REM(turncounter:2) = 0 AND MDLFI = 'X');
      MDLF = MDLFI;
      fld6 = *on;
      turncounter += 1;
    ElseIf (%REM(turncounter:2) <> 0 AND MDLFI = 'O');
      MDLF = MDLFI;
      fld6 = *on;
      turncounter += 1;
    Else;
      Emsg = 'Not your turn';
    ENDIf;
//Bottom Right
  ElseIf (BMRTI = 'X' OR BMRTI = 'O');
     If (%REM(turncounter:2) = 0 AND BMRTI = 'X');
      BMRT = BMRTI;
      fld7 = *on;
      turncounter += 1;
    ElseIf (%REM(turncounter:2) <> 0 AND BMRTI = 'O');
      BMRT = BMRTI;
      fld7 = *on;
      turncounter += 1;
    Else;
      Emsg = 'Not your turn';
    ENDIf;
//Bottom Mid
  ElseIf (BMMDI = 'X' OR BMMDI = 'O');
    If (%REM(turncounter:2) = 0 AND BMMDI = 'X');
      BMMD = BMMDI;
      fld8 = *on;
      turncounter += 1;
    ElseIf (%REM(turncounter:2) <> 0 AND BMMDI = 'O');
      BMMD = BMMDI;
      fld8 = *on;
      turncounter += 1;
    Else;
      Emsg = 'Not your turn';
    ENDIf;
//Bottom Left
  ElseIf (BMLFI = 'X' OR BMLFI = 'O');
    If (%REM(turncounter:2) = 0 AND BMLFI = 'X');
      BMLF = BMLFI;
      fld9 = *on;
      turncounter += 1;
    ElseIf (%REM(turncounter:2) <> 0 AND BMLFI = 'O');
      BMLF = BMLFI;
      fld9 = *on;
      turncounter += 1;
    Else;
      Emsg = 'Not your turn';
    ENDIf;
  ENDIF;

//horizontal wins
  If (TPRT = 'X' AND TPMD = 'X' AND TPLF = 'X');
    Emsg = 'X Wins';
    new = *on;
  ElseIF (MDRT = 'X' AND MDMD = 'X' AND MDLF = 'X');
    Emsg = 'X Wins';
    new = *on;
  ElseIF (BMRT = 'X' AND BMMD = 'X' AND BMLF = 'X');
    Emsg = 'X Wins';
    new = *on;
  ElseIF (TPRT = 'O' AND TPMD = 'O' AND TPLF = 'O');
    Emsg = 'O Wins';
    new = *on;
  ElseIF (BMRT = 'O' AND BMMD = 'O' AND BMLF = 'O');
    Emsg = 'O Wins';
    new = *on;
  ElseIF (BMRT = 'O' AND BMMD = 'O' AND BMLF = 'O');
    Emsg = 'O Wins';
    new = *on;
//vertical wins
  ElseIF (TPRT = 'X' AND MDRT = 'X' AND BMRT = 'X');
    Emsg = 'X Wins';
    new = *on;
  ElseIF (TPMD = 'X' AND MDMD = 'X' AND BMMD = 'X');
    Emsg = 'X Wins';
    new = *on;
  ElseIF (TPLF = 'X' AND MDLF = 'X' AND BMLF = 'X');
    Emsg = 'X Wins';
    new = *on;
  ElseIF (TPRT = 'O' AND MDRT = 'O' AND BMRT = 'O');
    Emsg = 'O Wins';
    new = *on;
  ElseIF (TPMD = 'O' AND MDMD = 'O' AND BMMD = 'O');
    Emsg = 'O Wins';
    new = *on;
  ElseIF (TPLF = 'O' AND MDLF = 'O' AND BMLF = 'O');
    Emsg = 'O Wins';
    new = *on;
//cross wins
  ElseIF (TPRT = 'X' AND MDMD = 'X' AND BMLF = 'X');
    Emsg = 'X Wins';
    new = *on;
  ElseIF (BMRT = 'X' AND MDMD = 'X' AND TPLF = 'X');
    Emsg = 'X Wins';
    new = *on;
  ElseIF (TPRT = 'O' AND MDMD = 'O' AND BMLF = 'O');
    Emsg = 'O Wins';
    new = *on;
  ElseIF (BMRT = 'O' AND MDMD = 'O' AND TPLF = 'O');
    Emsg = 'O Wins';
    new = *on;
//DRAW
  ElseIf (fld = *on AND fld2 = *on AND fld3 = *on AND fld4 = *on
      AND fld5 = *on AND fld6 = *on AND fld7 = *on AND fld8 = *on
      AND fld9 = *on);
    EMsg = 'DRAW';
    new = *on;
  ENDIF;

  If (new = *on);
    clear TPRT;
    clear TPMD;
    clear TPLF;
    clear MDRT;
    clear MDMD;
    clear MDLF;
    clear BMRT;
    clear BMMD;
    clear BMLF;

    fld = *off;
    fld2 = *off;
    fld3 = *off;
    fld4 = *off;
    fld5 = *off;
    fld6 = *off;
    fld7 = *off;
    fld8 = *off;
    fld9 = *off;

  ENDIF;
EndDo;

*inlr = *on; 
