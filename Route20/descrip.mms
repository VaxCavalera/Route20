
!     Define symbols according to macro values
!==
DEBUG = 1

.IFDEF DEBUG
DBG = /DEBUG
DBGOPT = /NOOPTIMIZE/DEBUG
.ELSE
DBG = /NODEBUG
DBGOPT = /OPTIMIZE/NODEBUG
.ENDIF

.IFDEF LIST
LST = /LIST
.ELSE
LST = /NOLIST
.ENDIF

.IFDEF DIAG
DIA = /DIAGNOSTICS
.ELSE
DIA = /NODIAGNOSTICS
.ENDIF

.IFDEF PCA
PCAOPT = /DEBUG
.ENDIF

CFLAGS = /INCLUDE=([],[.PCAP])/NOPREFIX_LIBRARY_ENTRIES/WARN=(DISABLE=(MACROREDEF,UNKNOWNPRAGMA,LONGEXTERN,PTRMISMATCH,IMPLICITFUNC,
QUESTCOMPARE1))
ELN = + ELN$:VAXELNC/LIB

!++
!      List of tools used and required symbols
!
!      !C used
!      !Executables used
!==


!++
!     Missing sources catch-all
!==

.DEFAULT
   ! No source found for $(MMS$TARGET)
   ! - Attempting to continue



!++
!   Complete application - default build item
!==

COMPLETE_APPLICATION depends_on -
     ROUTE20.EXE
        CONTINUE


!++
!   C
!==

MMS$OLB.OLB(ADJACENCY=ADJACENCY.OBJ) depends_on -
      ADJACENCY.C -
     ,ADJACENCY.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(LIMITS=LIMITS.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(MEMORY=MEMORY.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,DECNET.H -
     ,ETH_INIT_LAYER.H -
     ,PLATFORM.H -
     ,BASICTYPES.H -
     ,CIRCUIT.H -
     ,CONSTANTS.H -
     ,ETH_DECNET.H -
     ,LOGGING.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,LINE.H -
     ,PACKET.H -
     ,TIMER.H -
     ,NODE.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=ADJACENCY.OBJ ADJACENCY.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB ADJACENCY.OBJ
       DELETE ADJACENCY.OBJ;*

MMS$OLB.OLB(AREA_FORWARDING_DATABASE=AREA_FORWARDING_DATABASE.OBJ) depends_on -
      AREA_FORWARDING_DATABASE.C -
     ,AREA_FORWARDING_DATABASE.H -
     ,CONSTANTS.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=AREA_FORWARDING_DATABASE.OBJ AREA_FORWARDING_DATABASE.C
       LIBRARY/REPLACE MMS$OLB.OLB AREA_FORWARDING_DATABASE.OBJ
       DELETE AREA_FORWARDING_DATABASE.OBJ;*

MMS$OLB.OLB(AREA_ROUTING_DATABASE=AREA_ROUTING_DATABASE.OBJ) depends_on -
      AREA_ROUTING_DATABASE.C -
     ,AREA_ROUTING_DATABASE.H -
     ,CONSTANTS.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,NODE.H -
     ,BASICTYPES.H -
     ,DECNET.H -
     ,LOGGING.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=AREA_ROUTING_DATABASE.OBJ AREA_ROUTING_DATABASE.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB AREA_ROUTING_DATABASE.OBJ
       DELETE AREA_ROUTING_DATABASE.OBJ;*

MMS$OLB.OLB(CIRCUIT=CIRCUIT.OBJ) depends_on -
      CIRCUIT.C -
     ,CIRCUIT.H -
     ,CONSTANTS.H -
     ,DDCMP_CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STRING=STRING.H) -
     ,ETH_CIRCUIT.H -
     ,NODE.H -
     ,PLATFORM.H -
     ,DECNET.H -
     ,LINE.H -
     ,PACKET.H -
     ,TIMER.H -
     ,BASICTYPES.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,LOGGING.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=CIRCUIT.OBJ CIRCUIT.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB CIRCUIT.OBJ
       DELETE CIRCUIT.OBJ;*


MMS$OLB.OLB(DDCMP=DDCMP.OBJ) depends_on -
      DDCMP.C -
     ,DDCMP.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(MEMORY=MEMORY.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STRING=STRING.H) -
     ,BASICTYPES.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=DDCMP.OBJ DDCMP.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB DDCMP.OBJ
       DELETE DDCMP.OBJ;*

MMS$OLB.OLB(DDCMP_CIRCUIT=DDCMP_CIRCUIT.OBJ) depends_on -
      DDCMP_CIRCUIT.C -
     ,CIRCUIT.H -
     ,DDCMP_CIRCUIT.H -
     ,DDCMP_INIT_LAYER.H -
     ,DDCMP_SOCK_LINE.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(MEMORY=MEMORY.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STRING=STRING.H) -
     ,LINE.H -
     ,MESSAGES.H -
     ,PLATFORM.H -
     ,TIMER.H -
     ,DECNET.H -
     ,PACKET.H -
     ,DDCMP.H -
     ,SOCKET.H -
     ,ADJACENCY.H -
     ,BASICTYPES.H -
     ,CONSTANTS.H -
     ,ETH_DECNET.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,LOGGING.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(FCNTL=FCNTL.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(IF=IF.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(NETDB=NETDB.H) -
-!   ,NETINET:IN.H -
-!   ,ARPA:INET.H -
-!   ,SYS:TYPES.H -
-!   ,WINSOCK2.H -
     ,NODE.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=DDCMP_CIRCUIT.OBJ DDCMP_CIRCUIT.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB DDCMP_CIRCUIT.OBJ
       DELETE DDCMP_CIRCUIT.OBJ;*

MMS$OLB.OLB(DDCMP_INIT_LAYER=DDCMP_INIT_LAYER.OBJ) depends_on -
      DDCMP_INIT_LAYER.C -
     ,BASICTYPES.H -
     ,CIRCUIT.H -
     ,CONSTANTS.H -
     ,DDCMP_CIRCUIT.H -
     ,DDCMP_INIT_LAYER.H -
     ,DDCMP_SOCK_LINE.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(MEMORY=MEMORY.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,DECNET.H -
     ,MESSAGES.H -
     ,PLATFORM.H -
     ,ROUTE20.H -
     ,SOCKET.H -
     ,TIMER.H -
     ,LINE.H -
     ,PACKET.H -
     ,DDCMP.H -
     ,LOGGING.H -
     ,ADJACENCY.H -
     ,ETH_DECNET.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(FCNTL=FCNTL.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(IF=IF.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(NETDB=NETDB.H) -
-!   ,NETINET:IN.H -
-!   ,ARPA:INET.H -
-!   ,SYS:TYPES.H -
-!   ,WINSOCK2.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,NODE.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=DDCMP_INIT_LAYER.OBJ DDCMP_INIT_LAYER.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB DDCMP_INIT_LAYER.OBJ
       DELETE DDCMP_INIT_LAYER.OBJ;*

MMS$OLB.OLB(DDCMP_SOCK_LINE=DDCMP_SOCK_LINE.OBJ) depends_on -
      DDCMP_SOCK_LINE.C -
     ,DDCMP.H -
     ,DDCMP_SOCK_LINE.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(MEMORY=MEMORY.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,DNS.H -
     ,PLATFORM.H -
     ,ROUTE20.H -
     ,SOCKET.H -
     ,TIMER.H -
     ,BASICTYPES.H -
     ,DDCMP_CIRCUIT.H -
     ,PACKET.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,LOGGING.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(FCNTL=FCNTL.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(IF=IF.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(NETDB=NETDB.H) -
-!   ,NETINET:IN.H -
-!   ,ARPA:INET.H -
-!   ,SYS:TYPES.H -
-!   ,WINSOCK2.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,DECNET.H -
     ,LINE.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=DDCMP_SOCK_LINE.OBJ DDCMP_SOCK_LINE.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB DDCMP_SOCK_LINE.OBJ
       DELETE DDCMP_SOCK_LINE.OBJ;*

MMS$OLB.OLB(DECISION=DECISION.OBJ) depends_on -
      DECISION.C -
     ,ADJACENCY.H -
     ,AREA_FORWARDING_DATABASE.H -
     ,AREA_ROUTING_DATABASE.H -
     ,CIRCUIT.H -
     ,CONSTANTS.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(LIMITS=LIMITS.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDIO=STDIO.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,DECNET.H -
     ,FORWARDING_DATABASE.H -
     ,INIT_LAYER.H -
     ,MESSAGES.H -
     ,PLATFORM.H -
     ,ROUTING_DATABASE.H -
     ,TIMER.H -
     ,BASICTYPES.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,ETH_DECNET.H -
     ,LINE.H -
     ,PACKET.H -
     ,LOGGING.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,NODE.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=DECISION.OBJ DECISION.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB DECISION.OBJ
       DELETE DECISION.OBJ;*

MMS$OLB.OLB(DECNET=DECNET.OBJ) depends_on -
      DECNET.C -
     ,DECNET.H -
     ,PLATFORM.H -
     ,BASICTYPES.H -
     ,LOGGING.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,LINE.H -
     ,PACKET.H -
     ,TIMER.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=DECNET.OBJ DECNET.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB DECNET.OBJ
       DELETE DECNET.OBJ;*

MMS$OLB.OLB(DNS=DNS.OBJ) depends_on -
      DNS.C -
     ,BASICTYPES.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(CTYPE=CTYPE.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STRING=STRING.H) -
     ,DNS.H -
     ,PLATFORM.H -
     ,ROUTE20.H -
     ,SOCKET.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,LOGGING.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(FCNTL=FCNTL.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(IF=IF.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(NETDB=NETDB.H) -
-!   ,NETINET:IN.H -
-!   ,ARPA:INET.H -
     ,PACKET.H -
-!   ,SYS:TYPES.H -
-!   ,WINSOCK2.H -
     ,DECNET.H -
     ,LINE.H -
     ,TIMER.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=DNS.OBJ DNS.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB DNS.OBJ
       DELETE DNS.OBJ;*

MMS$OLB.OLB(ETH_CIRCUIT=ETH_CIRCUIT.OBJ) depends_on -
      ETH_CIRCUIT.C -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(MEMORY=MEMORY.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STRING=STRING.H) -
     ,DECNET.H -
     ,ETH_CIRCUIT.H -
     ,ETH_PCAP_LINE.H -
     ,ETH_SOCK_LINE.H -
     ,MESSAGES.H -
     ,NODE.H -
     ,PLATFORM.H -
     ,TIMER.H -
     ,LINE.H -
     ,PACKET.H -
     ,BASICTYPES.H -
     ,LOGGING.H -
     ,SOCKET.H -
     ,ADJACENCY.H -
     ,CONSTANTS.H -
     ,ETH_DECNET.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(FCNTL=FCNTL.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(IF=IF.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(NETDB=NETDB.H) -
-!   ,NETINET:IN.H -
-!   ,ARPA:INET.H -
-!   ,SYS:TYPES.H -
-!   ,WINSOCK2.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=ETH_CIRCUIT.OBJ ETH_CIRCUIT.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB ETH_CIRCUIT.OBJ
       DELETE ETH_CIRCUIT.OBJ;*

MMS$OLB.OLB(ETH_DECNET=ETH_DECNET.OBJ) depends_on -
      ETH_DECNET.C -
     ,ETH_DECNET.H -
     ,BASICTYPES.H -
     ,NODE.H -
     ,DECNET.H -
     ,LOGGING.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=ETH_DECNET.OBJ ETH_DECNET.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB ETH_DECNET.OBJ
       DELETE ETH_DECNET.OBJ;*

MMS$OLB.OLB(ETH_INIT_LAYER=ETH_INIT_LAYER.OBJ) depends_on -
      ETH_INIT_LAYER.C -
     ,ADJACENCY.H -
     ,CIRCUIT.H -
     ,CONSTANTS.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,DECNET.H -
     ,ETH_CIRCUIT.H -
     ,ETH_INIT_LAYER.H -
     ,MESSAGES.H -
     ,PLATFORM.H -
     ,TIMER.H -
     ,BASICTYPES.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,ETH_DECNET.H -
     ,LINE.H -
     ,PACKET.H -
     ,LOGGING.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,NODE.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=ETH_INIT_LAYER.OBJ ETH_INIT_LAYER.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB ETH_INIT_LAYER.OBJ
       DELETE ETH_INIT_LAYER.OBJ;*

MMS$OLB.OLB(ETH_PCAP_LINE=ETH_PCAP_LINE.OBJ) depends_on -
      ETH_PCAP_LINE.C -
-!   ,PCAP:BPF.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(CTYPE=CTYPE.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STRING=STRING.H) -
     ,ETH_DECNET.H -
     ,ETH_LINE.H -
     ,ETH_PCAP_LINE.H -
-!   ,PCAP.H -
     ,PLATFORM.H -
     ,ROUTE20.H -
     ,TIMER.H -
-!   ,WIN32-EXTENSIONS.H -
     ,BASICTYPES.H -
     ,NODE.H -
     ,LINE.H -
     ,PACKET.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STRINGS=STRINGS.H) -
     ,LOGGING.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,DECNET.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=ETH_PCAP_LINE.OBJ ETH_PCAP_LINE.C
       LIBRARY/REPLACE MMS$OLB.OLB ETH_PCAP_LINE.OBJ
       DELETE ETH_PCAP_LINE.OBJ;*

MMS$OLB.OLB(ETH_SOCK_LINE=ETH_SOCK_LINE.OBJ) depends_on -
      ETH_SOCK_LINE.C -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(MEMORY=MEMORY.H) -
     ,DNS.H -
     ,ETH_DECNET.H -
     ,ETH_SOCK_LINE.H -
     ,PLATFORM.H -
     ,ROUTE20.H -
     ,SOCKET.H -
     ,TIMER.H -
     ,BASICTYPES.H -
     ,NODE.H -
     ,ETH_CIRCUIT.H -
     ,PACKET.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,LOGGING.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(FCNTL=FCNTL.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(IF=IF.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(NETDB=NETDB.H) -
-!   ,NETINET:IN.H -
-!   ,ARPA:INET.H -
-!   ,SYS:TYPES.H -
-!   ,WINSOCK2.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,DECNET.H -
     ,LINE.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=ETH_SOCK_LINE.OBJ ETH_SOCK_LINE.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB ETH_SOCK_LINE.OBJ
       DELETE ETH_SOCK_LINE.OBJ;*

MMS$OLB.OLB(FORWARDING=FORWARDING.OBJ) depends_on -
      FORWARDING.C -
     ,ADJACENCY.H -
     ,AREA_FORWARDING_DATABASE.H -
     ,AREA_ROUTING_DATABASE.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(MEMORY=MEMORY.H) -
     ,FORWARDING.H -
     ,FORWARDING_DATABASE.H -
     ,MESSAGES.H -
     ,PACKET.H -
     ,PLATFORM.H -
     ,BASICTYPES.H -
     ,CIRCUIT.H -
     ,CONSTANTS.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,ETH_DECNET.H -
     ,DECNET.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,LINE.H -
     ,TIMER.H -
     ,NODE.H -
     ,LOGGING.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=FORWARDING.OBJ FORWARDING.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB FORWARDING.OBJ
       DELETE FORWARDING.OBJ;*

MMS$OLB.OLB(FORWARDING_DATABASE=FORWARDING_DATABASE.OBJ) depends_on -
      FORWARDING_DATABASE.C -
     ,CONSTANTS.H -
     ,FORWARDING_DATABASE.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=FORWARDING_DATABASE.OBJ FORWARDING_DATABASE.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB FORWARDING_DATABASE.OBJ
       DELETE FORWARDING_DATABASE.OBJ;*

MMS$OLB.OLB(INIT_LAYER=INIT_LAYER.OBJ) depends_on -
      INIT_LAYER.C -
     ,DDCMP_INIT_LAYER.H -
     ,ETH_INIT_LAYER.H -
     ,INIT_LAYER.H -
     ,MESSAGES.H -
     ,ADJACENCY.H -
     ,CIRCUIT.H -
     ,BASICTYPES.H -
     ,CONSTANTS.H -
     ,ETH_DECNET.H -
     ,PACKET.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,DECNET.H -
     ,LINE.H -
     ,TIMER.H -
     ,NODE.H -
     ,LOGGING.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=INIT_LAYER.OBJ INIT_LAYER.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB INIT_LAYER.OBJ
       DELETE INIT_LAYER.OBJ;*

MMS$OLB.OLB(LINE=LINE.OBJ) depends_on -
      LINE.C -
     ,DDCMP_SOCK_LINE.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STRING=STRING.H) -
     ,ETH_PCAP_LINE.H -
     ,ETH_SOCK_LINE.H -
     ,LINE.H -
     ,PLATFORM.H -
     ,DDCMP.H -
     ,DDCMP_CIRCUIT.H -
     ,PACKET.H -
     ,SOCKET.H -
     ,ETH_CIRCUIT.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,BASICTYPES.H -
     ,TIMER.H -
     ,DECNET.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(FCNTL=FCNTL.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(IF=IF.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(NETDB=NETDB.H) -
-!   ,NETINET:IN.H -
-!   ,ARPA:INET.H -
-!   ,SYS:TYPES.H -
-!   ,WINSOCK2.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,LOGGING.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=LINE.OBJ LINE.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB LINE.OBJ
       DELETE LINE.OBJ;*

MMS$OLB.OLB(LOGGING=LOGGING.OBJ) depends_on -
      LOGGING.C -
     ,LOGGING.H -
     ,PLATFORM.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,DECNET.H -
     ,LINE.H -
     ,PACKET.H -
     ,TIMER.H -
     ,BASICTYPES.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=LOGGING.OBJ LOGGING.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB LOGGING.OBJ
       DELETE LOGGING.OBJ;*

MMS$OLB.OLB(MESSAGES=MESSAGES.OBJ) depends_on -
      MESSAGES.C -
     ,ADJACENCY.H -
     ,AREA_ROUTING_DATABASE.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(MEMORY=MEMORY.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STRING=STRING.H) -
     ,DECNET.H -
     ,MESSAGES.H -
     ,PLATFORM.H -
     ,ROUTING_DATABASE.H -
     ,BASICTYPES.H -
     ,CIRCUIT.H -
     ,CONSTANTS.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,ETH_DECNET.H -
     ,LOGGING.H -
     ,PACKET.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,LINE.H -
     ,TIMER.H -
     ,NODE.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=MESSAGES.OBJ MESSAGES.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB MESSAGES.OBJ
       DELETE MESSAGES.OBJ;*

MMS$OLB.OLB(NETMAN=NETMAN.OBJ) depends_on -
      NETMAN.C -
     ,ADJACENCY.H -
     ,CONSTANTS.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(MEMORY=MEMORY.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STRING=STRING.H) -
     ,FORWARDING.H -
     ,NETMAN.H -
     ,NETMAN_MESSAGES.H -
     ,NSP.H -
     ,PLATFORM.H -
     ,ROUTING_DATABASE.H -
     ,BASICTYPES.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,ETH_DECNET.H -
     ,PACKET.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,DECNET.H -
     ,LINE.H -
     ,TIMER.H -
     ,NODE.H -
     ,LOGGING.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=NETMAN.OBJ NETMAN.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB NETMAN.OBJ
       DELETE NETMAN.OBJ;*

MMS$OLB.OLB(NETMAN_MESSAGES=NETMAN_MESSAGES.OBJ) depends_on -
      NETMAN_MESSAGES.C -
     ,BASICTYPES.H -
     ,MESSAGES.H -
     ,NETMAN_MESSAGES.H -
     ,PACKET.H -
     ,ADJACENCY.H -
     ,CONSTANTS.H -
     ,ETH_DECNET.H -
     ,DECNET.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,NODE.H -
     ,LOGGING.H -
     ,LINE.H -
     ,TIMER.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=NETMAN_MESSAGES.OBJ NETMAN_MESSAGES.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB NETMAN_MESSAGES.OBJ
       DELETE NETMAN_MESSAGES.OBJ;*

MMS$OLB.OLB(NODE=NODE.OBJ) depends_on -
      NODE.C -
     ,NODE.H -
     ,BASICTYPES.H -
     ,DECNET.H -
     ,LOGGING.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=NODE.OBJ NODE.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB NODE.OBJ
       DELETE NODE.OBJ;*

MMS$OLB.OLB(NSP=NSP.OBJ) depends_on -
      NSP.C -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(MEMORY=MEMORY.H) -
     ,FORWARDING.H -
     ,MESSAGES.H -
     ,NSP.H -
     ,NSP_MESSAGES.H -
     ,NSP_SESSION_CONTROL_PORT_DATABASE.H -
     ,PLATFORM.H -
     ,ROUTE20.H -
     ,ADJACENCY.H -
     ,BASICTYPES.H -
     ,CONSTANTS.H -
     ,ETH_DECNET.H -
     ,PACKET.H -
     ,DECNET.H -
     ,NSP_TRANSMIT_QUEUE.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,LOGGING.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,NODE.H -
     ,LINE.H -
     ,TIMER.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=NSP.OBJ NSP.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB NSP.OBJ
       DELETE NSP.OBJ;*

MMS$OLB.OLB(NSP_MESSAGES=NSP_MESSAGES.OBJ) depends_on -
      NSP_MESSAGES.C -
     ,BASICTYPES.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(MEMORY=MEMORY.H) -
     ,MESSAGES.H -
     ,NSP_MESSAGES.H -
     ,PACKET.H -
     ,ADJACENCY.H -
     ,CONSTANTS.H -
     ,ETH_DECNET.H -
     ,DECNET.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,NODE.H -
     ,LOGGING.H -
     ,LINE.H -
     ,TIMER.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=NSP_MESSAGES.OBJ NSP_MESSAGES.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB NSP_MESSAGES.OBJ
       DELETE NSP_MESSAGES.OBJ;*

MMS$OLB.OLB(NSP_SESSION_CONTROL_PORT_DATABA=NSP_SESSION_CONTROL_PORT_DATABASE.OBJ) depends_on -
      NSP_SESSION_CONTROL_PORT_DATABASE.C -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(MEMORY=MEMORY.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,NSP_SESSION_CONTROL_PORT_DATABASE.H -
     ,PLATFORM.H -
     ,BASICTYPES.H -
     ,DECNET.H -
     ,NSP_TRANSMIT_QUEUE.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,LOGGING.H -
     ,CONSTANTS.H -
     ,LINE.H -
     ,PACKET.H -
     ,TIMER.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=NSP_SESSION_CONTROL_PORT_DATABASE.OBJ NSP_SESSION_CONTROL_PORT_DATABASE.C $(ELN
)
       LIBRARY/REPLACE MMS$OLB.OLB NSP_SESSION_CONTROL_PORT_DATABASE.OBJ
       DELETE NSP_SESSION_CONTROL_PORT_DATABASE.OBJ;*

MMS$OLB.OLB(NSP_TRANSMIT_QUEUE=NSP_TRANSMIT_QUEUE.OBJ) depends_on -
      NSP_TRANSMIT_QUEUE.C -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(MEMORY=MEMORY.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,NSP_TRANSMIT_QUEUE.H -
     ,BASICTYPES.H -
     ,CONSTANTS.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=NSP_TRANSMIT_QUEUE.OBJ NSP_TRANSMIT_QUEUE.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB NSP_TRANSMIT_QUEUE.OBJ
       DELETE NSP_TRANSMIT_QUEUE.OBJ;*

MMS$OLB.OLB(PACKET=PACKET.OBJ) depends_on -
      PACKET.C -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDIO=STDIO.H) -
     ,PACKET.H -
     ,PLATFORM.H -
     ,BASICTYPES.H -
     ,DECNET.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,LOGGING.H -
     ,LINE.H -
     ,TIMER.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=PACKET.OBJ PACKET.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB PACKET.OBJ
       DELETE PACKET.OBJ;*

MMS$OLB.OLB(ROUTE20=ROUTE20.OBJ) depends_on -
      ROUTE20.C -
     ,ADJACENCY.H -
     ,CIRCUIT.H -
     ,DDCMP_INIT_LAYER.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDIO=STDIO.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STRING=STRING.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,DECISION.H -
     ,DECNET.H -
     ,DNS.H -
     ,FORWARDING.H -
     ,INIT_LAYER.H -
     ,LINE.H -
     ,MESSAGES.H -
     ,NODE.H -
-!   ,PCAP.H -
     ,PLATFORM.H -
     ,ROUTE20.H -
     ,ROUTING_DATABASE.H -
     ,SOCKET.H -
     ,TIMER.H -
     ,UPDATE.H -
     ,BASICTYPES.H -
     ,CONSTANTS.H -
     ,ETH_DECNET.H -
     ,PACKET.H -
     ,LOGGING.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(FCNTL=FCNTL.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(IF=IF.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(NETDB=NETDB.H) -
-!   ,NETINET:IN.H -
-!   ,ARPA:INET.H -
-!   ,SYS:TYPES.H -
-!   ,WINSOCK2.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=ROUTE20.OBJ ROUTE20.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB ROUTE20.OBJ
       DELETE ROUTE20.OBJ;*

MMS$OLB.OLB(ROUTING_DATABASE=ROUTING_DATABASE.OBJ) depends_on -
      ROUTING_DATABASE.C -
     ,CONSTANTS.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,NODE.H -
     ,ROUTING_DATABASE.H -
     ,BASICTYPES.H -
     ,DECNET.H -
     ,CIRCUIT.H -
     ,LOGGING.H -
     ,LINE.H -
     ,PACKET.H -
     ,TIMER.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=ROUTING_DATABASE.OBJ ROUTING_DATABASE.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB ROUTING_DATABASE.OBJ
       DELETE ROUTING_DATABASE.OBJ;*

MMS$OLB.OLB(SOCKET=SOCKET.OBJ) depends_on -
      SOCKET.C -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(ERRNO=ERRNO.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDIO=STDIO.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,PLATFORM.H -
     ,ROUTE20.H -
     ,SOCKET.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,LOGGING.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(FCNTL=FCNTL.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(IF=IF.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(NETDB=NETDB.H) -
-!   ,NETINET:IN.H -
-!   ,ARPA:INET.H -
     ,PACKET.H -
-!   ,SYS:TYPES.H -
-!   ,WINSOCK2.H -
     ,DECNET.H -
     ,LINE.H -
     ,TIMER.H -
     ,BASICTYPES.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=SOCKET.OBJ SOCKET.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB SOCKET.OBJ
       DELETE SOCKET.OBJ;*

MMS$OLB.OLB(TIMER=TIMER.OBJ) depends_on -
      TIMER.C -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(LIMITS=LIMITS.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,PLATFORM.H -
     ,TIMER.H -
     ,CIRCUIT.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,BASICTYPES.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,LOGGING.H -
     ,DECNET.H -
     ,LINE.H -
     ,PACKET.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=TIMER.OBJ TIMER.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB TIMER.OBJ
       DELETE TIMER.OBJ;*

MMS$OLB.OLB(UPDATE=UPDATE.OBJ) depends_on -
      UPDATE.C -
     ,ADJACENCY.H -
     ,AREA_ROUTING_DATABASE.H -
     ,CONSTANTS.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDLIB=STDLIB.H) -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(TIME=TIME.H) -
     ,MESSAGES.H -
     ,PACKET.H -
     ,PLATFORM.H -
     ,ROUTING_DATABASE.H -
     ,TIMER.H -
     ,UPDATE.H -
     ,BASICTYPES.H -
     ,CIRCUIT.H -
     ,ETH_DECNET.H -
     ,DECNET.H -
     ,SYS$LIBRARY:DECC$RTLDEF.TLB(STDARG=STDARG.H) -
     ,LOGGING.H -
     ,LINE.H -
     ,NODE.H -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=UPDATE.OBJ UPDATE.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB UPDATE.OBJ
       DELETE UPDATE.OBJ;*

MMS$OLB.OLB(VAXELN=VAXELN.OBJ) depends_on -
      VAXELN.C -
     !
       $(CC) $(CFLAGS)  $(LST) $(DBGOPT) $(DIA) /OBJ=VAXELN.OBJ VAXELN.C $(ELN)
       LIBRARY/REPLACE MMS$OLB.OLB VAXELN.OBJ
       DELETE VAXELN.OBJ;*


!==
!   Links
!==

ROUTE20.EXE depends_on -
      MMS$OLB.OLB(ADJACENCY=ADJACENCY.OBJ) -
     ,MMS$OLB.OLB(AREA_FORWARDING_DATABASE=AREA_FORWARDING_DATABASE.OBJ) -
     ,MMS$OLB.OLB(AREA_ROUTING_DATABASE=AREA_ROUTING_DATABASE.OBJ) -
     ,MMS$OLB.OLB(CIRCUIT=CIRCUIT.OBJ) -
     ,MMS$OLB.OLB(CONFIG=CONFIG.OBJ) -
     ,MMS$OLB.OLB(DDCMP=DDCMP.OBJ) -
     ,MMS$OLB.OLB(DDCMP_CIRCUIT=DDCMP_CIRCUIT.OBJ) -
     ,MMS$OLB.OLB(DDCMP_INIT_LAYER=DDCMP_INIT_LAYER.OBJ) -
     ,MMS$OLB.OLB(DDCMP_SOCK_LINE=DDCMP_SOCK_LINE.OBJ) -
     ,MMS$OLB.OLB(DECISION=DECISION.OBJ) -
     ,MMS$OLB.OLB(DECNET=DECNET.OBJ) -
     ,MMS$OLB.OLB(DNS=DNS.OBJ) -
     ,MMS$OLB.OLB(ETH_CIRCUIT=ETH_CIRCUIT.OBJ) -
     ,MMS$OLB.OLB(ETH_DECNET=ETH_DECNET.OBJ) -
     ,MMS$OLB.OLB(ETH_INIT_LAYER=ETH_INIT_LAYER.OBJ) -
     ,MMS$OLB.OLB(ETH_PCAP_LINE=ETH_PCAP_LINE.OBJ) -
     ,MMS$OLB.OLB(ETH_SOCK_LINE=ETH_SOCK_LINE.OBJ) -
     ,MMS$OLB.OLB(FORWARDING=FORWARDING.OBJ) -
     ,MMS$OLB.OLB(FORWARDING_DATABASE=FORWARDING_DATABASE.OBJ) -
     ,MMS$OLB.OLB(INIT_LAYER=INIT_LAYER.OBJ) -
     ,MMS$OLB.OLB(LINE=LINE.OBJ) -
     ,MMS$OLB.OLB(LOGGING=LOGGING.OBJ) -
     ,MMS$OLB.OLB(MESSAGES=MESSAGES.OBJ) -
     ,MMS$OLB.OLB(NETMAN=NETMAN.OBJ) -
     ,MMS$OLB.OLB(NETMAN_MESSAGES=NETMAN_MESSAGES.OBJ) -
     ,MMS$OLB.OLB(NODE=NODE.OBJ) -
     ,MMS$OLB.OLB(NSP=NSP.OBJ) -
     ,MMS$OLB.OLB(NSP_MESSAGES=NSP_MESSAGES.OBJ) -
     ,MMS$OLB.OLB(NSP_SESSION_CONTROL_PORT_DATABA=NSP_SESSION_CONTROL_PORT_DATABASE.OBJ) -
     ,MMS$OLB.OLB(NSP_TRANSMIT_QUEUE=NSP_TRANSMIT_QUEUE.OBJ) -
     ,MMS$OLB.OLB(PACKET=PACKET.OBJ) -
     ,MMS$OLB.OLB(ROUTE20=ROUTE20.OBJ) -
     ,MMS$OLB.OLB(ROUTING_DATABASE=ROUTING_DATABASE.OBJ) -
     ,MMS$OLB.OLB(SOCKET=SOCKET.OBJ) -
     ,MMS$OLB.OLB(TIMER=TIMER.OBJ) -
     ,MMS$OLB.OLB(UPDATE=UPDATE.OBJ) -
     ,MMS$OLB.OLB(VAXELN=VAXELN.OBJ) -
     !
       LINK $(DBG) $(PCAOPT)/NOSYSSHR/NOSYSLIB/NOUSERLIB /EXE=ROUTE20.EXE -
          MMS$OLB.OLB/LIBRARY/INCLUDE=(VAXELN) -
          + ELN$:CRTLSHARE/LIB -
          + RTLSHARE/LIB -
          +RTL/LIB -
          ! End of Link




!++
!   Files not found.  MMS references to these files will generate errors.
!==

!     PCAP:BPF.H
!     DBGHELP.H
!     NETINET:IN.H
!     ARPA:INET.H
!     PCAP.H
!     SYS:SELECT.H
!     SYS:STAT.H
!     STRSAFE.H
!     SYSLOG.H
!     TCHAR.H
!     SYS:TYPES.H
!     WIN32-EXTENSIONS.H
!     WINDOWS.H
!     WINSOCK2.H



!++
!   Objects not found.  The following symbols may be undefined.
!==

!     ACCEPT
!     ACTION
!     BPF_JUMP
!     BPF_STMT
!     CALLBACK
!     CANCELONESHOTTIMER
!     CLOSEHANDLE
!     CLOSESERVICEHANDLE
!     COMPARE
!     CREATEEVENT
!     CREATEONESHOTTIMER
!     CREATESERVICE
!     DEREGISTEREVENTSOURCE
!     DOWN
!     EVENTHANDLER
!     FCNTL
!     FD_ISSET
!     FD_SET
!     FD_ZERO
!     FINDFIRSTCHANGENOTIFICATION
!     FINDNEXTCHANGENOTIFICATION
!     FORK
!     FORMATMESSAGE
!     GETCURRENTDIRECTORY
!     GETCURRENTPROCESS
!     GETCURRENTTHREAD
!     GETEXCEPTIONCODE
!     GETHOSTBYNAME
!     GETLASTERROR
!     HTONS
!     IMMEDIATECALLBACK
!     IOCTLSOCKET
!     LINECLOSED
!     LINENOTIFYDATA
!     LINENOTIFYSTATECHANGE
!     LINEOPEN
!     LINEREADPACKET
!     LINESTART
!     LINESTOP
!     LINEWRITEPACKET
!     MAKEWORD
!     NOTIFYHALT
!     NOTIFYRUNNING
!     NTOHS
!     OPENSCMANAGER
!     PCAP_CLOSE
!     PCAP_FILENO
!     PCAP_FREEALLDEVS
!     PCAP_GETERR
!     PCAP_GETEVENT
!     PCAP_NEXT_EX
!     PROCESS
!     PROCESSHIGHERLEVELPROTOCOLPACKET
!     PSELECT
!     RECV
!     RECVFROM
!     REGISTEREVENTSOURCE
!     REGISTERSERVICECTRLHANDLER
!     REJECT
!     RESETEVENT
!     SEND
!     SENDDATA
!     SETCONSOLECTRLHANDLER
!     SETEVENT
!     SETSERVICESTATUS
!     SETSID
!     SOFTADJACENCYDOWN
!     STACKWALK64
!     START
!     STATECHANGECALLBACK
!     STOP
!     STRFTIME
!     STRINGCCHPRINTF
!     SYMINITIALIZE
!     SYMSETOPTIONS
!     SYSLOG
!     TEXT
!     TIMERCLEAR
!     TIMERHANDLER
!     UP
!     WAITEVENTHANDLER
!     WAITFORMULTIPLEOBJECTS
!     WRITEPACKET
!     WSAENUMNETWORKEVENTS
!     WSAGETLASTERROR
!     WSASTARTUP

!++
!  Create object library if it doesn't already exist
!==

.FIRST
	! MMS $(mmsqualifiers) $(mmstargets)
       IF F$SEARCH( "MMS$OLB.OLB" ) .EQS. "" -
		THEN $(LIBR)/CREATE MMS$OLB.OLB

!++
!  End of build cleanup work
!==

.LAST
       CONTINUE