!DEFINE YOUR POTENTIAL HERE
     MODULE POT2DER
       USE RKSUITE_90_PREC

       REAL(WP)::V_PHI_PHI
     END MODULE POT2DER


     SUBROUTINE POTENTIAL_POTENTIALPRIME(POTENTIAL_USED,POTENTIALPRIME,PHI_X)
       USE RKSUITE_90_PREC
       USE THEORY_PARAM
       USE PARAMETERS
       USE POT2DER
       IMPLICIT NONE

       REAL(WP),INTENT(IN)::PHI_X
       REAL(WP),INTENT(OUT)::POTENTIAL_USED,POTENTIALPRIME
       REAL(WP)::ALPHA,BETA,GAMMA,PHASE
 
       POTENTIAL_USED=0.0_WP
       POTENTIALPRIME=0.0_WP
       V_PHI_PHI=0.0_WP

       
       ALPHA=PARAM_1
       BETA=PARAM_2
       GAMMA=PARAM_3
       PHASE=PARAM_4
       
       
       POTENTIAL_USED=ALPHA*(PHI_X+(BETA*COS((PHI_X/GAMMA)+PHASE)))
       POTENTIALPRIME=ALPHA-(ALPHA*BETA/GAMMA)*SIN((PHI_X/GAMMA)+PHASE)
       
       V_PHI_PHI=-(ALPHA*BETA/(GAMMA*GAMMA))*COS((PHI_X/GAMMA)+PHASE)
       
           
     
     END SUBROUTINE POTENTIAL_POTENTIALPRIME
