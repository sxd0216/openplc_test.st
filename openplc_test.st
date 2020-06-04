PROGRAM program0
  VAR
    Stop AT %QX0.1 : BOOL;
    Start AT %QX0.3 : BOOL;
    MV1 AT %QX0.6 : BOOL;
  END_VAR
  VAR
    R_TRIG1 : R_TRIG;
    R_TRIG2 : R_TRIG;
  END_VAR

  R_TRIG1(CLK := Start);
  IF R_TRIG1.Q THEN
    MV1 := TRUE; (*set*)
  END_IF;
  R_TRIG2(CLK := Stop);
  IF R_TRIG2.Q THEN
    MV1 := FALSE; (*reset*)
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
