#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/macro_keyboard.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/macro_keyboard.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=usbdrv/usbdrvasm.S usbdrv/usbdrv.c usbdrv/oddebug.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/usbdrv/usbdrvasm.o ${OBJECTDIR}/usbdrv/usbdrv.o ${OBJECTDIR}/usbdrv/oddebug.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/usbdrv/usbdrvasm.o.d ${OBJECTDIR}/usbdrv/usbdrv.o.d ${OBJECTDIR}/usbdrv/oddebug.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/usbdrv/usbdrvasm.o ${OBJECTDIR}/usbdrv/usbdrv.o ${OBJECTDIR}/usbdrv/oddebug.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=usbdrv/usbdrvasm.S usbdrv/usbdrv.c usbdrv/oddebug.c main.c

# Pack Options 
PACK_COMPILER_OPTIONS=-I "${DFP_DIR}/include"
PACK_COMMON_OPTIONS=-B "${DFP_DIR}/gcc/dev/atmega328p"



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/macro_keyboard.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATmega328P
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/usbdrv/usbdrvasm.o: usbdrv/usbdrvasm.S  .generated_files/flags/default/90a8c3f65be609b9147891bbbe0ecadcacb1c15b .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/usbdrv" 
	@${RM} ${OBJECTDIR}/usbdrv/usbdrvasm.o.d 
	@${RM} ${OBJECTDIR}/usbdrv/usbdrvasm.o 
	@${RM} ${OBJECTDIR}/usbdrv/usbdrvasm.o.ok ${OBJECTDIR}/usbdrv/usbdrvasm.o.err 
	 ${MP_CC} $(MP_EXTRA_AS_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -DDEBUG  -x assembler-with-cpp -c -D__$(MP_PROCESSOR_OPTION)__  -MD -MP -MF "${OBJECTDIR}/usbdrv/usbdrvasm.o.d" -MT "${OBJECTDIR}/usbdrv/usbdrvasm.o.d" -MT ${OBJECTDIR}/usbdrv/usbdrvasm.o -o ${OBJECTDIR}/usbdrv/usbdrvasm.o usbdrv/usbdrvasm.S  -DXPRJ_default=$(CND_CONF)  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/usbdrv/usbdrvasm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1
	
else
${OBJECTDIR}/usbdrv/usbdrvasm.o: usbdrv/usbdrvasm.S  .generated_files/flags/default/7f4821dc37a5b8cae9edfdf5c09db9b3c2369bf6 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/usbdrv" 
	@${RM} ${OBJECTDIR}/usbdrv/usbdrvasm.o.d 
	@${RM} ${OBJECTDIR}/usbdrv/usbdrvasm.o 
	@${RM} ${OBJECTDIR}/usbdrv/usbdrvasm.o.ok ${OBJECTDIR}/usbdrv/usbdrvasm.o.err 
	 ${MP_CC} $(MP_EXTRA_AS_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x assembler-with-cpp -c -D__$(MP_PROCESSOR_OPTION)__  -MD -MP -MF "${OBJECTDIR}/usbdrv/usbdrvasm.o.d" -MT "${OBJECTDIR}/usbdrv/usbdrvasm.o.d" -MT ${OBJECTDIR}/usbdrv/usbdrvasm.o -o ${OBJECTDIR}/usbdrv/usbdrvasm.o usbdrv/usbdrvasm.S  -DXPRJ_default=$(CND_CONF)  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/usbdrv/usbdrvasm.o.asm.d"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/usbdrv/usbdrv.o: usbdrv/usbdrv.c  .generated_files/flags/default/76e6d58e46514c3a81b41341001b7d36743b87cb .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/usbdrv" 
	@${RM} ${OBJECTDIR}/usbdrv/usbdrv.o.d 
	@${RM} ${OBJECTDIR}/usbdrv/usbdrv.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/usbdrv/usbdrv.o.d" -MT "${OBJECTDIR}/usbdrv/usbdrv.o.d" -MT ${OBJECTDIR}/usbdrv/usbdrv.o  -o ${OBJECTDIR}/usbdrv/usbdrv.o usbdrv/usbdrv.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/usbdrv/oddebug.o: usbdrv/oddebug.c  .generated_files/flags/default/bc6b428b5113b508a1aeb551a7023bf598374425 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/usbdrv" 
	@${RM} ${OBJECTDIR}/usbdrv/oddebug.o.d 
	@${RM} ${OBJECTDIR}/usbdrv/oddebug.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/usbdrv/oddebug.o.d" -MT "${OBJECTDIR}/usbdrv/oddebug.o.d" -MT ${OBJECTDIR}/usbdrv/oddebug.o  -o ${OBJECTDIR}/usbdrv/oddebug.o usbdrv/oddebug.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/5e71b2e8e5199b99b2fa32ecd3458d57cf9246e3 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/usbdrv/usbdrv.o: usbdrv/usbdrv.c  .generated_files/flags/default/4eeacbdc2f0efe733af79bcdca9ad44ee405deb8 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/usbdrv" 
	@${RM} ${OBJECTDIR}/usbdrv/usbdrv.o.d 
	@${RM} ${OBJECTDIR}/usbdrv/usbdrv.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/usbdrv/usbdrv.o.d" -MT "${OBJECTDIR}/usbdrv/usbdrv.o.d" -MT ${OBJECTDIR}/usbdrv/usbdrv.o  -o ${OBJECTDIR}/usbdrv/usbdrv.o usbdrv/usbdrv.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/usbdrv/oddebug.o: usbdrv/oddebug.c  .generated_files/flags/default/7d340a57e25a349046578feedf4c0ecf6050540c .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/usbdrv" 
	@${RM} ${OBJECTDIR}/usbdrv/oddebug.o.d 
	@${RM} ${OBJECTDIR}/usbdrv/oddebug.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/usbdrv/oddebug.o.d" -MT "${OBJECTDIR}/usbdrv/oddebug.o.d" -MT ${OBJECTDIR}/usbdrv/oddebug.o  -o ${OBJECTDIR}/usbdrv/oddebug.o usbdrv/oddebug.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/931609243660a6e174c324588725dafe95ee7e70 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/macro_keyboard.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}   -gdwarf-2 -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="dist/${CND_CONF}/${IMAGE_TYPE}/macro_keyboard.${IMAGE_TYPE}.map"    -o dist/${CND_CONF}/${IMAGE_TYPE}/macro_keyboard.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1 -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	
	
	
	
	
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/macro_keyboard.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="dist/${CND_CONF}/${IMAGE_TYPE}/macro_keyboard.${IMAGE_TYPE}.map"    -o dist/${CND_CONF}/${IMAGE_TYPE}/macro_keyboard.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION) -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}/avr-objcopy -O ihex "dist/${CND_CONF}/${IMAGE_TYPE}/macro_keyboard.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/macro_keyboard.${IMAGE_TYPE}.hex"
	
	
	
	
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
