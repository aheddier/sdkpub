s��        '�   p L  p   �   ����                               hp871x      hp871x                                        � � ��ViInt16     � ��ViPInt16     
�  	ViInt16 []  �  � ��ViInt32     � ��ViPInt32     
�  	ViInt32 []  � � ��ViReal64     	� 	��ViPReal64     �  
ViReal64 []     � ��ViString     	� 	��ViBoolean     
� 
��ViPBoolean     � 	 ViBoolean []     � ��ViRsrc     	� 	��ViSession     � ��ViStatus     � ��ViPChar     	�  ViChar []  � � ��ViUInt16  � � ��ViUInt32     	�  ViInt16[]     	�  ViInt32[]     
�  	ViReal64[]     �  ViChar[]       	 
ViBoolean[]   �    hp871x Instrument Driver
Copyright @1998, Hewlett-Packard Company

This driver is compatible with the HP 8711A/B/C, HP 8712B/C/E, HP 8713B/C and HP 8714B/C/E Network Analyzers.

     b    Functions which provide access to system-related features of the instrument can be found here.

     0    The functions related to Averaging are here.

     2    The functions related to Calibration are here.

     /    The functions related to Stimulus are here.

     5    The functions related to Sweep settings are here.

     C    The functions related to the network analyzer Display are here.

     .    The functions related to Markers are here.

     C    The functions related specifically to the Measurement are here.

     K    The functions related to the instrument state Save and Recall are here.

     6    The functions related to Scale Reference are here.

     9    The functions related to Array (Trace) Data are here.

     ?    The functions related to Fault Location (Opt 100) are here.

     -    The functions related to Limits are here.

     ;    The functions related to User Interface (I/O) are here.

     1    The functions related to Mass Storage are here.     Q    The functions related to Control of data ports and IBASIC Programming are here.     �    Utility functions perform several standard P&P tasks and a variety of HP utility tasks.  They also include HP's instrument command passthrough functions which allow generic access to the instrument's command set.
     �    HP's instrument command passthrough functions.

These functions pass commands directly to the instrument, thus allowing generic access to the instrument's command set.
     _    Functions which perform tasks that do not require communication with the instrument are here.     �    The initialize function initializes the software connection to the instrument and optionally verifies that instrument is in the system.  In addition, it may perform any necessary actions to place the instrument in its reset state.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     �    [INPUT PARAMETER]

The instrument's VISA resource description.

The default for this instrument is "GPIB0::16::INSTR".  If you change the HPIB address of this instrument, you must change the default resource description as well.
     �    [INPUT PARAMETER]

If VI_TRUE, perform a revision query to verify that the intrument is the one expected by the driver.

If VI_FALSE, do not perform a revision query.
     �    [INPUT PARAMETER]

If VI_TRUE, perform a reset operation while initializing the instrument.

If VI_FALSE, do not perform a reset operation.
     �    [OUTPUT PARAMETER]

The instrument's VISA session handle.  This is VI_NULL if an error occurred during the initialization process.
    
k
o���  �    Status                            K 7 .  �  �    Resource Name                     : 7# �       ID Query                          � 7� �       Reset Device                      � �o �  �    Instrument Handle                  	           "GPIB0::16::INSTR"  % Do Query VI_TRUE Skip Query VI_FALSE  #  Reset VI_TRUE Don't Reset VI_FALSE    	           b    PURPOSE : This function will preset the analyzer and wait for
          completion of preset.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that basically tells the function what to
          do.  If preset type = "default" (case insensitive), a
          typical preset is performed.  If preset type =
          "factory" (case insensitive), a preset is performed
          and the power level and preset power level are both
          set to 0 dBm.  On 8711A and 871xB, only "default" is
          allowed!
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    �    PARAM 2 : ViString request  
IN        The string that basically tells the function what to
          do.  If preset type = "default" (case insensitive), a
          typical preset is performed.  If preset type =
          "factory" (case insensitive), a preset is performed
          and the power level and preset power level are both
          set to 0 dBm.  On 8711A and 871xB, only "default" is
          allowed!
    �����  }    Error                             � "  �       vi                                � @ � ��      request                         ���� { <��                                            	           0               JDEFAULT PRESET hp871x_PRESET_DEFAULT FACTORY PRESET hp871x_PRESET_FACTORY    %Factory Preset not valid on 871x A/B   -    PURPOSE : Sets or reads various clock related parameters.
          Allows user to modify how the time/date stamp appears
          in any printed output.  Allows user to read date or
          time.  Also allows user to synchronize the 871x clock
          to the computer's internal (but not vice versa).  
          This function is Year-2000 compliant.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViString clock_data  
IN        Contains the desired date or time as needed by
          request.  Year must be 4 digits, specified as Year,
          Month, Day - separated by commas 
          (e.g. "1998, 12, 31").  Time is in 24 hour format,
          must be specified as Hour, Minutes, Seconds -
          separated by commas (e.g. "23, 59, 59").

PARAM 4 : ViPString cur_clock  
OUT       When request is a query, contains date or time as
          requested.  Always returns data in the same format as
          the clock_data input parameter (with no spaces).
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     �    PARAM 4 : ViPString cur_clock  
OUT       When request is a query, contains date or time as
          requested.  Always returns data in the same format as
          the clock_data input parameter (with no spaces).
    &    PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    m    PARAM 3 : ViString clock_data  
IN        Contains the desired date or time as needed by
          request.  Year must be 4 digits, specified as Year,
          Month, Day - separated by commas 
          (e.g. "1998, 12, 31").  Time is in 24 hour format,
          must be specified as Hour, Minutes, Seconds -
          separated by commas (e.g. "23, 59, 59").
    <����  }    Error                             � "  �       vi                                3 9� �       cur_clock                          9 & � �    request                           B p & �       clock_data                         	           0    	                    
  �SET DATE FORMAT TO YEAR-MONTH-DAY hp871x_CLK_YMD SET DATE FORMAT TO MONTH-DAY-YEAR hp871x_CLK_MDY SET DATE FORMAT TO DAY-MONTH-YEAR hp871x_CLK_DMY SHOW MONTH IN ALPHA FORMAT hp871x_CLK_ALPHA SHOW MONTH IN NUMERIC FORMAT hp871x_CLK_NUMERIC SET DATE hp871x_CLK_DATE QUERY DATE hp871x_CLK_DATE_Q SET TIME hp871x_CLK_TIME QUERY TIME hp871x_CLK_TIME_Q SYNCHRONIZE ANALYZER TO PC CLOCK hp871x_CLK_SYNC    ""   �    PURPOSE : Selects one of several types of beeps to be emitted
          from the analyzer.  The analyzer can produce a range
          of frequencies from its speaker, but the volume tends
          to be low except at its resonant frequency of about
          1900 Hz.  Therefore, most of the available beeps in
          this function that represent an error condition use
          this approximate frequency.  This function provides 
          an assortment that should be sufficient for most
          purposes.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    '����  }    Error                             '� "  �       vi                                ( - ��      request                            	           0              �DEFAULT BEEP (520 Hz, .25 sec) hp871x_BEEP_DEFAULT PROMPT BEEP (300 Hz, .1 sec) hp871x_BEEP_PROMPT BEEP TWICE (600 Hz, .1 sec each) hp871x_BEEP_DOUBLE ERROR BEEP (2000 Hz, .1 sec) hp871x_BEEP_ERROR FATAL ERROR BEEP (1900 Hz, .5 sec) hp871x_BEEP_FATAL CHIRP (2100 Hz, .01 sec) hp871x_BEEP_CHIRP OK BEEP (1800 Hz, .1 sec; 300 Hz, .1 sec) hp871x_BEEP_OK ALERT BEEP (1850 Hz, .08 sec, four beeps) hp871x_BEEP_ALERT   a    PURPOSE : Sets or reads the System impedance or Smith Chart
          nominal impedance.  Smith chart impedance can only be
          set on phase capable analyzers.  System impedance
          cannot be set on 8711A or 871xB or on any analyzer
          with firmware revision less than 4.50. (4.51 or 
          higher is recommended).  

          While both Smith chart impedance and System impedance
          can be set separately, setting the System impedance
          will overwrite the Smith chart impedance (i.e. it 
          sets both).  System impedance can only be set to 50 
          or 75 ohms.  Changing a 50 ohm analyzer to 75 ohms
          impedance will allow the use of a 75 ohm Cal kit, and
          vice-versa.  Smith chart nominal values can be
          anything.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViReal64 impedance
IN        Desired impedance to be set.

PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 4 : ViPReal64 cur_imp 
OUT       Returns current System or Smith Chart nominal
          impedance as queried by request.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     F    PARAM 2 : ViReal64 impedance
IN        Desired impedance to be set.
     �    PARAM 4 : ViPReal64 cur_imp 
OUT       Returns current System or Smith Chart nominal
          impedance as queried by request.
    $    PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    0�����  }    Error                             1� "  �       vi                                1� E � �      impedance                         29 E� �       cur_imp                           2� E � ��      request                            	           0 ?�      �                                    	                      �SET SYSTEM Z0 hp871x_SYSTEM_Z0 SET SMITH CHART Z0 hp871x_SMITH_Z0 QUERY SYSTEM Z0 hp871x_SYSTEM_Z0_Q QUERY SMITH CHART Z0 hp871x_SMITH_Z0_Q   >    PURPOSE : Reads the model number, serial number, or revision of
          the analyzer.  The user may request any one of these
          parameters.  In addition, the firmware revision may 
          be read as a numeric value, so that numeric
          comparisons can easily be made.  This is useful if
          using a particular feature that is only in firmware
          X.XX or above.  This is an enhancement of the
          hp871x_revision_query function.  Also available is the 
          the ability to easily check for various installed
          options and configurations.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViPString cur_ID  
OUT       Contains the requested part of the instrument's
          identification string.

PARAM 3 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 4 : ViPReal64 ID_status
OUT       Depending upon request, returns the firmware revision
          as a numeric value, min or max analyzer frequency, or
          current state of requested option (0= No or not
          installed; 1=Yes).
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     z    PARAM 2 : ViPString cur_ID  
OUT       Contains the requested part of the instrument's
          identification string.
    &    PARAM 3 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     t    PARAM 4 : ViPReal64 ID_status
OUT       Upon request, returns the firmware revision as a
          numeric value.
    ;!����  }    Error                             ;� "  �       vi                                < %� �       cur_ID                            <� % 3 � �    request                           =� � �       ID_status                          	           0    	                      �MODEL NUMBER? hp871x_MODEL_Q SERIAL NUMBER? hp871x_SERIAL_Q FIRMWARE REVISION? hp871x_REVISION_Q FIRMWARE REVISION NUMBER? hp871x_REV_VALUE_Q MULTIPORT ID? hp871x_MP_ID_Q ANALYZER MAXIMUM FREQUENCY? hp871x_MAXFREQ_Q ANALYZER MINIMUM FREQUENCY? hp871x_MINFREQ_Q ATTENUATOR INSTALLED? hp871x_ATTEN_Q LAN INSTALLED? hp871x_LAN_Q IBASIC INSTALLED? hp871x_IBASIC_Q FAULT LOCATION INSTALLED? hp871x_FAULT_Q SRL INSTALLED? hp871x_SRL_Q 50 OHM UNIT? hp871x_50_Q 75 OHM UNIT? hp871x_75_Q AM DELAY INSTALLED? hp871x_AM_Q    	          �    PURPOSE : Sets or returns current averaging value or status  
          (ON/OFF) or restarts averaging.
          Setting any nonzero avg value turns averaging on.
          Setting avg value of 0 turns averaging off.  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViInt32 avg_set
IN        Averaging Factor to set (or ON/OFF indicator OFF=0,
          ON=1)

PARAM 3 : ViString request 
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 4 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  

PARAM 5 : ViPInt32 cur_avg  
OUT       When request is a query, this indicates current avg
          factor (or ON/OFF indicator OFF=0, ON=1)  
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     j    PARAM 2 : ViInt32 avg_set
IN        Averaging Factor to set (or ON/OFF indicator OFF=0,
          ON=1)
     L    PARAM 4 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  
     �    PARAM 5 : ViPInt32 cur_avg  
OUT       When request is a query, this indicates current avg
          factor (or ON/OFF indicator OFF=0, ON=1)  
    %    PARAM 3 : ViString request 
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    E2����  }    Error                             E� "  �       vi                                F) * ~ ��      avg_set                           F� �5 ��      channel                           F� *� �  K    cur_avg                           G� *7 ��      request                         ����   .��                                            	           0              �0 hp871x_AVGFACT_0 1 hp871x_AVGFACT_1 2 hp871x_AVGFACT_2 4 hp871x_AVGFACT_4 8 hp871x_AVGFACT_8 16 hp871x_AVGFACT_16 32 hp871x_AVGFACT_32 64 hp871x_AVGFACT_64               Channel 1 1 Channel 2 2    	                       �SET AVERAGING hp871x_AVG_FACTOR QUERY AVG FACTOR hp871x_AVG_FACTOR_Q QUERY AVG STATUS hp871x_AVG_STATUS_Q AVG RESTART hp871x_AVG_RESTART    
0=Avg Off   �    PURPOSE : Sets or returns current IF bandwidth
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViReal64 bandwidth  
IN        Contains the bandwidth in Hz to be set.  

PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    
PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  Usually not
          needed.  

PARAM 5 : ViInt32 cur_bw 
OUT       When request is a query, this indicates current
          bandwidth.   
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     U    PARAM 2 : ViReal64 bandwidth  
IN        Contains the bandwidth in Hz to be set.  
     k    PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  Usually not
          needed.  
     j    PARAM 5 : ViInt32 cur_bw 
OUT       When request is a query, this indicates current
          bandwidth.    $    PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    N�����  }    Error                             OF "  �       vi                                O� ( ^ ��      bandwidth                         O� u � ��      channel                           Pp (� �       cur_bw                            P� ( � ��      request                            	           0              r15 hp871x_BW_15 250 hp871x_BW_250 1200 hp871x_BW_1200 3700 hp871x_BW_3700 4000 hp871x_BW_4000 6500 hp871x_BW_6500               Channel 1 1 Channel 2 2    	         $ SET BW hp871x_SET QUERY BW hp871x_Q   �    PURPOSE : Sets the current Group Delay aperture as a percent of
          frequency span, or actual frequency in Hz.  If the
          value of the variable aperture is less than 100, it
          is assumed to be a percent of current frequency span.
          If aperture is greater than 100, it is assumed to be
          the actual frequency in Hz.  If queried, this 
          function will return either percent or frequency
          depending upon request.  

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViReal64 aperture
IN        Sets the aperture window in either percent or
          frequency (Hz).  If >100 it is assumed to be
          frequency; If <100 it is assumed to be percent.
          Analyzer will round value to nearest acceptable 
          value.  Percent must be between 0.5 and 20%; 
          likewise, frequency must be between 0.5 and 20% of
          span.  This variable is not used (but must be passed)
          if reading the current value.

PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 4 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  

PARAM 5 : ViPReal64 cur_aperture 
OUT       Returns current aperture in percent or Hz as queried
          by request.  Note that percent values are in actual
          percent; not in unit decimal form (e.g. for 5%, the
          returned value is 5; not .05).
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    �    PARAM 2 : ViReal64 aperture
IN        Sets the aperture window in either percent or
          frequency (Hz).  If >100 it is assumed to be
          frequency; If <100 it is assumed to be percent. 
          Analyzer will round value to nearest acceptable value. 
          Percent must be between 0.5 and 20%; likewise,
          frequency must be between 0.5 and 20% of span.  This
          variable is not used (but must be passed) if reading
          the current value.
     L    PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  
        PARAM 5 : ViPReal64 cur_aperture 
OUT       Returns current aperture in percent or Hz as queried
          by request.  Note that percent values are in actual
          percent; not in unit decimal form (e.g. for 5%, the
          returned value is 5; not .05).
    $    PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    Z�����  }    Error                             [b "  �       vi                                [� ~ a �      aperture                          ]� v ��      channel                           ]� -� �       cur_aperture                      _ - ��      request                         ���� � 6��                                            	           0 ?�      �              @                               Channel 1 1 Channel 2 2    	                      |SET APERTURE hp871x_APERTURE_SET QUERY FREQUENCY APERTURE hp871x_APERTURE_HZ_Q QUERY PERCENT APERTURE hp871x_APERTURE_PCT_Q    bAperture values below 100 are 
assumed to be in percent.  Valid 
percent range is from 0.5 to 20%   -    PURPOSE : Performs various calibration functions such as cal
          save and abort cal, as well as selecting a user cal or
          default cal. 

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2).  

PARAM 4 : ViPString cal_type  
OUT       When request is a query, indicates current calibration
          type ("FULL", "USER" or "DEF"), current cal class, or
          cal status (see help file).
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     �    PARAM 4 : ViPString cal_type  
OUT       When request is a query, indicates current calibration
          type ("FULL", "USER" or "DEF").
    &    PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     L    PARAM 3 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  
    f9 �����  }    Error                             f�4   �       vi                                g0 1� �       cal_type                          g� 1 H �      request                           h� � � ��      channel                            	           0    	                     iFULL BAND CAL hp871x_CAL_FULL USER-DEFINED CAL hp871x_CAL_USER DEFAULT CAL hp871x_CAL_DEFAULT DEFAULT ONE PORT CAL hp871x_CAL_DEFAULT1 DEFAULT TWO PORT CAL hp871x_CAL_DEFAULT2 SAVE CAL hp871x_CAL_SAVE ABORT CAL hp871x_CAL_ABORT REFLECTION ONE PORT CAL hp871x_CAL_REFL USER RESPONSE CAL hp871x_CAL_TRANS_1 USER RESPONSE & ISOLATION CAL hp871x_CAL_TRANS_2 USER ENHANCED RESPONSE CAL hp871x_CAL_TRANS_3 USER TWO PORT CAL hp871x_CAL_TWO_PORT TEST SET CAL hp871x_CAL_TEST_1 CAL ON hp871x_ON CAL OFF hp871x_OFF QUERY ACTIVE CAL TYPE hp871x_CAL_TYPE_Q QUERY CAL CLASS hp871x_CAL_CLASS_Q QUERY CAL STATUS hp871x_CAL_STATUS_Q               Channel 1 1 Channel 2 2   }    PURPOSE : Sets or reads the active calibration kit.  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViPString cur_kit  
OUT       When request is a query, indicates current active
          calibration kit ("N50F", "N50M", "3.5", "USER",
          "N75F", "N75M", "APC-7" or "F75").
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     �    PARAM 3 : ViPString cur_kit  
OUT       When request is a query, indicates current active
          calibration kit ("N50F", "N50M", "3.5", "USER",
          "N75F", "N75M" or "F75").
    &    PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
        PARAM 3 : ViInt32 mp1 
IN        Contains data for selected request.  Port numbers
          can range from 1 to maximum number of ports, and mp1
          is for REFL port selection only.  
          Unlike most units, timer values must be specified 
          in minutes.
    o� ����  }    Error                             p- "  �       vi                                p� 0� �       cur_kit                           qI 0 � ��      request                           rw 0 � �      port_num                           	           0    	                    	  >TYPE N, 50 OHM, FEMALE hp871x_CALKIT_N50F TYPE N, 50 OHM, MALE hp871x_CALKIT_N50M 3.5 MM,  50 OHM hp871x_CALKIT_3_5 APC-7, 50 OHM hp871x_CALKIT_APC7 USER hp871x_CALKIT_USER TYPE N, 75 OHM, FEMALE hp871x_CALKIT_N75F TYPE N, 75 OHM, MALE hp871x_CALKIT_N75M TYPE F, 75 OHM hp871x_CALKIT_F75 QUERY ACTIVE CAL KIT hp871x_Q                       �    PURPOSE : Performs part of the actual calibration by using one 
          of seven possible standards.  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        String that tells the function which calibration
          standard to use.

PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2).  
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     M    PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2).  
     u    PARAM 2 : ViString request  
IN        String that tells the function which calibration
          standard to use.
    w�w���  }    Error                             xL "  �       vi                                x� 31 ��      channel                           x� 3 � ��      request                            	           0               Channel 1 1 Channel 2 2               �STANDARD 1 hp871x_CAL_STAN_1 STANDARD 2 hp871x_CAL_STAN_2 STANDARD 3 hp871x_CAL_STAN_3 STANDARD 4 hp871x_CAL_STAN_4 STANDARD 5 hp871x_CAL_STAN_5 STANDARD 6 hp871x_CAL_STAN_6 STANDARD 7 hp871x_CAL_STAN_7   `    PURPOSE : Selects the type of calibration to be performed.  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        String that tells the function what type of
          calibration to perform.

PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2).  
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     M    PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2).  
     w    PARAM 2 : ViString request  
IN        String that tells the function what type of
          calibration to perform.
    |�y���  }    Error                             }c "  �       vi                                }� � � ��      channel                           ~ + � ��      request                         ���� @ ���                                            	           0               Channel 1 1 Channel 2 2               �RESPONSE hp871x_CAL_RESPONSE RESPONSE AND ISOLATION hp871x_CAL_RESP_ISOL ENHANCED RESPONSE hp871x_CAL_ENH_RESP TWO PORT hp871x_CAL_TWO_PORT REFLECTION hp871x_CAL_REFLECTION NORMALIZE hp871x_NORMALIZE    OEnhanced Response not valid on 871x A/B.
Two Port Cal not valid on 871x A/B/C.   o    PURPOSE : This special function is a combination of several 
          other functions (hp871x_calType, hp871x_calMeasure 
          and hp871x_calControl) that, together, perform a
          complete measurement calibration.  This frees the
          programmer from having to deal with all the minute
          details of a calibration; all that must be provided 
          is the type of calibration desired (and channel
          number, if not on the default channel 1.)  The abort
          value must also be read in.

          This function will step the user through a 
          calibration by prompting for the proper standards,
          waiting for that standard to be connected, then
          measuring that standard by taking the necessary 
          number of sweeps.  It then prompts the user for the
          next standard, if any, and repeats until all 
          standards are done.  Finally, it stores the
          calibration and activates it.

          All prompting of the user is done on the analyzer's
          display.  Once the standard is connected, the user is
          prompted to press a softkey on the analyzer labeled
          "Measure Standard."  When the entire process is
          complete, the function exits; no computer control is
          available until this process completes. A user Abort
          key is also provided.  If Abort is pressed, the 
          function exits the abort variable will equal 1. 

          In most cases, the default prompting messages are
          sufficient.  This prompts the user to connect a
          specific standard, and then press the softkey 
          "Measure Standard."  However, it may sometimes be 
          necessary to provide more information or other
          instructions.  In this case, the programmer can
          provide their own message for the first prompt only! 
          Performing an Open/Short/Load reflection cal, for
          example, the programmer may need to prompt the user 
          to "Connect the Open to the end of the cable that is
          connected to device X using precision adapter Z, then
          press Measure Standard."  The programmer can
          substitute this prompt, if desired.  Subsequent
          prompts, for the Short and Load, will still have the
          default message, but it should be obvious to the user
          that the Short and Load are to be connected to the
          same point.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        Selects the desired type of calibration to be
          performed.

PARAM 3 : ViInt32 abort  
IN        Indicates if user pressed the Abort Cal softkey.  

PARAM 4 : ViInt32 channel  
IN        Indicates channel number (1 or 2).  

PARAM 5 : ViString prompt  
OUT       Specifies a user prompt message not to exceed 250
          characters.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     L    PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  
     p    PARAM 4 : ViString prompt  
OUT       Specifies a user prompt message not to exceed 250
          characters.
     l    PARAM 2 : ViString request  
IN        Selects the desired type of calibration to be
          performed.
     �    PARAM 3 : ViPInt32 abortcal  
OUT       Value is normally 0 unless the user presses the 
          Abort Cal softkey, in which case the value is 1.  
    �r����  }    Error                             � "  �       vi                                �i ,t ��      channel                           �� �  � �    prompt                            �5 , ��      request                         ���� �2��                                         ���� � A��                                           �� +� �  K    abortcal                           	           0               Channel 1 1 Channel 2 2    ""               �RESPONSE (THRU) CALIBRATION hp871x_CAL_RESPONSE RESPONSE AND ISOLATION CALIBRATION hp871x_CAL_RESP_ISOL ENHANCED RESPONSE CALIBRATION hp871x_CAL_ENH_RESP TWO PORT CALIBRATION hp871x_CAL_TWO_PORT ONE-PORT (REFLECTION) CALIBRATION hp871x_CAL_REFLECTION    (optional)    OEnhanced Response not valid on 871x A/B.
Two Port Cal not valid on 871x A/B/C.    	           &    PURPOSE : This function turns on/off the broadband detector
          autozero feature.  A manual zero can also be performed
          at any time.  Performing a manual zero will also turn
          off autozero if currently on.  Query of autozero
          on/off status is also allowed. 
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViPInt32 az_status  
OUT       When request is a query, returns current autozero
          status (1=ON, 0=OFF).    
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     �    PARAM 3 : ViPInt32 az_status  
OUT       When request is a query, returns current autozero
          status (1=ON, 0=OFF).    

    ������  }    Error                             �p "  �       vi                                �� 4 � ��      request                           �� 4� �       az_status                          	           0              UON hp871x_ON OFF hp871x_OFF ONCE hp871x_AUTOZERO_ONCE QUERY AUTOZERO ON/OFF hp871x_Q    	           -    PURPOSE : Sets or returns current start/stop or CW/dF
          frequencies.  If dF is 0, then analyzer is set to CW.
          Values passed to the function are assumed to be Hz.  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViReal64 freq1 
IN        Contains the Start or CW freq to be set.  

PARAM 3 : ViReal64 freq2  
IN        Contains the Stop or dF freq to be set.  

PARAM 4 : ViString request    
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
           
PARAM 5 : ViInt32 channel  
IN        Indicates channel number (1 or 2).   
 
PARAM 6 : ViReal64 cur_freq1 
OUT       When request is a query, this indicates the current
          Start or CW freq.  

PARAM 7 : ViReal64 cur_freq2  
OUT       When request is a query, this indicates the current
          Stop or dF freq.  
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     Q    PARAM 2 : ViReal64 freq1 
IN        Contains the Start or CW freq to be set.  
     N    PARAM 5 : ViInt32 channel  
IN        Indicates channel number (1 or 2).   
     |    PARAM 6 : ViReal64 cur_freq1 
OUT       When request is a query, this indicates the current
          Start or CW freq.  
    (    PARAM 4 : ViString request    
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     Q    PARAM 3 : ViReal64 freq2  
IN        Contains the Stop or dF freq to be set.  
     |    PARAM 7 : ViReal64 cur_freq2  
OUT       When request is a query, this indicates the current
          Stop or dF freq.  
    �
����  }    Error                             �� "  �       vi                                � * � �      freq1                             �Z � � ��      channel                           �� *� �       cur_freq1                         �4 * � ��      request                           �d  � �      freq2                             �� � �       cur_freq2                       ���� A ���                                         ���� � ���                                         ���� � c��                                            	           0 ?�      B�_    @È     A.��                             Channel 1 1 Channel 2 2    	                      dSTART/STOP hp871x_START_STOP START/STOP? hp871x_START_STOP_Q CW / DELTA F hp871x_CW CW? hp871x_CW_Q ?�      B�_    @È     A��e                  	           Start or CW    Stop or dF    JSetting CW/Delta F with a span (dF) 
of zero, places analyzer in CW mode.   �    PURPOSE : This function can be used: 
          1) To set or return current power level (dBm ONLY!)  
          2) To set or return current preset power level (dBm  
             ONLY!) 
          3) To query or turn on/off RF power status
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViReal64 power  
IN        Contains the power level in dBm to be set.  

PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    
PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  Usually not
          needed.  

PARAM 5 : ViInt32 cur_power 
OUT       When request is a query, this indicates power level or
          RF status (1=ON 0=OFF)   
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     T    PARAM 2 : ViReal64 power  
IN        Contains the power level in dBm to be set.  
     k    PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  Usually not
          needed.  
     �    PARAM 5 : ViInt32 cur_power 
OUT       When request is a query, this indicates power level or
          RF status (1=ON 0=OFF)   
    $    PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    �� �����  }    Error                             �h "  �       vi                                �� * ; �      power                             � � q ��      channel                           �� *� �       cur_power                         � * ��      request                            	           0 ?�      @>      �V�                                      Channel 1 1 Channel 2 2    	                      �POWER LEVEL hp871x_POW_LVL POWER LEVEL? hp871x_POW_LVL_Q PRESET LEVEL hp871x_PRESET_LVL PRESET LEVEL? hp871x_PRESET_LVL_Q RF OFF hp871x_OFF RF ON hp871x_ON RF ON/OFF? hp871x_RF_Q   �    PURPOSE : Sets or returns power sweep ON/OFF status, start/stop
          levels or power range.  

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViReal64 pwrSwp_val1
IN        Value to be set. 

PARAM 4 : ViReal64 pwrSwp_val2
IN        Value to be set. 

PARAM 5 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  

PARAM 6 : ViPReal64 cur_pwrSwp1 
OUT       When request is a query, returns current power sweep
          status (1=ON, 0=OFF), power range, or start power
          level. 

PARAM 7 : ViPReal64 cur_pwrSwp2 
OUT       When request is a query, returns stop power level. 
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     =    PARAM 3 : ViReal64 pwrSwp_val1
IN        Value to be set. 
     k    PARAM 5 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  Usually not
          needed.  
     �    PARAM 6 : ViPReal64 cur_pwrSwp1 
OUT       When request is a query, returns current power sweep
          status (1=ON, 0=OFF), power range, or start power
          level. 
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     =    PARAM 4 : ViReal64 pwrSwp_val2
IN        Value to be set. 
     a    PARAM 7 : ViPReal64 cur_pwrSwp2 
OUT       When request is a query, returns stop power level. 
    �x����  }    Error                             � "  �       vi                                �o " �      pwrSwp_val1                       �� � � ��      channel                           �' "� �       cur_pwrSwp1                       �� " � ��      request                           � c �      pwrSwp_val2                       �P c� �       cur_pwrSwp2                     ���� � :��                                         ���� 6	��                                         ���� w��                                            	           0 ?�      �      ��                                       Channel 1 1 Channel 2 2    	                     POWER SWEEP ON hp871x_ON POWER SWEEP OFF hp871x_OFF START/STOP POWER LEVELS hp871x_PWRSWP_START_STOP SET POWER RANGE hp871x_PWRSWP_RANGE QUERY PWR SWP ON/OFF STATUS hp871x_PWRSWP_STATUS_Q QUERY START AND STOP POWER hp871x_PWRSWP_START_STOP_Q QUERY POWER RANGE hp871x_PWRSWP_RANGE_Q ?�      �      ��                            	           sValid values for power range are:  0, +10, +20, +30, +40, 
+50, +60 and are only valid if attenuator is installed.    Start or Range    Stop    �    PURPOSE : Sets or returns current number of points  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViInt32 points  
IN        Number of points to set    

PARAM 3 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 4 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  

PARAM 5 : ViPInt32 cur_points  
OUT       When request is a query, this indicates the current #
          of points 
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     C    PARAM 2 : ViInt32 points  
IN        Number of points to set    
     L    PARAM 4 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  
     w    PARAM 5 : ViPInt32 cur_points  
OUT       When request is a query, this indicates the current #
          of points 
    &    PARAM 3 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    �& �����  }    Error                             �� "  �       vi                                � * W ��      points                            �h � � ��      channel                           �� *� �       cur_points                        �; * � ��      request                            	           0           
   �3 hp871x_PTS_3 5 hp871x_PTS_5 11 hp871x_PTS_11 21 hp871x_PTS_21 51 hp871x_PTS_51 101 hp871x_PTS_101 201 hp871x_PTS_201 401 hp871x_PTS_401 801 hp871x_PTS_801 1601 hp871x_PTS_1601               Channel 1 1 Channel 2 2    	                       ,SET POINTS hp871x_SET QUERY POINTS hp871x_Q   K    PURPOSE : Sets or reads spur avoidance state.  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViPString spur_status  
OUT       When request is a query, indicates current spur
          avoidance state ("NONE", "AVOID" or "DITHER").
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     �    PARAM 3 : ViPString spur_status  
OUT       When request is a query, indicates current spur
          avoidance state ("NONE", "AVOID" or "DITHER").
    &    PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    �:����  }    Error                             �� "  �       vi                                �1 -� �       spur_status                       �� - � ��      request                            	           0    	                      fNO SPUR AVOIDANCE hp871x_NONE AVOID hp871x_AVOID DITHER hp871x_DITHER QUERY SPUR AVOID STATE hp871x_Q   \    PURPOSE : Set or read reference oscillator source selection. 
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViPInt32 refOsc_status  
OUT       When request is a query, returns 1 if reference
          oscillator source is external, 0 if internal.    
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     �    PARAM 3 : ViPInt32 refOsc_status  
OUT       When request is a query, returns 1 if reference
          oscillator source is external, 0 if internal.    
    ������  }    Error                             �e "  �       vi                                ο 9 � ��      request                           �� 9� �       refOsc_status                      	           0               IINTERNAL hp871x_REF_OSC_INT EXTERNAL hp871x_REF_OSC_EXT STATUS? hp871x_Q    	           w    PURPOSE : Sets or returns current sweep time or sweep time mode
          (AUTO/MANUAL).  

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViReal64 swptime
IN        Sweep time to set. Setting a nonzero sweep time sets
          analyzer to manual mode.  Setting sweep time to 0 will
          activate auto mode.  

PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 4 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  

PARAM 5 : ViPReal64 cur_sweep 
OUT       When request is a query, indicates current sweep time
          or sweep time mode (AUTO=1, MANUAL=0). 
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     �    PARAM 2 : ViReal64 swptime
IN        Sweep time to set. Setting a nonzero sweep time sets
          analyzer to manual mode.  Setting sweep time to 0 will
          activate auto mode.  
     k    PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  Usually not
          needed.  
     �    PARAM 5 : ViPReal64 cur_sweep 
OUT       When request is a query, indicates current sweep time
          or sweep time mode (AUTO=1, MANUAL=0). 
    $    PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    �V �����  }    Error                             �� "  �       vi                                �M '  �      swptime                           � � � ��      channel                           ׅ '� �       cur_sweep                         �  ' � ��      request                            	           0 ?�      �                                               Channel 1 1 Channel 2 2    	                      �SET SWEEP TIME hp871x_SWPTIME_SET SWEEP TIME -> AUTO MODE hp871x_SWPTIME_AUTO SWEEP TIME -> MANUAL MODE hp871x_SWPTIME_MAN QUERY SWEEP TIME hp871x_SWPTIME_Q QUERY SWEEP TIME MODE hp871x_SWPTIME_AUTO_Q   g    PURPOSE : Sets sweep trigger mode.  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  

PARAM 4 : ViPInt32 trig_status  
OUT       Indicates if trig continuous is active (0 = NO, 1 =
          Yes)  
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     L    PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  
     r    PARAM 4 : ViPInt32 trig_status  
OUT       Indicates if trig continuous is active (0 = NO, 1 =
          Yes)  
    &    PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    �@����  }    Error                             �� "  �       vi                                �7 � � ��      channel                           ߋ (� �       trig_status                       � ( � ��      request                            	           0               Channel 1 1 Channel 2 2    	                      {HOLD hp871x_TRIG_HOLD IMMEDIATE hp871x_TRIG_IMM SINGLE hp871x_TRIG_SINGLE CONTINUOUS hp871x_TRIG_CONT CONTINUOUS? hp871x_Q       PURPOSE : Set or read trigger source.  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViPString trig_status  
OUT       When request is a query, indicates current trigger
          source.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     r    PARAM 3 : ViPString trig_status  
OUT       When request is a query, indicates current trigger
          source.    &    PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    �1����  }    Error                             �� "  �       vi                                �( 7� �       trig_status                       � 7 � ��      request                            	           0    	                       ~INTERNAL hp871x_TRIG_INTERNAL EXTERNAL SWEEP hp871x_TRIG_SWEEP EXTERNAL POINT hp871x_TRIG_POINT QUERY CURRENT SOURCE hp871x_Q   �    PURPOSE : Takes specified number of sweeps or determines best
          number of sweeps to take, then takes them. 

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().

PARAM 2 : ViInt32 sweeps 
IN        Number of sweeps to take.  If sweeps = 0, the number
          of sweeps taken will be automatically determined by
          the function and will depends upon avg on/off and
          averaging factor.
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     �    PARAM 2 : ViInt32 sweeps  
IN        Number of sweeps to take.  If sweeps = 0, the number
          of sweeps taken then depends upon avg on/off and
          averaging factor.
    �	q���  }    Error                             � "  �       vi                                � 9 | �      sweeps                          ���� \ 2��                                            	           0      �                   [A value of 0 will allow automatic determination 
of the optimum number of sweeps to take.    B    PURPOSE : Sets or returns alternate sweep status (ON/OFF).
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViPInt32 swpAlt_status  
OUT       When request is a query, returns 1 if alternate sweep
          is ON, 0 if OFF.    
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     �    PARAM 3 : ViPInt32 swpAlt_status  
OUT       When request is a query, returns 1 if alternate sweep
          is ON, 0 if OFF.    
    �d����  }    Error                             � "  �       vi                                �[ I � ��      request                           � I� �       swpAlt_status                      	           0              -ON hp871x_ON OFF hp871x_OFF STATUS? hp871x_Q    	           6    PURPOSE : Sets or returns step sweep status (ON/OFF).
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViPInt32 step_status  
OUT       When request is a query, returns 1 if step sweep
          is ON, 0 if OFF.    
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     }    PARAM 3 : ViPInt32 step_status  
OUT       When request is a query, returns 1 if step sweep
          is ON, 0 if OFF.    
     L    PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  
    �~����  }    Error                             � "  �       vi                                �u I � ��      request                           �� I� �       step_status                       �& � � ��      channel                            	           0               -ON hp871x_ON OFF hp871x_OFF STATUS? hp871x_Q    	                       Channel 1 1 Channel 2 2   �    PURPOSE : Sets various display options.  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     L    PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  
    &    PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    �w���  }    Error                             �� "  �       vi                                �� � � ��      channel                           �Q * � ��      request                            	           0               Channel 1 1 Channel 2 2              �NORMALIZE hp871x_NORMALIZE DISPLAY DATA hp871x_DISP_DATA DATA TO MEMORY hp871x_DATA_TO_MEM DISPLAY MEMORY hp871x_DISP_MEMORY DISPLAY DATA DIVIDED BY MEMORY hp871x_DISP_DATA_DIV_MEM DISPLAY DATA AND MEMORY hp871x_DISP_DATA_AND_MEM   �    PURPOSE : Sets or queries current measurement display format  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  

PARAM 4 : ViPString cur_format  
OUT       When request is a query, indicates current display
          format.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     L    PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  
     q    PARAM 4 : ViPString cur_format  
OUT       When request is a query, indicates current display
          format.    &    PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
   ���  }    Error                            � "  �       vi                               � � � ��      channel                          S "� �       cur_format                       � " � ��      request                            	           0               Channel 1 1 Channel 2 2    	                      LOG MAGNITUDE hp871x_FMT_LOG LINEAR MAGNITUDE hp871x_FMT_LINEAR SWR hp871x_FMT_SWR DELAY hp871x_FMT_DELAY PHASE hp871x_FMT_PHASE SMITH CHART hp871x_FMT_SMITH POLAR hp871x_FMT_POLAR REAL hp871x_FMT_REAL IMAGINARY hp871x_FMT_IMAG IMPEDANCE hp871x_FMT_IMP QUERY DISPLAY FORMAT hp871x_Q   +    PURPOSE : Set or read Split display, IBASIC display, or 
          Expanded display mode
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViPString screen_status
OUT       Returns current screen status.         �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     S    PARAM 3 : ViPString screen_status  
OUT       Returns current screen status.    
   � �w���  }    Error                            A "  �       vi                               � D � ��      request                          � Er �       screen_status                   ����  @��                                            	           0              �IBASIC DISPLAY OFF hp871x_IBASIC_OFF IBASIC DISPLAY UPPER hp871x_UPPER IBASIC DISPLAY LOWER hp871x_LOWER IBASIC DISPLAY FULL hp871x_FULL SPLIT DISPLAY ON hp871x_SPLIT_ON SPLIT DISPLAY OFF hp871x_SPLIT_OFF EXPANDED  DISPLAY ON hp871x_EXPAND_ON EXPANDED  DISPLAY OFF hp871x_EXPAND_OFF QUERY IBASIC DISPLAY MODE hp871x_IBASIC_Q QUERY SPLIT DISPLAY MODE hp871x_SPLIT_Q QUERY EXPANDED DISPLAY MODE hp871x_EXPAND_Q    	           'Expanded display not valid on 871x A/B   "    PURPOSE : Used to set various X-axis related features such as
          CW/Span vs. Start/Stop readout, resolution, and
          frequency display blanking, or to query whether or
          not the frequency labels are currently blanked.

          Also can set a "Privacy" mode where the frequency
          range is displayed in percent with the start 
          frequency being 0% and the stop frequency = 100%. 
          Marker frequencies are also displayed in percent. 
          Once set, this mode cannot be turned off unless a
          preset is performed.  This is designed to prevent the
          casual bypasser from observing the frequency settings
          in those applications where the actual frequency used
          is of a sensitive nature.  This is not meant to be a
          "Secure" mode since pressing the frequency Start or 
          Stop key will still display the current values.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2).  

PARAM 4 : ViPInt32 lblFreq_status  
OUT       When request is a query, indicates current ON/OFF
          status of the frequency labels on the analyzer 
          display (1 = ON, 0 = OFF).
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     L    PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  
     �    PARAM 4 : ViPInt32 lblFreq_status  
OUT       When request is a query, indicates current ON/OFF
          status of the frequency labels on the analyzer 
          display (1 = ON, 0 = OFF).
    &    PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
   D �����  }    Error                            � "  �       vi                               ; � � ��      channel                          � $� �       lblFreq_status                   X $ � ��      request                            	           0               Channel 1 1 Channel 2 2    	                    
  +ON hp871x_ON OFF hp871x_OFF MHz RESOLUTION hp871x_LABELS_MHZ KHz RESOLUTION hp871x_LABELS_KHZ Hz RESOLUTION hp871x_LABELS_HZ SET PRIVACY MODE hp871x_LABELS_PRIVATE START AND STOP hp871x_LABELS_START_STOP CENTER AND SPAN hp871x_LABELS_CSPAN CW FREQUENCY hp871x_LABELS_CW FREQ LABELS ON/OFF? hp871x_Q   >    PURPOSE : For X-axis user labels, this function is used to set
          the center label, axis start or stop value, axis
          suffix (units), ON/OFF status of the labels, or to
          read the ON/OFF status of the labels.  Setting of the
          center label or start/stop values and suffix will not
          be visible unless user labels are turned on.  
          Note: The center label is a descriptive title (20 
          char max) located midway between the X-axis Start and
          Stop labels.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViReal64 lbl_value
IN        Is used to set a numeric value for the Start or Stop
          (left or right) label.  The value of this variable is
          ignored when setting the center label, suffix or
          reading the current ON/OFF status.

PARAM 4 : ViString label
IN        Contains the desired label or suffix.  The label is
          limited to 20 characters and the suffix to 3
          characters.

PARAM 5 : ViInt32 channel  
IN        Indicates channel number (1 or 2).  

PARAM 6 : ViPInt32 lblUser_status 
OUT       When request is a query, indicates current ON/OFF
          status of the X-axis user labels on the analyzer 
          display (1 = ON, 0 = OFF).
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
        PARAM 3 : ViReal64 lbl_value
IN        Is used to set a numeric value for the Start or Stop
          (left or right) label.  The value of this variable is
          ignored when setting the center label, suffix or
          reading the current ON/OFF status.
     N    PARAM 5 : ViInt32 channel 
IN        Indicates channel number (1 or 2).    
     �    PARAM 6 : ViPInt32 lblUser_status 
OUT       When request is a query, indicates current ON/OFF
          status of the X-axis user labels on the analyzer 
          display (1 = ON, 0 = OFF).
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     �    PARAM 4 : ViString label
IN        Contains the desired label or suffix.  The label is
          limited to 20 characters and the suffix to 3
          characters.
   #S����  }    Error                            #� "  �       vi                               $J * � �      lbl_value                        %X � � ��      channel                          %� *� �       lblUser_status                   &x * � ��      request                          '� } � �  �    label                           ���� ���                                            	           0 ?�      �      ��                                       Channel 1 1 Channel 2 2    	                       �ON hp871x_ON OFF hp871x_OFF LABEL hp871x_USER_LABEL SUFFIX hp871x_USER_SUFFIX START hp871x_USER_START STOP hp871x_USER_STOP X-AXIS USER LABELS STATUS? hp871x_Q    ""    *Label: 20 char max.
Suffix:   3 char max.   �    PURPOSE : Sets title or clock time to either of the two title
          lines on the analyzer display, sets or reads title
          ON/OFF status, or turns clock display off. 
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViString title
IN        Title to be shown on the analyzer display.  Default =
          "Not Specified".

PARAM 4 : ViPInt32 title_status  
OUT       When request is a query, returns 1 if title is
          currently being displayed, 0 if not.    

Note:  The clock time cannot be displayed on both title lines
       simultaneously.     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     �    PARAM 4 : ViPInt32 title_status  
OUT       When request is a query, returns 1 if title is
          currently being displayed, 0 if not.    
     v    PARAM 3 : ViString title
IN        Title to be shown on the analyzer display.  Default =
          "Not Specified".
   .�����  }    Error                            /} "  �       vi                               /� 1 � ��      request                          1 1� �       title_status                     1� � G �  �    title                              	           0               �ON hp871x_ON OFF hp871x_OFF TITLE 1 hp871x_TITLE_1 TITLE 2 hp871x_TITLE_2 CLOCK OFF hp871x_CLOCK_OFF CLOCK 1 hp871x_CLOCK_1 CLOCK 2 hp871x_CLOCK_2 QUERY TITLE ON/OFF hp871x_Q    	            "Not Specified"   �    PURPOSE : Sets active marker.
        
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViInt32 marker 
IN        Contains the marker number (1-8).  

PARAM 4 : ViReal64 mkr_val 
IN        Contains the frequency (or point value, target, or
          power value if in power sweep) to be set.

PARAM 5 : ViInt32 channel  
IN        Indicates channel number (1 or 2).   
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     J    PARAM 3 : ViInt32 marker 
IN        Contains the marker number (1-8).  
     L    PARAM 5 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  
     �    PARAM 4 : ViReal64 mkr_val 
IN        Contains the frequency (or point value, target, or
          power value if in power sweep) to be set.
   6�����  }    Error                            7� "  �       vi                               7� , ] �      request                          9
 d ] �      marker                           9\ �$ ��      channel                          9� � ] �      mkr_val                            	           0              �ON hp871x_ON OFF hp871x_OFF FREQUENCY hp871x_MKR_FREQ POINT hp871x_MKR_POINT MINIMUM hp871x_MKR_MIN MAXIMUM hp871x_MKR_MAX MINIMUM LEFT hp871x_MKR_MINLEFT MINIMUM RIGHT hp871x_MKR_MINRIGHT MAXIMUM LEFT hp871x_MKR_MAXLEFT MAXIMUM RIGHT hp871x_MKR_MAXRIGHT ALL OFF hp871x_MKR_ALL_OFF BANDWIDTH hp871x_MKR_BW DELTA ON hp871x_MKR_DELTA_ON DELTA OFF hp871x_MKR_DELTA_OFF STATISTICS hp871x_MKR_STATS FLATNESS hp871x_MKR_FLATNESS FILTER STATS hp871x_MKR_FSTAT TO CENTER hp871x_MKR_TO_CENTER TO REFERENCE hp871x_MKR_TO_REF TO DELAY hp871x_MKR_TO_DELAY SET ABSOLUTE hp871x_MKR_SET_ABS TRACKING ON hp871x_MKR_TRACK_ON TRACKING OFF hp871x_MKR_TRACK_OFF                                   Channel 1 1 Channel 2 2 ?�      �      ��                               PURPOSE : Reads active marker or marker function.   

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().

PARAM 2 : ViPReal64 mkr_result   
OUT       Contains marker result. 
            
PARAM 3 : ViString request    
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 4 : ViInt32 marker 
IN        Contains the marker number (1-8).  

PARAM 5 : ViInt32 channel  
IN        Indicates channel number (1 or 2).   

PARAM 6 : ViPReal64 mkr_result2 
OUT       Contains a marker result when request corresponds to
          a marker function.   

PARAM 7 : ViPReal64 mkr_result3 
OUT       Contains a marker result when request corresponds to
          a marker function.   

PARAM 8 : ViPReal64 mkr_result4 
OUT       Contains a marker result when request corresponds to
          a marker function.   
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     J    PARAM 4 : ViInt32 marker 
IN        Contains the marker number (1-8).  
     M    PARAM 5 : ViInt32 channel  
IN        Indicates channel number (1 or 2).  
     G    PARAM 2 : ViPReal64 mkr_result   
OUT       Contains marker result. 
     �    PARAM 6 : ViPReal64 mkr_result2 
OUT       Contains a marker result when request corresponds to
          a marker function.   
     �    PARAM 7 : ViPReal64 mkr_result3 
OUT       Contains a marker result when request corresponds to
          a marker function.   
     �    PARAM 8 : ViPReal64 mkr_result4 
OUT       Contains a marker result when request corresponds to
          a marker function.   
   B�����  }    Error                            CP "  �       vi                               C�  = �      request                          D� U = �      marker                           E( � x ��      channel                          E} � �       mkr_result                       E� X� �       mkr_result2                      FV �� �       mkr_result3                      F� �� �       mkr_result4                        	           0              1AMPLITUDE hp871x_MKR_AMPL_Q POSITION hp871x_MKR_POSN_Q REF_X hp871x_MKR_REF_X_Q REF_Y hp871x_MKR_REF_Y_Q INDUCTANCE hp871x_MKR_INDUCT_Q REACTANCE hp871x_MKR_REACT_Q RESISTANCE hp871x_MKR_RESIST_Q PHASE hp871x_MKR_PHASE_Q MAGNITUDE hp871x_MKR_MAGN_Q DELAY hp871x_MKR_DELAY_Q FUNCTION hp871x_MKR_FUNCTION_Q                                   Channel 1 1 Channel 2 2    	           	           	           	          v    PURPOSE : Sets or queries current measurement type  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  

PARAM 4 : ViPString cur_meas  
OUT       When request is a query, indicates current measurement
          type.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     L    PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  
     q    PARAM 4 : ViPString cur_meas  
OUT       When request is a query, indicates current measurement
          type.    &    PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
   M�}���  }    Error                            N! "  �       vi                               N{ � � ��      channel                          N� 7� �       cur_meas                         OH 3 F � �    request                         ���� y ���                                            	           0               Channel 1 1 Channel 2 2    	                     �A hp871x_A B hp871x_B R hp871x_R A/R hp871x_AR B/R hp871x_BR S11 hp871x_S11 S12 hp871x_S12 S21 hp871x_S21 S22 hp871x_S22 A REVERSE hp871x_A_REV B REVERSE hp871x_B_REV R REVERSE hp871x_R_REV B* hp871x_B_STAR R* hp871x_R_STAR B*/R* hp871x_B_STAR_R_STAR X hp871x_X Y hp871x_Y X/Y hp871x_XY Y/X hp871x_YX Y/R* hp871x_YR_STAR AUX hp871x_AUX FAULT hp871x_FAULT FAULT REVERSE hp871x_FAULT_REV SRL hp871x_SRL SRL REVERSE hp871x_SRL_REV AM DELAY hp871x_AM_DELAY QUERY INPUT SELECTION hp871x_Q    jB/R = Transmission
A/R =  Reflection
B*/R* =  Conversion Loss
B* =  Power
S-Parameters require "ES" model   X    PURPOSE : Turn channel on/off, read on/off or active status  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViInt32 channel  
IN        Channel number (1 or 2)    

PARAM 3 : ViString request 
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 4 : ViPInt32 chan_status. Contains chan status info:
OUT       0=Off; 1=On
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     L    PARAM 2 : ViInt32 channel  
IN        Indicates channel number (1 or 2)  
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     e    PARAM 4 : ViPInt32 chan_status  
OUT       When request is a query, returns 1 if ON, 0 if OFF.    
   V�}���  }    Error                            WU "  �       vi                               W� C � ��      channel                          X � � ��      request                          Y/ C� �       chan_status                     ���� � ��                                            	           0               Channel 1 1 Channel 2 2               `ON hp871x_ON OFF hp871x_OFF ON/OFF STATUS? hp871x_CH_STATUS_Q ACTIVE STATUS? hp871x_CH_ACTIVE_Q    	            *Active status not available on 871x A/B/C   �    PURPOSE : Sets or reads various features related to the
          multiport test set (e.g. HP 87075C).  Use of this
          function requires firmware revision of 4.51 or above!
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request    
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
           
PARAM 3 : ViInt32 mp1 
IN        Contains data for selected request.  Port
          numbers can range from 1 to maximum number of ports;
          mp1 is for REFL port selection only.  Unlike most
          units, Timer values must be specified in minutes.

PARAM 4 : ViInt32 mp2  
IN        Contains only TRANS port selection data.  Port 
          numbers can range from 1 to maximum number of ports.

PARAM 5 : ViInt32 channel  
IN        Indicates channel number (1 or 2), if applicable. 
          Channel has no effect on SelfCal features. 
 
PARAM 6 : ViPInt32 cur_mp1 
OUT       When request is a query, returns On/Off status, REFL
          port selection, or timer value in minutes depending
          upon request.

PARAM 7 : ViPInt32 cur_mp2  
OUT       When request is the port number query, returns
          current TRANS port selection.  
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
        PARAM 3 : ViInt32 mp1 
IN        Contains data for selected request.  Port numbers
          can range from 1 to maximum number of ports, and mp1
          is for REFL port selection only.  
          Unlike most units, timer values must be specified 
          in minutes.
     �    PARAM 5 : ViInt32 channel  
IN        Indicates channel number (1 or 2), if applicable. 
          Channel has no effect on SelfCal features. 
     �    PARAM 6 : ViPInt32 cur_mp1 
OUT       When request is a query, returns On/Off status, REFL
          port selection, number of ports, or timer value in
          minutes depending upon request.
    (    PARAM 2 : ViString request    
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     �    PARAM 4 : ViInt32 mp2  
IN        Contains only TRANS port selection data.  Port 
          numbers can range from 1 to maximum number of ports.
     �    PARAM 7 : ViPInt32 cur_mp2  
OUT       When request is the port number query, returns
          current TRANS port selection.  
   ab}���  }    Error                            a� "  �       vi                               bY U � �      mp1                              cu o L ��      channel                          d U� �       cur_mp1                          d� !  � �    request                          f
 � � �      mp2                              f� �� �       cur_mp2                            	           0      �                             Channel 1 1 Channel 2 2    	                      &MULTIPORT ON hp871x_ON MULTIPORT OFF hp871x_OFF SELFCAL ON hp871x_MP_SELFCAL_ON SELFCAL OFF hp871x_MP_SELFCAL_OFF SELFCAL ONCE (AUTO SELFCAL OFF) hp871x_MP_CAL_ONCE SELFCAL ALL DEFINED PORTS hp871x_MP_CAL_ALL SET REFL AND TRANS PORT NUMBERS hp871x_MP_PORTS SET AUTO SELFCAL TIMER (MINUTES) hp871x_MP_CAL_TIMER QUERY SELFCAL ON/OFF STATUS hp871x_MP_SELFCAL_Q QUERY REFL AND TRANS PORT NUMBERS hp871x_MP_PORTS_Q QUERY MAXIMUM NUMBER OF PORTS hp871x_MP_MAXPORTS_Q QUERY AUTO SELFCAL TIMER hp871x_MP_CAL_TIMER_Q QUERY MULTIPORT STATUS hp871x_MP_STATUS_Q                        	               PURPOSE : Reads an entire trace and averages all points into 
          one value.  Normally used for magnitude CW traces 
          only (Lin or LOG).  Does not take the sweeps...use
          takeSweep for that.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().

PARAM 2 : ViPReal64 trace_avg
OUT       Returned avg of entire trace. Either Log or Lin is
          returned depending upon current meas setting.  
    
PARAM 3 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     �    PARAM 2 : ViPReal64 trace_avg
OUT       Returned avg of entire trace. Either Log or Lin is
          returned depending upon current meas setting.  
     L    PARAM 3 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  
   m�����  }    Error                            n= "  �       vi                               n� <� �       trace_avg                        o6 < m ��      channel                            	           0    	                      Channel 1 1 Channel 2 2   �    PURPOSE : Sets or reads port extension state and values as well
          as Velocity Factor.  Velocity factor is also
          applicable to Fault Location measurements.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViReal64 value
IN        Contains port extension value in seconds or Velocity
          Factor (where 1 = speed of light; typical VF for
          common cables is .65-.85).

PARAM 4 : ViPReal64 cur_extension 
OUT       Depending upon request, may return an extension value
          in seconds, current velocity factor (unitless) or
          ON/OFF status of port extensions (1 = ON, 0 = OFF).
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     �    PARAM 3 : ViReal64 value
IN        Contains port extension value in seconds or Velocity
          Factor (where 1 = speed of light; typical VF for
          common cables is .65-.85).
     �    PARAM 4 : ViPReal64 cur_extension 
OUT       Depending upon request, may return an extension value
          in seconds, current velocity factor (unitless) or
          ON/OFF status of port extensions (1 = ON, 0 = OFF).
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
   tp����  }    Error                            u "  �       vi                               ug � � �      value                            v) &� �       cur_extension                    w ' ��      request                            	           0 ?�      @$      �$                            	                   	  bON hp871x_ON OFF hp871x_OFF SET REFLECTION PORT EXTENSION hp871x_EXTNSN_REFL SET TRANSMISSION PORT EXTENSION hp871x_EXTNSN_TRANS SET VELOCITY FACTOR hp871x_VELOCITY QUERY REFLECTION PORT EXTENSION hp871x_EXTNSN_REFL_Q QUERY TRANSMISSION PORT EXTENSION hp871x_EXTNSN_TRANS_Q QUERY VELOCITY FACTOR hp871x_VELOCITY_Q QUERY EXTENSIONS ON/OFF STATUS hp871x_Q   @    PURPOSE : Performs the actual save of the instrument state or
          trace data using an ASCII list.  The contents of the
          saved file can be defined in hp871x_saveDefine.  Also
          see hp871x_recall.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString save_name
IN        Contains the desired filename that the data will be
          stored under. Filenames may or may not include a
          drive specifier appended in front of the filename.
          For example, if filename is "test", providing the 
          name of "mem:test", "int:test", or "ram:test" will
          store the data to nonvolatile memory, internal disk,
          or volatile RAM respectively, regardless of current
          default drive.

PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    �    PARAM 2 : ViString save_name
IN        Contains the desired filename that the data will be
          stored under. Filenames may or may not include a
          drive specifier appended in front of the filename.
          For example, if filename is "test", providing the 
          name of "mem:test", "int:test", or "ram:test" will
          store the data to nonvolatile memory, internal disk,
          or volatile RAM respectively, regardless of current
          default drive.
   F����  }    Error                            � "  �       vi                               �= ; ��      request                          �i � � �  i    save_name                       ���� � ���                                            	           0               �SAVE INSTRUMENT STATE hp871x_SAVE_STATE SAVE CHANNEL 1 TRACE AS ASCII LIST hp871x_SAVE_LIST1 SAVE CHANNEL 2 TRACE AS ASCII LIST hp871x_SAVE_LIST2    ""    
Filename    �    PURPOSE : Can be used to define what will be saved when
          saving a state.  Can be used to query whether a 
          specific item is turned On or Off for the current
          definition.  The actual save of any instrument state
          is done in function hp871x_save.  Also see
          hp871x_recall.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViString define
IN        If requesting to toggle the ON/OFF status for saving 
          of calibration, instrument state or trace data, this
          parameter must contain "ON" or "OFF" to set the 
          status accordingly.  When requesting to set the
          FORMAT, this parameter must contain either
          "TOUCHSTONE" or "LOTUS123".

PARAM 4 : ViPInt32 define_status 
OUT       When request is a query, returns the current ON/OFF
          status of the requested save parameter.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    k    PARAM 3 : ViString define
IN        If requesting to toggle the ON/OFF status for saving 
          of calibration, instrument state or trace data, this
          parameter must contain "ON" or "OFF" to set the 
          status accordingly.  When requesting to set the
          FORMAT, this parameter must contain either
          "TOUCHSTONE" or "LOTUS123".
     �    PARAM 4 : ViPInt32 define_status 
OUT       When request is a query, returns the current ON/OFF
          status of the requested save parameter.
   ��}���  }    Error                            �� "  �       vi                               �� + � ��      request                          �
 � r � �    define                           �} (� �       define_status                      	           0              7CALIBRATION SAVE ON/OFF hp871x_SAVE_CORR INSTRUMENT STATE SAVE ON/OFF hp871x_SAVE_ISTATE TRACE DATA SAVE ON/OFF hp871x_SAVE_TRACE ASCII DATA SAVE FORMAT hp871x_SAVE_FORMAT CALIBRATION SAVE ON/OFF? hp871x_SAVE_CORR_Q INSTRUMENT STATE SAVE ON/OFF? hp871x_SAVE_ISTATE_Q TRACE DATA SAVE ON/OFF? hp871x_SAVE_TRACE_Q               cON hp871x_ON OFF hp871x_OFF TOUCHSTONE FORMAT hp871x_TOUCHSTONE LOTUS 1-2-3 FORMAT hp871x_LOTUS123    	           �    PURPOSE : Can be used to recall an instrument state, turn the
          Fast Recall feature On/Off, or to query Fast Recall
          On/Off status.  Also see hp871x_save.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString recall_name
IN        Contains the filename for the instrument state to be
          recalled.  Filenames may or may not include a drive
          specifier appended in front of the filename.  For
          example, if filename is "test", providing the name of
          "mem:test", "int:test", or "ram:test" will recall the
          state with that name from nonvolatile memory, 
          internal disk, or volatile RAM respectively,
          regardless of current default drive.

PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 4 : ViPInt32 recall_status 
OUT       When request is a query, returns ON/OFF status of 
          Fast Recall feature (1 = ON, 0 = OFF).
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    �    PARAM 2 : ViString recall_name
IN        Contains the filename for the instrument state to be
          recalled.  Filenames may or may not include a drive
          specifier appended in front of the filename.  For
          example, if filename is "test", providing the name of
          "mem:test", "int:test", or "ram:test" will recall the
          state with that name from nonvolatile memory, 
          internal disk, or volatile RAM respectively,
          regardless of current default drive.
     �    PARAM 4 : ViPInt32 recall_status 
OUT       When request is a query, returns ON/OFF status of 
          Fast Recall feature (1 = ON, 0 = OFF).
   ������  }    Error                            �T "  �       vi                               �� ' � ��      request                          ��  h �  i    recall_name                      �� '� �       recall_status                   ���� � ���                                            	           0               �RECALL INSTRUMENT STATE hp871x_RECALL_STATE FAST RECALL ON hp871x_FAST_ON FAST RECALL OFF hp871x_FAST_OFF FAST RECALL ON/OFF? hp871x_Q    ""    	            	Filename   j    PURPOSE : Sets or returns current scale factor, position,
          reference level, electrical delay or phase offset.
          If scale factor is 0, the display gets autoscaled.  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViReal64 value  
IN        Scale/posn/ref/delay/phase value to set.  

PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    
PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  Usually not
          needed.  

PARAM 5 : ViInt32 cur_value 
OUT       When request is a query, this indicates current value
          used.   
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     R    PARAM 2 : ViReal64 value  
IN        Scale/posn/ref/delay/phase value to set.  
     k    PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  Usually not
          needed.  
     n    PARAM 5 : ViInt32 cur_value 
OUT       When request is a query, this indicates current value
          used.    $    PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
   ������  }    Error                            �� "  �       vi                               �� ) � �      value                            �; �4 ��      channel                          �� &� �       cur_value                        �$ ) � ��      request                            	           0 ?�      �      ��                                       Channel 1 1 Channel 2 2    	                     �SET SCALE FACTOR hp871x_SCALE_DIV SET SCALE POSITION hp871x_SCALE_POSN SET SCALE REFERENCE hp871x_SCALE_REF AUTOSCALE hp871x_SCALE_AUTO SET ELECTRICAL DELAY hp871x_SCALE_DELAY SET PHASE OFFSET hp871x_SCALE_PHASE_OFFS QUERY SCALE FACTOR hp871x_SCALE_DIV_Q QUERY SCALE POSITION hp871x_SCALE_POSN_Q QUERY SCALE REFERENCE hp871x_SCALE_REF_Q QUERY ELECTRICAL DELAY hp871x_SCALE_DELAY_Q QUERY PHASE OFFSET hp871x_SCALE_PHASE_OFFS_Q   J    PURPOSE : This function reads (gets) trace data or calibration
          data from the instrument. 

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
 
PARAM 2 : ViReal64 _VI_FAR traceRd[]
OUT       64-bit Real array to receive data values. 
          Depending upon request, this array receives the
          formatted data requested, or, if this request returns
          two arrays, this will contain the first array.  For
          Polar or Smith formats, this will contain the
          magnitude array.  For all others, it contains the 
          REAL array.

PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    
PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  
 
PARAM 5 : ViReal64 _VI_FAR traceRd2[]
OUT       Another 64-bit Real array to receive data
          values.  This array will only receive data for a
          request that returns two arrays.  This array is 
          always the Imaginary array unless FDATA or FMEM is
          selected in Polar or Smith format, in which case it
          contains the phase information in degrees.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    �    PARAM 2 : ViReal64 _VI_FAR traceRd[]
OUT       64-bit Real array to receive data values. 
          Depending upon request, this array receives the
          formatted data requested, or, if this request returns
          two arrays, this will contain the first array.  For
          Polar or Smith formats, this will contain the
          magnitude array.  For all others, it contains the 
          REAL array.
    �    PARAM 5 : ViReal64 _VI_FAR traceRd2[] 
OUT       Another 64-bit Real array to receive data
          values.  This array will only receive data for a
          request that returns two arrays.  This array is 
          always the Imaginary array unless FDATA or FMEM is
          selected in Polar or Smith format, in which case it
          contains the phase information in degrees.
     L    PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  
    $    PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
   �����  }    Error                            �� "  �       vi                               �� %� �       traceRd                          �� f� �       traceRd2                         �1 d c ��      channel                          �� % ( � �    request                         ���� �}��                                            	           0    	            	                       Channel 1 1 Channel 2 2              XFORMATTED DATA hp871x_TRC_RD_FDATA_Q FORMATTED MEMORY hp871x_TRC_RD_FMEM_Q REAL & IMAGINARY DATA hp871x_TRC_RD_RI_Q REAL & IMAGINARY MEMORY hp871x_TRC_RD_RI_MEM_Q RAW A-CHANNEL DATA hp871x_TRC_RD_A_RAW_Q RAW B-CHANNEL DATA hp871x_TRC_RD_B_RAW_Q RAW R-CHANNEL DATA hp871x_TRC_RD_R_RAW_Q ERROR CORRECTION ARRAY 1 hp871x_TRC_RD_CORR1_Q ERROR CORRECTION ARRAY 2 hp871x_TRC_RD_CORR2_Q ERROR CORRECTION ARRAY 3 hp871x_TRC_RD_CORR3_Q ERROR CORRECTION ARRAY 4 hp871x_TRC_RD_CORR4_Q ERROR CORRECTION ARRAY 5 hp871x_TRC_RD_CORR5_Q ERROR CORRECTION ARRAY 6 hp871x_TRC_RD_CORR6_Q ERROR CORRECTION ARRAY 7 hp871x_TRC_RD_CORR7_Q ERROR CORRECTION ARRAY 8 hp871x_TRC_RD_CORR8_Q ERROR CORRECTION ARRAY 9 hp871x_TRC_RD_CORR9_Q ERROR CORRECTION ARRAY 10 hp871x_TRC_RD_CORR10_Q ERROR CORRECTION ARRAY 11 hp871x_TRC_RD_CORR11_Q ERROR CORRECTION ARRAY 12 hp871x_TRC_RD_CORR12_Q    <Trace 2 is for real & imag pairs
or magnitude & phase pairs   M    PURPOSE : This function writes (sends) trace data or 
          calibration data to the instrument. 

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
 
PARAM 2 : ViReal64 _VI_FAR traceWr[]
IN        64-bit Real array containing data values to write.   
          Depending upon request, this array contains the
          formatted data to be written, or, if this request
          requires two arrays, this must contain the first
          array.  For Polar or Smith formats, this must contain
          the magnitude array.  For all others, it contains the 
          REAL array.

PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    
PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  
 
PARAM 5 : ViReal64 _VI_FAR traceWr2[]
IN        Data in this array is only necessary for a request
          that requires two arrays.  In such cases, this array
          is expected to contain the Imaginary data unless 
          FDATA or FMEM is selected in Polar or Smith format, 
          in which case it must contain the phase information 
          in degrees.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    �    PARAM 2 : ViReal64 _VI_FAR traceWr[]
IN        64-bit Real array containing data values to write.   
          Depending upon request, this array contains the
          formatted data to be written, or, if this request
          requires two arrays, this must contain the first
          array.  For Polar or Smith formats, this must contain
          the magnitude array.  For all others, it contains the 
          REAL array.
    u    PARAM 5 : ViReal64 _VI_FAR traceWr2[] 
IN        Data in this array is only necessary for a request
          that requires two arrays.  In such cases, this array
          is expected to contain the Imaginary data unless 
          FDATA or FMEM is selected in Polar or Smith format, 
          in which case it must contain the phase information 
          in degrees.
     L    PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  
    $    PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
   �o����  }    Error                            � "  �       vi                               �f k � �       traceWr                          � � � �       traceWr2                         �� k k ��      channel                          �� + 0 � �    request                         ���� � ���                                            	           0                       Channel 1 1 Channel 2 2              EFORMATTED DATA hp871x_TRC_WRT_FDATA FORMATTED MEMORY hp871x_TRC_WRT_FMEM REAL & IMAGINARY DATA hp871x_TRC_WRT_RI REAL & IMAGINARY MEMORY hp871x_TRC_WRT_RI_MEM RAW A-CHANNEL DATA hp871x_TRC_WRT_A_RAW RAW B-CHANNEL DATA hp871x_TRC_WRT_B_RAW RAW R-CHANNEL DATA hp871x_TRC_WRT_R_RAW ERROR CORRECTION ARRAY 1 hp871x_TRC_WRT_CORR1 ERROR CORRECTION ARRAY 2 hp871x_TRC_WRT_CORR2 ERROR CORRECTION ARRAY 3 hp871x_TRC_WRT_CORR3 ERROR CORRECTION ARRAY 4 hp871x_TRC_WRT_CORR4 ERROR CORRECTION ARRAY 5 hp871x_TRC_WRT_CORR5 ERROR CORRECTION ARRAY 6 hp871x_TRC_WRT_CORR6 ERROR CORRECTION ARRAY 7 hp871x_TRC_WRT_CORR7 ERROR CORRECTION ARRAY 8 hp871x_TRC_WRT_CORR8 ERROR CORRECTION ARRAY 9 hp871x_TRC_WRT_CORR9 ERROR CORRECTION ARRAY 10 hp871x_TRC_WRT_CORR10 ERROR CORRECTION ARRAY 11 hp871x_TRC_WRT_CORR11 ERROR CORRECTION ARRAY 12 hp871x_TRC_WRT_CORR12    <Trace 2 is for real & imag pairs
or magnitude & phase pairs   &    PURPOSE : Sets or reads various calibration related parameters
          for fault location.
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    
PARAM 3 : ViReal64 fltCal_value  
IN        Specifies the value to be used for the desired
          parameter chosen by request.  Distance units are 
          those currently set except for connector length which
          must be in meters.  This value is ignored when 
          request is a query.

PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).    

PARAM 5 : ViPReal64 cur_fltCal 
OUT       When request is a query, this indicates the current
          value of the requested parameter.  Connector length
          is always returned in meters.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    1    PARAM 3 : ViReal64 fltCal_value  
IN        Specifies the value to be used for the desired
          parameter chosen by request.  Distance units are 
          those currently set except for connector length which
          must be in meters.  This value is ignored when 
          request is a query.
     N    PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).    
     �    PARAM 5 : ViPReal64 cur_fltCal 
OUT       When request is a query, this indicates the current
          value of the requested parameter.  Connector length
          is always returned in meters.
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
   ˎ����  }    Error                            �+ #  �       vi                               ̅ b : �      fltCal_value                     ; � u ��      channel                          � ,� �       cur_fltCal                       �� , : � �    request                            	           0 ?�      �      ��                                       Channel 1 1 Channel 2 2    	                     KSET CABLE LOSS hp871x_FAULT_LOSS SPECIFY CABLE LENGTH hp871x_FAULT_CAL_LENGTH PERFORM CABLE CAL ROUTINE hp871x_FAULT_CAL_MEASURE SET MULTIPEAK ON/OFF STATUS hp871x_FAULT_MULTIPEAK SET MULTIPEAK THRESHOLD hp871x_FAULT_THRESHOLD SET CONNECTOR LENGTH hp871x_FAULT_CONN_LENGTH SET VELOCITY FACTOR hp871x_VELOCITY QUERY CABLE LOSS hp871x_FAULT_LOSS_Q QUERY CABLE LENGTH hp871x_FAULT_CAL_LENGTH_Q QUERY MULTIPEAK ON/OFF STATUS hp871x_FAULT_MULTIPEAK_Q QUERY MULTIPEAK THRESHOLD hp871x_FAULT_THRESHOLD_Q QUERY CONNECTOR LENGTH hp871x_FAULT_CONN_LENGTH_Q QUERY VELOCITY FACTOR hp871x_VELOCITY_Q   �    PURPOSE : Sets or reads various stimulus related parameters for
          fault location. 

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViReal64 fltMeas_value  
IN        Specifies the value to be used for the desired
          parameter chosen by request.  Distance units are 
          those currently set.  Frequencies are in Hz.  This
          value is ignored when request is a query.
    
PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).

PARAM 5 : ViPReal64 cur_fltMeas 
OUT       When request is a query, this indicates the current
          value of the requested parameter.   
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
        PARAM 3 : ViReal64 fltMeas_value  
IN        Specifies the value to be used for the desired
          parameter chosen by request.  Distance units are 
          those currently set.  Frequencies are in Hz.  This
          value is ignored when request is a query.
     N    PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).    
     �    PARAM 5 : ViPReal64 cur_fltMeas 
OUT       When request is a query, this indicates the current
          value of the requested parameter.   
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
   �� �����  }    Error                            �~ "  �       vi                               �� &
 �      fltMeas_value                    �� � � ��      channel                          �A &� �       cur_fltMeas                      �� & � ��      request                            	           0 ?�      �      ��                                       Channel 1 1 Channel 2 2    	                     RSET START DISTANCE hp871x_FAULT_START SET STOP DISTANCE hp871x_FAULT_STOP SET CENTER FREQUENCY hp871x_FAULT_CENTER SET MAXIMUM FREQUENCY SPAN hp871x_FAULT_MAXSPAN QUERY START DISTANCE hp871x_FAULT_START_Q QUERY STOP DISTANCE hp871x_FAULT_STOP_Q QUERY CENTER FREQUENCY hp871x_FAULT_CENTER_Q QUERY MAX FREQUENCY SPAN hp871x_FAULT_MAXSPAN_Q   �    PURPOSE : Sets up or reads various fault location parameters. 
          Of course, the fault location option must be 
          installed for this function to work.   

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2).  

PARAM 4 : ViPString cur_fltSetup  
OUT       When request is a query, contains the current status
          of the requested parameter.  Returns "FEET", 
          "METERS", "MINIMUM", "MEDIUM", "MAXIMUM", "LOWPASS",
          or "BANDPASS" depending upon request and current
          state.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     M    PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2).  
    '    PARAM 4 : ViPString cur_fltSetup  
OUT       When request is a query, contains the current status
          of the requested parameter.  Returns "FEET", 
          "METERS", "MINIMUM", "MEDIUM", "MAXIMUM", "LOWPASS",
          or "BANDPASS" depending upon request and current
          state.
    &    PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
   � �s���  }    Error                            �W "  �       vi                               � � � ��      channel                          � #� �       cur_fltSetup                     �5 # � ��      request                            	           0               Channel 1 1 Channel 2 2    	                    
  wSET UNITS TO FEET hp871x_FAULT_FEET SET UNITS TO METERS hp871x_FAULT_METERS SET MODE TO LOWPASS hp871x_FAULT_LOWPASS SET MODE TO BANDPASS hp871x_FAULT_BANDPASS SET WINDOW TO MINIMUM hp871x_FAULT_MIN SET WINDOW TO MEDIUM hp871x_FAULT_MED SET WINDOW TO MAXIMUM hp871x_FAULT_MAX QUERY UNITS hp871x_FAULT_UNITS_Q QUERY MODE hp871x_FAULT_MODE_Q QUERY WINDOW hp871x_FAULT_WINDOW_Q   �    PURPOSE : Sets or reads various limit line related parameters
          including Pass/Fail testing.  When reading the 
          results of the limit test (Pass/Fail), this function 
          returns 0 if both channels pass, 1 if channel 1 
          fails, 2 if channel 2 fails and 3 if both fail.  If
          one channel is turned off or does not have limit
          testing active, then it is considered to be in a
          passing state.  See hp871x_limitSet for the actual
          setting of the limit lines.
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViInt32 channel 
IN        Indicates channel number (1 or 2).  

PARAM 4 : ViPInt32 limit_status 
OUT       When request is a status query, returns 1 for ON, 0
          for OFF.  When querying test result, returns 0 if 
          both channels pass, 1 if channel 1 fails, 2 if 
          channel 2 fails and 3 if both fail.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     N    PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).    
        PARAM 5 : ViPInt32 limit_status 
OUT       When request is a status query, returns 1 for ON, 0
          for OFF.  When querying test result, returns 0 if 
          both channels pass, 1 if channel 1 fails, 2 if 
          channel 2 fails and 3 if both fail.
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
   � �����  }    Error                            � "  �       vi                               � x e ��      channel                          �h 0� �       limit_status                     �v 5 * � �    request                         ���� h���                                            	           0               Channel 1 1 Channel 2 2    	                      �LIMIT TEST ON hp871x_LIMIT_ON LIMIT TEST OFF hp871x_LIMIT_OFF LIMIT LINE DISPLAY ON hp871x_LIMIT_DISPLAY_ON LIMIT LINE DISPLAY OFF hp871x_LIMIT_DISPLAY_OFF LIMIT LINE TEXT ON hp871x_LIMIT_TEXT_ON LIMIT LINE TEXT OFF hp871x_LIMIT_TEXT_OFF LIMIT LINE ICON ON hp871x_LIMIT_ICON_ON LIMIT LINE ICON OFF hp871x_LIMIT_ICON_OFF DELETE ALL LIMIT LINES hp871x_LIMIT_DELETE LIMIT TEST ON/OFF? hp871x_LIMIT_STATUS_Q QUERY LIMIT TEST RESULTS hp871x_LIMIT_RESULT_Q    MLimit Test Results:
0= Both Pass,  1=Ch1 Fails
2= Ch2 Fails,   3= Both Fail        PURPOSE : This function defines the limit lines.  Any previous
          limit lines are deleted.  Up to 12 limit line 
          segments can be specified at once.  Each segment
          definition requires 5 values.  Each segment can be 
          defined as either a Max limit line or point, or 
          Min limit line or point. 
          This function also turns on the display of limit 
          lines even if they were previously turned off, 
          however it does not turn on the actual testing of
          limits.  Also works in Fault Location mode and Power
          Sweep mode.  See hp871x_limits function for other
          control of limit lines.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViInt32 segments
IN        Contains the total number of segments to be set. 
          Range is from 1 to 12.  Make sure that the limit 
          array has at least this number of segments specified.

PARAM 3 : ViReal64 limits[]
IN        A single dimension array that contains 1 to 12
          sequences of 5 values.  Together, these 5 values
          specify each segment of a limit line as follows:

          1. Limit Type   0= MIN Limit line, 1= MAX Limit line
          2. X-axis Limit Start (typically this is freq in Hz)
          3. X-axis Limit Stop   "         "    "  "    "  "
          4. Y-axis Limit Start value (typically this is in dB)
          5. Y-axis Limit Stop value   "         "    "  "  "

          X-axis parameter may be distance in Fault Location
          mode, or power, if in power sweep mode.  If X-axis
          Limit Stop is zero then a point limit is assumed and
          the Y limit Stop value is ignored.  See help file.

PARAM 4 : ViInt32 channel 
IN        Indicates channel number (1 or 2).    
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    �    PARAM 3 : ViReal64 limits[]
IN        A single dimension array that contains 1 to 12
          sequences of 5 values.  Together, these 5 values
          specify each segment of a limit line as follows:

          1. Limit Type   0= MIN Limit line, 1= MAX Limit line
          2. X-axis Limit Start (typically this is freq in Hz)
          3. X-axis Limit Stop   "         "    "  "    "  "
          4. Y-axis Limit Start value (typically this is in dB)
          5. Y-axis Limit Stop value   "         "    "  "  "

          X-axis parameter may be distance in Fault Location
          mode, or power, if in power sweep mode.
          If X-axis Limit Stop is 0 then a point limit will 
          be assumed and Y Limit Stop is ignored.
          

     �    PARAM 2 : ViInt32 segments
IN        Contains the total number of segments to be set. 
          Range is from 1 to 12.  Make sure that the limit 
          array has at least this number of segments specified.
     N    PARAM 4 : ViInt32 channel  
IN        Indicates channel number (1 or 2).   
   �k����  }    Error                            � "  �       vi                               �b " � �      limits                            \ " 7 �      segments                         9 t r ��      channel                            	           0                                       Channel 1 1 Channel 2 2       PURPOSE : Is used to assign user-specified strings to softkeys,
          or to erase all softkeys.  Can be used to set just 
          one softkey, or all at once (#1 through #7).  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString key
IN        Contains individual key description or all keys
          separated by "|".  The default string
          ("ERASE_SOFTKEYS") erases all softkeys.

PARAM 3 : ViInt32 sfky_number
IN        Softkey number, if setting only one; 0 if setting all
          or erasing all.  Note that the softkey number is
          offset by 1 from the key code returned by the
          hp871x_keyRead function (e.g., Softkey # 1 (top)
          returns a key value of 0).          
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    =    PARAM 3 : ViInt32 sfky_number
IN        Softkey number, if setting only one; 0 if setting all
          or erasing all.  Note that the softkey number is
          offset by 1 from the key code returned by the
          hp871x_keyRead function (e.g., Softkey # 1 (top)
          returns a key value of 0).          
     �    PARAM 2 : ViString key
IN        Contains individual key description or all keys
          separated by "|".  The default string
          ("ERASE_SOFTKEYS") erases all softkeys.
   �����  }    Error                            � "  �       vi                               � q   �      sfky_number                      6 5   ���    key                             ���� �  ��                                         ���� K ���                                            	           0                          "ERASE_SOFTKEYS"    bA value of 0 assumes that variable key  contains 
all 7 softkeys separated by a "|" (pipe) symbol    0One softkey label, or all labels separated by |   H    PURPOSE : This function applies only to the USER BEGIN feature.
          It is used to assign user-specified strings to
          softkeys, or to erase all softkeys.  Can be used to
          set just one softkey, or all at once (#1 through #7).  
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString key
IN        Contains individual key description or all keys
          separated by "|".  The default string
          ("ERASE_SOFTKEYS") erases all softkeys.

PARAM 3 : ViInt32 key_number
IN        Softkey number, if setting only one; 0 if setting all
          or erasing all.  Note that the softkey number is
          offset by 1 from the key code returned by the
          hp871x_keyRead function (e.g., Softkey # 1 (top)
          returns a key value of 0).          
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    <    PARAM 3 : ViInt32 key_number
IN        Softkey number, if setting only one; 0 if setting all
          or erasing all.  Note that the softkey number is
          offset by 1 from the key code returned by the
          hp871x_keyRead function (e.g., Softkey # 1 (top)
          returns a key value of 0).          
     �    PARAM 2 : ViString key
IN        Contains individual key description or all keys
          separated by "|".  The default string
          ("ERASE_SOFTKEYS") erases all softkeys.
   U|���  }    Error                            � "  �       vi                               L m $ �      key_number                       � * $ ���    key                             ���� @ ���                                         ���� � $��                                            	           0                          "ERASE_SOFTKEYS"    0One softkey label, or all labels separated by |    bA value of 0 assumes that variable key  contains 
all 7 softkeys separated by a "|" (pipe) symbol   �    PURPOSE : Reads front panel keypress, RPG (Knob), or external
          keyboard. 
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViPString keytype
OUT       Returns "RPG", "KEY" or "ASC"; whichever is the most
          recent key in the queue.  If the key queue is empty,
          returns "NONE".

PARAM 3 : ViPInt32 keycode
OUT       Returns code of key pressed or RPG count.
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     �    PARAM 2 : ViPString keytype
OUT       Returns "RPG", "KEY" or "ASC"; whichever is the most
          recent key in the queue.  If the key queue is empty,
          returns "NONE".
     R    PARAM 3 : ViPInt32 keycode
OUT       Returns code of key pressed or RPG count.

    ����  }    Error                            � "  �       vi                                '� ��      keytype                          � i� �       keycode                            	           0    	            	           W    PURPOSE : Sets up or reads analyzer key queue. 
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViPInt32 queue_status  
OUT       When request is a query, returns queue state (1=ON,
          0=OFF), current queue count or maximum queue count.    
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     �    PARAM 3 : ViPInt32 queue_status  
OUT       When request is a query, returns queue state,
          max count or current count.    

   �����  }    Error                            ( "  �       vi                               � < � ��      request                          � <� �       queue_status                       	           0              yON hp871x_ON OFF hp871x_OFF CLEAR hp871x_QUEUE_CLEAR QUEUE? hp871x_Q COUNT? hp871x_QUEUE_COUNT_Q MAX? hp871x_QUEUE_MAX_Q    	           k    PURPOSE : This function can be used to set up or read various
          printing (and plotting) parameters.  Can also be used
          to initiate printing or to abort it.  This function
          does not fully support printing to a SERIAL device
          although it will read whether or not the analyzer is
          set to the serial port.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViString data  
IN        Contains the desired data (or specifier) 
          corresponding to request.  Use caution, ensure proper
          parameters are provided.  Refer to this function in
          the Windows help file for this driver to see the list
          of valid data strings for each request.

PARAM 4 : ViPString cur_print  
OUT       When request is a query, returns language or port
          description depending upon request.  For Language,
          returns "HPGL", "PCL", "PCL5", "PCX" or "EPS" (EPS is
          for EPSON or IBM).  For Port, returns "HPIB", "DISK",
          "NONVOL", "PARALLEL", "LAN", or "SERIAL".
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    O    PARAM 4 : ViPString cur_print  
OUT       When request is a query, returns language or port
          description depending upon request.  For Language,
          returns "HPGL", "PCL", "PCL5", "PCX" or "EPS" (EPS is
          for EPSON or IBM).  For Port, returns "HPIB", "DISK",
          "NONVOL", "PARALLEL", "LAN", or "SERIAL".
    &    PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    @    PARAM 3 : ViString data  
IN        Contains the desired data (or specifier) 
          corresponding to request.  Use caution, ensure proper
          parameters are provided.  Refer to this function in
          the Windows help file for this driver to see the list
          of valid data strings for each request.
   $) P����  }    Error                            $� `   �       vi                               %  � �       cur_print                        &w   �    request                          '� > � �  �    data                            ���� t S��                                            	           0    	                      �INITIATE PRINT/PLOT hp871x_PRINT_NOW ABORT PRINT/PLOT hp871x_PRINT_ABORT PRINTER/PLOTTER ADDRESS hp871x_PRINT_ADDR PRINT/PLOT DESTINATION (LANGUAGE, PORT) hp871x_PRINT_DEST COLOR ON/OFF hp871x_PRINT_COLOR PRINTER/PLOTTER MODE hp871x_PRINT_MODE ORIENTATION OF PRINT hp871x_PRINT_ORIENT RESOLUTION OF PRINT  hp871x_PRINT_RES AUTO FEED ON/OFF hp871x_PRINT_FF GRAPHICS FORMAT/LANGUAGE? hp871x_PRINT_LANG_Q PRINTER/PLOTTER PORT? hp871x_PRINT_PORT_Q    ""   �request                   data
------------                 ----------------------------------------------------------------------------------------------
"ADDRESS"           If 2 characters or less, assumes HP-IB address from 00 to 31;
                                else, assumes LAN IP addr in: 123.123.123.123  format.
"DESTINATION"    Must contain both Language and Port separated by a comma.
                                e.g. "PCL5,LAN",   "HPGL, HPIB",   "PCL,PARALLEL"  etc.
                                For list of valid Languages and Ports, see help for this function
                                in the Windows help file for this driver.
"COLOR"               Only valid selections are "ON" or "OFF".
"MODE"                  Valid selections are: "NORMAL" = Graph and Marker Table;
                                "GRAPH" = Graph only;  "MARKER" = Marker Table only;
                                "LIST" = List trace values;  "ISET" = Operating parameters.
"ORIENTATION"   Only valid selections are "PORTRAIT" or "LANDSCAPE".
"RESOLUTION"    Valid dpi choices are:  75, 90, 96, 100, 150, 180, 300, 600.
"FORMFEED"        Only valid selections are "ON" or "OFF".   �    PURPOSE : Takes a message string passed to this function and
          prepares it to be echoed to the network analyzer's
          display. 
 
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViString msg
IN        Contains desired message.

PARAM 4 : ViPInt32 msg_status  
OUT       When request is a query, returns 1 if message is
          currently enabled ("ON"), 0 if disabled ("OFF").    
      �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     �    PARAM 4 : ViPInt32 msg_status  
OUT       When request is a query, returns 1 if message is
          currently enabled ("ON"), 0 if disabled ("OFF").    
     =    PARAM 3 : ViString msg
IN        Contains desired message.
   3�����  }    Error                            4K "  �       vi                               4� & � ��      request                          5� %� �       msg_status                       6u �  � �    msg                             ���� � ���                                            	           0            	   �ON hp871x_ON OFF hp871x_OFF ALL OFF hp871x_MSG_ALL_OFF CLEAR hp871x_MSG_CLEAR SHOW INDEFINITELY hp871x_MSG_SHOW SHOW FOR 3 SECONDS hp871x_MSG_SHOW_3 SHOW FOR 5 SECONDS hp871x_MSG_SHOW_5 SHOW FOR 8 SECONDS hp871x_MSG_SHOW_8 QUERY MESSAGE ON/OFF hp871x_Q    	            "Message Not Specified"    ,Messages will be automatically word-wrapped   x    PURPOSE : Reads the current or specified directory.  It returns
          all the file/directory names and number of entries
          found.  Only the names are returned (separated by
          commas).  For more infomation on each entry, see
          hp871x_dirInfo.  To easily parse the entire string of
          filename entries, see the hp871x_universalParse
          function.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViPInt32 files
OUT       Returns the number of entries (files and directories)
          found on the specified drive.

PARAM 3 : ViPString dir 
OUT       A string that will contain all the contents of the
          current directory.  Each entry can be up to 12
          characters in length for a DOS directory.  The string
          will contain all entries separated by a comma.  Only
          the names of the files and directories are returned.

PARAM 4 : ViString drive
IN        Selects which drive to return the directory listing
          for.  Choices are current (active) drive, internal
          disk, volatile RAM or non-volatile RAM.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     �    PARAM 4 : ViString drive
IN        Selects which drive to return the directory listing
          for.  Choices are current (active) drive, internal
          disk, volatile RAM or non-volatile RAM.
     �    PARAM 2 : ViPInt32 files
OUT       Returns the number of entries (files and directories)
          found on the specified drive.
    O    PARAM 3 : ViPString dir 
OUT       A string that will contain all the contents of the
          current directory.  Each entry can be up to 12
          characters in length for a DOS directory.  The string
          will contain all entries separated by a comma.  Only
          the names of the files and directories are returned.
   =�����  }    Error                            >� "  �       vi                               >� & � ��      drive                            ?� &� �       files                            @= ~� �       dir                             ���� I���                                         ���� c (��                                            	           0               �ACTIVE (DEFAULT) DRIVE hp871x_DIR_DEFAULT INTERNAL FLOPPY DISK hp871x_DISK VOLATILE RAM hp871x_RAM NON-VOLATILE RAM hp871x_NONVOL    	            	            Number of files    For DOS Directories Only   w    PURPOSE : Reads the information on the specified file or
          directory.  Information returned includes type of
          file, size, and time/date of last modification.  To
          determine the actual entries, see hp871x_dir.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString info_name
IN        Specifies the filename (or directory) for which
          information is requested.  The name may or may not
          have a drive specifier appended in front of it.  For
          example, providing the name of "mem:test", 
          "int:test", or "ram:test" will look for a file or
          directory named "test" in nonvolatile memory, 
          internal disk, or volatile RAM respectively,
          regardless of current default drive.  Any drive
          specifier will take precedence over the drive
          parameter passed to this function.

PARAM 3 : ViPString info
OUT       Returns information on the specified entry.  This 
          will be about 60 characters in length.

PARAM 4 : ViString drive 
IN        Specifies drive in which filename resides.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    V    PARAM 2 : ViString info_name
IN        Specifies the filename (or directory) for which
          information is requested.  The name may or may not
          have a drive specifier appended in front of it.  For
          example, providing the name of "mem:test", 
          "int:test", or "ram:test" will look for a file or
          directory named "test" in nonvolatile memory, 
          internal disk, or volatile RAM respectively,
          regardless of current default drive.  Any drive
          specifier will take precedence over the drive
          parameter passed to this function.
     �    PARAM 3 : ViPString info
OUT       Returns information on the specified entry.  This 
          will be about 60 characters in length.
     Q    PARAM 4 : ViString drive 
IN        Specifies drive in which filename resides.
   Ho �����  }    Error                            I "  �       vi                               If � - �� �    info_name                        K� 2� �       info                             LU 2 � ��      drive                              	           0    ""    	                       �ACTIVE (DEFAULT) DRIVE hp871x_DIR_DEFAULT INTERNAL FLOPPY DISK hp871x_DISK VOLATILE RAM hp871x_RAM NON-VOLATILE RAM hp871x_NONVOL   �    PURPOSE : Performs various mass storage related functions such
          as moving, deleting or copying file and changing
          directories.  Any command that accesses the floppy
          drive will take some time, so make sure long timeouts
          are used or are disabled.  Initializing a floppy disk
          takes over two minutes (about 2:20).

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViString name
IN        Specifies a file name or directory to be acted upon. 
          If specifying a filename, the drive specifier can be
          appended in front of the filename.  For example, if
          filename is "test", providing the name of "mem:test",
          "int:test", or "ram:test" will direct the operation 
          to nonvolatile memory, internal disk, or volatile RAM
          respectively, regardless of current default drive.

PARAM 4 : ViString dest 
IN        Specifies destination for move, rename, or copy
          command.  A drive specifier may be appended in front
          of the destination just as with the name parameter.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    $    PARAM 2 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
    �    PARAM 3 : ViString name
IN        Specifies a file name or directory to be acted upon. 
          If specifying a filename, the drive specifier can be
          appended in front of the filename.  For example, if
          filename is "test", providing the name of "mem:test",
          "int:test", or "ram:test" will direct the operation 
          to nonvolatile memory, internal disk, or volatile RAM
          respectively, regardless of current default drive.
     �    PARAM 4 : ViString dest 
IN        Specifies destination for move, rename, or copy
          command.  A drive specifier may be appended in front
          of the destination just as with the name parameter.
   S�����  }    Error                            T� "  �       vi                               T�    �    request                          V! Z  �  �    name                             W� �  �  �    dest                               	           0              UCHANGE DIRECTORY hp871x_CHANGE_DIR COPY FILE hp871x_COPY_FILE DELETE FILE hp871x_DELETE_FILE INITIALIZE NON-VOLATILE MEMORY hp871x_INIT_MEM INITIALIZE FLOPPY DISK hp871x_INIT_DISK MAKE NEW DIRECTORY hp871x_MAKE_DIR REMOVE DIRECTORY hp871x_REMOVE_DIR RENAME OR MOVE FILE hp871x_MOVE_FILE MOVE UP ONE LEVEL IN DIR STRUCTURE hp871x_DIR_UP SELECT VOLATILE RAM AS DEFAULT DRIVE hp871x_RAM SELECT NON-VOLATILE RAM AS DEFAULT DRIVE hp871x_NONVOL SELECT FLOPPY DISK AS DEFAULT DRIVE hp871x_DISK TRANSFER FILE FROM ANALYZER TO PC hp871x_FILE_FROM_RFNA TRANSFER FILE FROM PC TO ANALYZER hp871x_FILE_TO_RFNA    ""    ""   E    PURPOSE : Writes/reads to/from the Parallel/Serial/User/Limit
          ports.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViInt32 port_data
IN        Contains one byte or one bit of information to be
          written; depending upon request.  Since this is only
          one byte, value should be < 256;  for one bit, value
          must be 0 or 1.

PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 4 : ViPInt32 cur_data 
OUT       When request is a query, returns the current data 
          read from the specified port.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     �    PARAM 2 : ViInt32 port_data
IN        Contains one byte or one bit of information to be
          written; depending upon request.  Since this is only
          one byte, value should be < 256;  for one bit, value
          must be 0 or 1.
     �    PARAM 4 : ViPInt32 cur_data 
OUT       When request is a query, returns the current data 
          read from the specified port.
    $    PARAM 3 : ViString request
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
   _�����  }    Error                            `J "  �       vi                               `� K �      port_data                        a� � �       cur_data                         b*  � ��      request                            	           0       �                   	                    	  �WRITE DATA TO PARALLEL PORT hp871x_DATA_PARALLEL WRITE DATA TO SERIAL PORT hp871x_DATA_SERIAL WRITE 0 OR 1 TO USER TTL PORT hp871x_DATA_USER WRITE 0 OR 1 TO LIMIT TTL PORT hp871x_DATA_LIMIT READ DATA FROM PARALLEL PORT hp871x_DATA_PARALLEL_Q READ DATA FROM SERIAL PORT hp871x_DATA_SERIAL_Q READ 0 OR 1 FROM USER TTL PORT hp871x_DATA_USER_Q READ 0 OR 1 FROM LIMIT TTL PORT hp871x_DATA_LIMIT_Q READ STATUS OF PARALLEL PORT hp871x_DATA_STATUS_Q   S    PURPOSE : Sets or reads the USER TTL feature.  This feature
          differs slightly between the 8711A/871xB and the 
          newer 871xC.  This function makes most of these
          differences invisible to the user although one item,
          the Sweep feature is not available to the 8711A or
          871xB. 

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViPString TTL_status  
OUT       When request is a query, indicates current USER TTL
          setup ("DEFAULT", "KEY" or "SWEEP").
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     �    PARAM 3 : ViPString TTL_status  
OUT       When request is a query, indicates current USER TTL
          setup ("DEFAULT", "KEY" or "SWEEP").
    &    PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
   i�����  }    Error                            jT "  �       vi                               j� 0� �       TTL_status                       kF 0 � ��      request                            	           0    	                       wDEFAULT hp871x_TTL_DEFAULT SOFTKEY AUTO-STEP hp871x_TTL_KEY TRACK SWEEP hp871x_TTL_SWEEP QUERY USER TTL SETUP hp871x_Q       PURPOSE : Performs various program control functions.  This is
          designed for use with an IBASIC program contained in
          memory of the analyzer.  This function can control
          that program's operation (i.e., Run, Pause, Stop, 
          etc.).   All this requires that the IBASIC option
          (Opt 1C2) be installed (8711A, 871xB, or 871xC only). 
          To load a program, see hp871x_progLoad.
          
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViString command  
IN        Contains the command to be sent if "Command" choice 
          is selected.


PARAM 4 : ViPReal64 prog_status  
OUT       Contains the current IBASIC program status.     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    �    PARAM 4 : ViChar str_data[]  
IN/OUT    Depending upon request, contains one of three items:
          1.  The Command to be executed in IBASIC.
          2.  The returned current state of the IBASIC program
              (RUN, PAUSE, or STOP).
          3.  The returned content of the specified string
              variable specified by prog_data.
          This parameter is an input for item #1, output for 
          items #2 and #3.
    &    PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.
     �    PARAM 3 : ViString prog_data  
IN        Depending upon request, contains either the command
          to be sent or the variable name to be set/queried.
   q�����  }    Error                            r� "  �       vi                               r� U� �       prog_status                      t�  $ �,    request                          u� d 9 �  �    comand                             	           0    	                      hDELETE IBASIC PROGRAM hp871x_PROG_DELETE EXECUTE IBASIC COMMAND hp871x_PROG_COMMAND STOP IBASIC PROGRAM EXECUTION hp871x_PROG_STOP PAUSE IBASIC PROGRAM EXECUTION hp871x_PROG_PAUSE RUN IBASIC PROGRAM hp871x_PROG_RUN CONTINUE PAUSED PROGRAM  hp871x_PROG_CONT WAIT FOR IBASIC PROGRAM TO COMPLETE hp871x_PROG_WAIT QUERY STATE OF IBASIC PROGRAM hp871x_PROG_STATE_Q    ""   �    PURPOSE : Allows user to set/read both string and numeric variables from an internal IBASIC program.
           
PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString name.  Variable name; append "?" if it is 
IN        to be queried. 
  
PARAM 3 : ViString str_data.  Data to be input to string
IN        variable 'name'  
          
PARAM 4 : ViPString cur_str. OPTIONAL  Current contents of 
OUT       string variable 'name' 
 
PARAM 5 : ViReal64 number_data.  OPTIONAL Numeric value to be
IN        input to variable 'name' 

PARAM 6 : ViPReal64  cur_number.  OPTIONAL  Current contents of
OUT       variable 'name' 
                   �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     N    PARAM 2 : ViString name
IN        Specifies a variable to be set or queried
     �    PARAM 3 : ViString str_data
IN        Specifies the string data to be assigned to the string
          variable specified in variable name.
     �    PARAM 5 : ViReal64 number_data  
IN        Specifies the numeric data to be assigned to the 
          variable specified in variable name.
  
     r    PARAM 6 : ViPReal64 cur_imp 
OUT       Returns current value contained in variable specified
          by name.
     u    PARAM 4 : ViPString  
IN/OUT    Contains current string data contained in the 
          variable specified by name   {� �����  }    Error                            |   �       vi                               |� 6  �  �    name                             }/ x  �  �    str_data                         }� �  �      number_data                      ~^ x� �       cur_number                       ~� 6� �       cur_str                            	           0    ""    "" ?�      �      ��                            	           	          �    PURPOSE : Copies an IBASIC program stored in an ASCII file with
          the name specified by filename from the controlling
          computer to the IBASIC active program memory.  The
          filename should include the full path to the file on
          the controlling computer, including drive specifier
          (e.g., C:).  Once the program is loaded, it can be
          RUN, or otherwise controlled, with the
          hp871x_progControl function.

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString filename  
IN        Specifies filename (including location) of the file
          that contains the IBASIC program to be transferred to
          the analyzer IBASIC program register.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
     �    PARAM 2 : ViString filename  
IN        Specifies filename (including location) of the file
          that contains the IBASIC program to be transferred to
          the analyzer IBASIC program register.
   �)����  }    Error                            �� "  �       vi                               �  C $ �     progfile                        ���� i ��                                            	           0    ""    �progfile should contain filename of IBASIC program in ASCII text,
and may require full path name.  e.g.  C:\ibasic\analyzer\prog.txt   �    The reset function places the instrument in a default state. Before issuing this function, it may be necessary to send a device clear to ensure that the instrument can execute a reset.  A device clear can be issued by invoking hp871x_dcl().

For the states affected by the reset command, see the instrument manual. Reset does not affect the status system or clear any errors. 

The preferred command to use instead of this is: hp871x_preset.     �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
   �-k���  �    Status                           � "  �  �    Instrument Handle                  	           0   0    The self-test function causes the instrument to perform a self-test and returns the result of that self-test.  This is used to verify that an instrument is operating properly.  A failure may indicate a potential hardware problem.

For a list of possible self-test errors, consult the instrument manual.    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     \    [OUTPUT PARAMETER]

Numeric result from self-test operation.

0 = no error ( test passed)
     T    [OUTPUT PARAMETER]

Self-test status message.  This is limited to 256 characters.
   �q���  �    Status                           �� "  �  �    Instrument  Handle               �^ 3q �  �    Self Test Result                 �� � " � �    Self Test Message                  	           0    	            	           �    This function returns the error numbers and corresponding error messages in the error queue of an instrument.  See the manual for a listing of the instrument error numbers and messages.

Instrument errors may occur when a user attempts to place the instrument in an invalid state such as sending an invalid sequence of coupled commands.

Instrument errors can be detected by polling.  Automatic polling can be accomplished by using the hpxxxx_errorQueryDetect() function.

    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     .    [INPUT PARAMETER]

Instrument's error code.
     V    [OUTPUT PARAMETER]

Instrument's error message.  This is limited to 256 characters.
   ��q���  �    Status                           �� "  �  �    Instrument Handle                �= 3q �  �    Error Code                       �s � " � �    Error Message                      	           0    	            	            r    This function translates the error value returned from an instrument driver function to a user-readable string.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     k    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().  It may be VI_NULL.      P    [INPUT PARAMETER]

The error return value from an instrument driver function.
     P    [OUTPUT PARAMETER]

Error message string.  This is limited to 256 characters.
   �H	q���  �    Status                           �(	 "  �  �    Instrument Handle                �� Gq �  �    Status Code                      �� � " � �    Message                            	           0    0    	            �    This function returns the revision of the instrument driver and the firmware of the instrument being used. 

The preferred command to query the analyzer is the hp871x_readID function.    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     V    [OUTPUT PARAMETER]

Instrument driver revision.  This is limited to 256 characters.
     X    [OUTPUT PARAMETER]

Instrument firmware revision.  This is limited to 256 characters.
   �q���  �    Status                           �� "  �  �    Instrument Handle                �A 0 � � ,    Instrument Driver Revision       �� � � � ,    Firmware Revision                  	           0    	            	           W    The timeout function sets the timeout value for driver I/O transactions in milliseconds. The timeout period may vary on computer platforms.

The default timeout period varies by VISA implementation.  For HP VISA, it is 2 seconds.

Some implementations of VISA will only accept a limited number of timeout values.  If you set the VISA timeout to a given value using one of those implementations, and then query the timeout, you may find that the query returns a different value than the one you set.  HP VISA sets the timeout to the precise value you specify, and returns that value when queried. 
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     �    [INPUT PARAMETER]

This value sets the I/O timeout for all functions in the driver. It is specified in milliseconds. 

MAX = hpxxxx_TIMEOUT_MAX   2147483647
MIN = hpxxxx_TIMEOUT_MIN   0
   �[t���  �    Status                           �; "  �  �    Instrument Handle                �� G H �      Set Time Out                    ���� b 3��                                            	           0    d��x      '           Timeout is in milliseconds    �    The timeout query function returns the timeout value for driver I/O transactions in milliseconds.  The timeout period may vary on computer platforms.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     y    [OUTPUT PARAMETER]

This value sets the I/O timeout for all functions in the driver. It is specified in milliseconds. 
   �s���  �    Status                           �� "  �  �    Instrument Handle                �W Cs � �    Time Out                           	           0    	           +    This function enables or disables automatic instrument error checking.

When automatic instrument error querying is enabled, the driver will query the instrument for an error before returning from each driver function.  This adds the overhead of one instrument query to each dirver function call.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     �    [INPUT PARAMETER]

A boolean which enables/disables automatic instrument error querying.  

If VI_TRUE, enable automatic instrument error querying.

If VI_FALSE, disable automatic instrument error querying.
   ��	t���  �    Status                           ��	   �  �    Instrument Handle                � H : �       Set Error Query Detect             	           0     Enable VI_TRUE Disable VI_FALSE   =    This function indicates if automatic instrument error detection is enabled or disabled. 

When automatic instrument error querying is enalbed, the driver will query the instrument for an error before returning from each driver function.  This adds the overhead of one instrument query to each dirver function call.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     �    [OUTPUT PARAMETER]

A boolean which indicates if automatic instrument error querying is enabled or disabled.  

If VI_TRUE, automatic instrument error querying is enabled.

If VI_FALSE, automatic instrument error querying is disabled.
   ������  �    Status                           �� "  �  �    Instrument Handle                �6 I� �  d    Error Query Detect                 	           0    	           �    This function sends a device clear (DCL) to the instrument.

A device clear will abort the current operation and enable the instrument to accept a new command or query.

This is particularly useful in situations where it is not possible to determine the instrument state. In this case, it is customary to send a device clear before issuing a new instrument driver function.  The device clear ensures that the instrument will be able to begin processing the new commands.

    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
   ��u���  �    Status                           �� "  �  �    Instrument Handle                  	           0   �    PURPOSE : Sets up or reads various fault location parameters. 
          Of course, the fault location option must be 
          installed for this function to work.   

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2).  

PARAM 4 : ViPString cur_status  
OUT       When request is a query, contains the current status
          of the requested parameter.  Returns "FEET", 
          "METERS", "MINIMUM", "MEDIUM", "MAXIMUM", "LOWPASS",
          or "BANDPASS" depending upon request and current
          state.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
   �(����       Error                            �� "  �       vi                              ���� F� �       errstr                             	           0    	           �    PURPOSE : Sets up or reads various fault location parameters. 
          Of course, the fault location option must be 
          installed for this function to work.   

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViString request  
IN        The string that essentially tells this function what
          to do.  If unsure of exactly what this function does
          in response to a specific request string, refer to
          this function in the Windows help file for this
          driver.

PARAM 3 : ViInt32 channel  
IN        Indicates channel number (1 or 2).  

PARAM 4 : ViPString cur_status  
OUT       When request is a query, contains the current status
          of the requested parameter.  Returns "FEET", 
          "METERS", "MINIMUM", "MEDIUM", "MAXIMUM", "LOWPASS",
          or "BANDPASS" depending upon request and current
          state.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
   ����       Error                            � "  �       vi                              ���� J� �       statstr                            	           0    	            )    This function queries the status byte.     �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     4    [OUTPUT PARAMETER]

The value of the status byte.
   �dv���  �    Status                           �D "  �  �    Instrument Handle                ƣ :� �  `    StatusByte                         	           0    	            B    This function sends the *OPC? common command to the instrument.     �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     �    [OUTPUT PARAMETER]

If VI_TRUE, all instrument operations are complete.

If VI_FALSE, instrument operations are still pending.

   ��u���  �    Status                           �� "  �  �    Instrument Handle                �$ @� �       Instrument Ready                   	           0    	            6    This function queries the operation event register.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     A    [OUTPUT PARAMETER]

The value of the operation event register.
   ˨t���  �    Status                           ͈ "  �  �    Instrument Handle                �� L� �  d    Operation Event Register           	           0    	            :    This function queries the operation condition register.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     E    [OUTPUT PARAMETER]

The value of the operation condition register.
   �.u���  �    Status                           � "  �  �    Instrument Handle                �m 6� �  d    Operation Condition Register       	           0    	            9    This function queries the questionable event register.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     D    [OUTPUT PARAMETER]

The value of the questionable event register.
   ҷr���  �    Status                           ԗ "  �  �    Instrument Handle                �� =� �  d    Questionable Event Register        	           0    	            =    This function queries the questionable condition register.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     I    [OUTPUT PARAMETER]

The value of the questionable condition register.
    �Co���  �    Status                           �# "  �  �    Instrument Handle                ؂ =� �  d    Questionable Condition Register    	           0    	            l    This function passes an instrument command to the instrument.  The function does not expect any response.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require atention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     |    [INPUT PARAMETER]

The instrument command.  It must be a NULL termianted C string and may not exceed 256 bytes in length.
   �s���  �    Status                           �� "  �  �    Instrument Handle                �? 1 " � �    Send String Command                	           0    ""   �    Passes the command string to the instrument.  The function waits for a response which must be a string (character data).

A max of size-1 bytes will be read from the instrument into the string and the string will be NULL terminated (so its length can be found with strlen).

If more than size-1 bytes are generated by the instrument then remaining bytes will be discarded and the instrument's output buffer will be cleared.
     �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require atention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     |    [INPUT PARAMETER]

The instrument command.  It must be a NULL termianted C string and may not exceed 256 bytes in length.
     �    [INPUT PARAMETER]

The length of result array in bytes. 

MIN = hpxxxx_CMDSTRING_Q_MIN   1
MAX = hpxxxx_CMDSTRING_Q_MAX   2147483647
     8    [OUTPUT PARAMETER]

The response from the instrument.
   �,o���  �    Status                           �	 "  �  �    Instrument Handle                �h 0 " � �    Query String Command             �� r " �      String Size                      �{ � " � �    String Result                      	           0    ""    ���                 	            �    This function passes the string in cmd_str followed by a space and then an integer.  Note that either a ViInt16 or 32 can be passed, as the ViInt16 will be promoted.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require atention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     |    [INPUT PARAMETER]

The instrument command.  It must be a NULL termianted C string and may not exceed 256 bytes in length.
     �    [INPUT PARAMETER]

The integer to be appended to the command string. 

MIN = hpxxxx_CMDINT_MIN   -2147483647
MAX = hpxxxx_CMDINT_MAX    2147483647
   �t���  �    Status                           � "  �  �    Instrument Handle                �� / " � �    Send Integer Command             �n p $ �      Send Integer                       	           0    ""    ����                 t    Passes the command string to the instrument.  The function expects a 16-bit integer response from the instrument.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     |    [INPUT PARAMETER]

The instrument command.  It must be a NULL termianted C string and may not exceed 256 bytes in length.
     8    [OUTPUT PARAMETER]

The response from the instrument.
   �q���  �    Status                           �g "  �  �    Instrument Handle                �� / " � �    Query I16 Command                �J v� �       I16 Result                         	           0    ""    	            t    Passes the command string to the instrument.  The function expects a 32-bit integer response from the instrument.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require atention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     |    [INPUT PARAMETER]

The instrument command.  It must be a NULL termianted C string and may not exceed 256 bytes in length.
     8    [OUTPUT PARAMETER]

The response from the instrument.
   ��q���  �    Status                           �� "  �  �    Instrument Handle                �9 . " � �    Query I32 Command                � wq �  �    I32 Result                         	           0    ""    	            �    This function passes the string in cmd_str followed by a space and then a real.  Note that either a ViReal32 or 64 can be passed as the ViReal32 will be promoted.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require atention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     |    [INPUT PARAMETER]

The instrument command.  It must be a NULL termianted C string and may not exceed 256 bytes in length.
     �    [INPUT PARAMETER]

The real number to be appended to the command string. 

MAX = hpxxxx_CMDREAL_MAX    1E+300
MIN = hpxxxx_CMDREAL_MIN   -1E+300
   �t���  �    Status                           �~ "  �  �    Instrument Handle                �� 0 " � �    Send Real Command                �a o " �      Send Real                          	           0    "" }s�k��;~7�<� u��7�<� u�                      q    Passes the command string to the instrument.  The function expects a 64-bit real response from the instrument.
    �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require atention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
     |    [INPUT PARAMETER]

The instrument command.  It must be a NULL termianted C string and may not exceed 256 bytes in length.
     8    [OUTPUT PARAMETER]

The response from the instrument.
   ��q���  �    Status                           �h "  �  �    Instrument Handle                �� . " � �    Query Real Command               �K x� �       Real Result                        	           0    ""    	          	�    PURPOSE : This function is not a typical VXIplug&play function
          in that it does not communicate with the instrument. 
          It is provided as a customer convenience only.  This
          function is most useful in conjunction with the
          hp871x_dir function since that function returns a 
          list of filenames separated by commas. 

          This function will parse any string.  It will return
          the portion of string up to the first occurrence of a
          one-character delimiter.  The default delimiter is a
          comma.  This function also returns the original 
          string minus the just-parsed string.  In this way,
          subsequent calls will fully parse any string.  The
          variable not_done will be set to 0 once the entire
          string has been parsed.  

          The easiest way to understand this is with an 
          example.  Assume the original string is 
          "THIS,IS,A,TEST,123".  The below chart will show each
          result for each variable after each call to the
          function.

                       in_out            parsed       not_done
                  ------------------     ------       --------
Before 1st call   THIS,IS,A,TEST,123      N/A           N/A
After 1st call    IS,A,TEST,123           THIS           1
After 2nd call    A,TEST,123               IS            1
After 3rd call    TEST,123                 A             1
After 4th call    123                     TEST           1
After 5th call                            123            0

PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
            
PARAM 2 : ViChar in_out[]
IN/OUT    Initially, contains the entire string to be parsed. 
          Each call will strip off the portion of the string
          preceding the next occurrence of the delimiter;
          resulting in the string length decreasing after each
          call until it equals a null string.

PARAM 3 : ViPString parsed  
IN        Returns the portion of the in_out string preceding 
          the next occurrence of the delimiter.  If the
          delimiter is not present in the in_out string, this
          string will equal the in_out string.

PARAM 4 : ViPInt32 not_done  
OUT       Returns 1 if in_out is not a null string (i.e.,
          Remains 1 until string is fully parsed, at which time
          it will equal 0).

PARAM 5 : ViString delimiter  
IN        Contains a single character to be searched for as the
          delimiter in parsing the in_out string.
     �    VI_SUCCESS:No error.Non VI_SUCCESS:Indicates error condition. To determine error message, pass the return value to routine "hp871x_error_message"

     R    PARAM 1 : ViSession vi
IN        Instrument Handle returned from hp871x_init().
    A    PARAM 2 : ViChar in_out[]  
IN/OUT    Initially, contains the entire string to be parsed. 
          Each call will strip off the portion of the string
          preceding the next occurrence of the delimiter;
          resulting in the string length decreasing after each
          call until it equals a null string.
        PARAM 3 : ViPString parsed  
IN        Returns the portion of the in_out string preceding 
          the next occurrence of the delimiter.  If the
          delimiter is not present in the in_out string, this
          string will equal the in_out string.
     �    PARAM 4 : ViPInt32 not_done  
OUT       Returns 1 if in_out is not a null string (i.e.,
          Remains 1 until string is fully parsed, at which time
          it will equal 0).
     �    PARAM 5 : ViString delimiter  
IN        Contains a single character to be searched for as the
          delimiter in parsing the in_out string.
   �����  }    Error                            % "  �       vi                                ' $ �,    in_out                           � '� �       parsed                           � x� �       not_done                         	� z $ �  (    delimiter                          	           0    	            	            	            ","    �    The close function terminates the software connection to the instrument and de-allocates system resources.  It is generally a good programming habit to close the instrument handle when the program is done using the instrument.     �    The meaning of the VISA status returned by the function is as follows:

 = 0  "VI_SUCCESS"    The function completed successfully.
 > 0  Warning         The function completed, but an
                      exceptional condition occurred which
                      may require attention.
 < 0  Error           The function did not complete
                      successfully.

Use the hpxxxx_error_message() function to get a textual description of errors and warnings.
     W    [INPUT PARAMETER]

The instrument's VISA session handle returned from hpxxxx_init().
   �q���  �    Status                           r "  �  �    Instrument Handle                  	           0 ����         	z       K-    init                            ����         �  �     K-    preset                          ����            �     K-    clock                           ����         #~  )1     K-    beep                            ����         +�  3�     K-    Z0                              ����         5�  >D     K-    readID                          ����         A�  H�     K-    average                         ����         K�  R     K-    bandwidth                       ����         T8  `2     K-    aperture                        ����         c  iF     K-    calControl                      ����         m  s�     K-    calkit                          ����         v  yx     K-    calMeasure                      ����         {^  ~�     K-    calType                         ����         ��  �I     K-    doCal                           ����         ��  ��     K-    autozero                        ����         ��  �A     K-    frequency                       ����         �  �I     K-    power                           ����         ��  ��     K-    powerSweep                      ����         �`  �i     K-    points                          ����         ��  ��     K-    spurAvoid                       ����         �d  Ў     K-    refOscillator                   ����         ��  �L     K-    sweepTime                       ����         ��  �3     K-    trigger                         ����         �
  ��     K-    triggerSource                   ����         �N  ��     K-    takeSweep                       ����         �  �     K-    sweepAlt                        ����         �@  �z     K-    sweepStep                       ����         �  �     K-    display                         ����        � �     K-    format                          ����        	q "     K-    screen                          ����         �     K-    labelsFreq                      ����         (R     K-    labelsUser                      ����        +K 2     K-    title                           ����        4 :G     K-    markerSet                       ����        >� Gj 	    K-    markerRead                      ����        K Pv     K-    measure                         ����        TX Y�     K-    channel                         ����        [� g/     K-    multiport                       ����        k� o�     K-    traceAvgRead                    ����        p� x<     K-    extensions                      ����        z� �V     K-    save                            ����        �$ �     K-    saveDefine                      ����        �� �u     K-    recall                          ����        �x �P     K-    scale                           ����        �� ��     K-    traceRead                       ����        � �     K-    traceWrite                      ����        �` �     K-    faultCal                        ����        � �     K-    faultMeas                       ����        � �c     K-    faultSetup                      ����        �6 �     K-    limits                          ����        �F �     K-    limitSet                        ����        � �     K-    softkey                         ����         M     K-    softkeyBegin                    ����        _ /     K-    keyRead                         ����        , =     K-    keyQueue                        ����        � (�     K-    print                           ����        0� 6�     K-    message                         ����        9k A�     K-    dir                             ����        C� L�     K-    dirInfo                         ����        Nk X�     K-    memory                          ����        \` cV     K-    dataPorts                       ����        f\ lt     K-    userTTL                         ����        m� v�     K-    progControl                     ����        y# U     K-    progVariable                    ����        �( ��     K-    progLoad                        ����        �i �l     K-    reset                           ����        �� �     K-    self_test                       ����        � ��     K-    error_query                     ����        �� �K     K-    error_message                   ����        �A ��     K-    revision_query                  ����        �� �^     K-    timeOut                         ����        �x ��     K-    timeOut_Q                       ����        �� ��     K-    errorQueryDetect                ����        �� �+     K-    errorQueryDetect_Q              ����        �� �     K-    dcl                             ����        �� �     K-    esr_Q                           ����        �� �w     K-    esb_Q                           ����        �3 ��     K-    readStatusByte_Q                ����        Ǜ ʮ     K-    opc_Q                           ����        �j �0     K-    operEvent_Q                     ����        �� Ѻ     K-    operCond_Q                      ����        �v �B     K-    quesEvent_Q                     ����        �� ��     K-    quesCond_Q                      ����        ُ ��     K-    cmd                             ����        �y �     K-    cmdString_Q                     ����        �� �     K-    cmdInt                          ����        � �     K-    cmdInt16_Q                      ����        � ��     K-    cmdInt32_Q                      ����        �� ��     K-    cmdReal                         ����        � ��     K-    cmdReal64_Q                     ����        �� 
+     K-    stringParse                     ����        � �     K-    close                                 �                                     DInitialize                          CSystem                               DPreset                               DClock                                DBeep                                 DZ0                                   DRead Instrument ID                  �Average                              DAverage                              DIF Bandwidth                         DAperture                            �Calibration                          DCal Control                          DCal Kit                              DCal Measure                          DCal Type                             DDo Calibration                       DAuto Zero                           Stimulus                             DFrequency                            DPower                                DPower Sweep                          DPoints                               DSpur Avoidance                       DReference Oscillator                VSweep                                DSweep Time                           DTrigger                              DTrigger Source                       DTake Sweep                           DAlternate Sweep                      DStep Sweep                          �Display                              DDisplay                              DFormat                               DScreen                               DFrequency Labels                     DUser Labels                          DTitle                               �Marker                               DSet Marker                           DRead Marker                         Measurement                          DMeasure                              DChannel                              DMultiport                            DTrace Average Read                   DPort Extensions                     _Save Recall                          DSave                                 DSave Define                          DRecall                              �Scale Reference                      DScale                               �Array (Trace) Data                   DTrace Read                           DTrace Write                         1Fault Location (Opt 100)             DFault Calibration Settings           DFault Measurement Settings           DFault Setup                         xLimits                               DLimits                               DSet Limits                          �User Interface (I/O)                 DSoftkey                              DSoftkey Begin                        DKey Read                             DKey Queue                            DPrint                                DMessage                             �Mass Storage                         DDirectory                            DDirectory Information                DMemory                              )Programming and Control              DData Ports                           DUser TTL                             DProgram Control                      DProgram Variable                     DProgram Load                        �System Utility                       DReset                                DSelf-Test                            DError Query                          DError Message                        DRevision Query                       DSet Timeout                          DQuery Timeout                        DSet Error Query Detect               DQuery Error Query Detect             DDevice Clear                         DESR Query                            DESB Query                            DRead Status Byte                     DOPC?                                 DStatus operation event               DStatus operation condition           DStatus questionable event            DStatus questionable condition       aPassthrough Functions                DSend String                          DQuery String                         DSend Integer                         DQuery Int16                          DQuery Int32                          DSend Real                            DQuery Real64                        	Utility                              DString Parse                         DClose                           