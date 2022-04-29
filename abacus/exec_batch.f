       PROGRAM BATCH_BONE

       LOGICAL(4) result
       CHARACTER(len=300) DIR
       CHARACTER(len=14) ID
       CHARACTER(len=15) INP
       CHARACTER(len=10) F
       CHARACTER(len=100) Format
       INTEGER ste,inc,tinc, rest,uno, ninc, ginc
       INTEGER(4) ISTAT,N
       CHARACTER(len=300) comando
       CHARACTER(len=600) comando2
       DIMENSION ID_patient(99999999)
       INTEGER(4) FUNCTION CHDIR
c
c      ************ quantities to be defined *********************
c      
c      total number of simulations       
       nsim = 36
c
C------------------------------------------------------------------
C                  Open file with patient's ID
C------------------------------------------------------------------
C
C      OPEN(1,FILE='/homedtic/cruiz/Test_imatge/Sing_batch/
C     #Folder_names_2.txt',status='unknown')  
C
c         Image ID patients folder and inp
c
      OPEN(2,FILE='/homedtic/emunoz/codes/abaqus/complete/L2L3/
     #listL2L3.txt',status='unknown')  
C
c         Check file to track the simulations executed
c
      OPEN(3,FILE='/homedtic/emunoz/codes/abaqus/complete/L2L3/
     #check.dat',status='unknown')  
c
c------------------------------------------------------------------
c
c------------------------------------------------------------------
c
c    Buckle for simulation excecution following Folder_nemes.txt
c
c------------------------------------------------------------------
c
       do i = 1, nsim
c
c------------------------------------------------------------------
c                    Reading folder list
c------------------------------------------------------------------
c
c      READ(1,*) ID
      READ(2,*) INP
c
c------------------------------------------------------------------
c            Definition of file format for simulations
c------------------------------------------------------------------
c
c      N=len_trim(INP)
C
c      if (N.lt.10) then
c      WRITE(F,790) 'A',N    
c 790  FORMAT(A1,I1)
c      write(Format,*)'(A,',F,',A)'
c      write(Format,*)'(A,',F,',A,A14,A)'
c      else
c      WRITE(F,800) 'A',N
c 800  FORMAT(A1,I2)
c      write(Format,*)'(A,',F,',A)'
c      write(Format,*)'(A,',F,',A,A14,A)'
c      end if
C
c------------------------------------------------------------------
c       Writing check file to follow simulation evolution
c------------------------------------------------------------------
C
              WRITE(3,1289) INP            
 1289         FORMAT(A6)
C
c------------------------------------------------------------------
c            Excecuting Integral bone simulations 
c------------------------------------------------------------------
C
C       WRITE(DIR,format)'/homedtic/emunoz/codes/abaqus/complete/L2L3/'
C     1,INP,'/Rot5TrabCoeff1.1'
C       WRITE(DIR,format)'/mnt/vmdata/abaqus-simbiosys/
C     1Carlos/Hueso/Abril/Precision2/',INP,
C     1'/',ID,'/Rot5TrabCoeff1.1'
C       result = CHDIR(DIR)
C
       write(comando,801) INP
  801  FORMAT('/simulia/./abaqus
     1 job="',A6,'" user=Sub_disc cpus=4 inter')
       result = SYSTEMQQ(comando)       
       write(*,*) INP
c
c------------------------------------------------------------------
c            Excecuting Cortical bone simulations 
c------------------------------------------------------------------
c
c       WRITE(DIR,format)'/mnt/vmdata/abaqus-simbiosys/
c     1Carlos/Hueso/Abril/Precision2/'
c     1,INP,'/Rot5TrabCoeff1.1/Cortical'
C       WRITE(DIR,format)'/mnt/vmdata/abaqus-simbiosys/
C     1Carlos/Hueso/Abril/Precision2/',INP,
C     1'/',ID,'/Rot5TrabCoeff1.1/Cortical'
c       result = CHDIR(DIR)
c
c       write(comando,801) ID
c       result = SYSTEMQQ(comando)  
c
c------------------------------------------------------------------
c            Excecuting Trabecular bone simulations 
c------------------------------------------------------------------
c
c       WRITE(DIR,format)'/mnt/vmdata/abaqus-simbiosys/
c     1Carlos/Hueso/Abril/Precision2/'
c     1,INP,'/Rot5TrabCoeff1.1/Trabecular'
C       WRITE(DIR,format)'/mnt/vmdata/abaqus-simbiosys/
C     1Carlos/Hueso/Abril/Precision2/',INP,
C     1'/',ID,'/Rot5TrabCoeff1.1/Trabecular'
c       result = CHDIR(DIR)
c
c       write(comando,801) ID
c       result = SYSTEMQQ(comando) 
c
       end do              
       END PROGRAM      
c     
