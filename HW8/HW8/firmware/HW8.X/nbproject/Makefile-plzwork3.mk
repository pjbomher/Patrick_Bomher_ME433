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
ifeq "$(wildcard nbproject/Makefile-local-plzwork3.mk)" "nbproject/Makefile-local-plzwork3.mk"
include nbproject/Makefile-local-plzwork3.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=plzwork3
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/HW8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/HW8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
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
SOURCEFILES_QUOTED_IF_SPACED=../src/system_config/plzwork3/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/plzwork3/framework/system/devcon/src/sys_devcon.c ../src/system_config/plzwork3/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/plzwork3/framework/system/ports/src/sys_ports_static.c ../src/system_config/plzwork3/system_init.c ../src/system_config/plzwork3/system_interrupt.c ../src/system_config/plzwork3/system_exceptions.c ../src/system_config/plzwork3/system_tasks.c ../src/app.c ../src/main.c ../../../../../../../microchip/harmony/v2_05/framework/system/int/src/sys_int_pic32.c /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/spi.c /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/i2c_master_noint.c /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/ili9341_2.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/711810173/sys_devcon.o ${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/95363924/sys_ports_static.o ${OBJECTDIR}/_ext/1534696357/system_init.o ${OBJECTDIR}/_ext/1534696357/system_interrupt.o ${OBJECTDIR}/_ext/1534696357/system_exceptions.o ${OBJECTDIR}/_ext/1534696357/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o ${OBJECTDIR}/_ext/1775169628/spi.o ${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o ${OBJECTDIR}/_ext/1775169628/ili9341_2.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o.d ${OBJECTDIR}/_ext/711810173/sys_devcon.o.d ${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o.d ${OBJECTDIR}/_ext/95363924/sys_ports_static.o.d ${OBJECTDIR}/_ext/1534696357/system_init.o.d ${OBJECTDIR}/_ext/1534696357/system_interrupt.o.d ${OBJECTDIR}/_ext/1534696357/system_exceptions.o.d ${OBJECTDIR}/_ext/1534696357/system_tasks.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o.d ${OBJECTDIR}/_ext/1775169628/spi.o.d ${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o.d ${OBJECTDIR}/_ext/1775169628/ili9341_2.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/711810173/sys_devcon.o ${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/95363924/sys_ports_static.o ${OBJECTDIR}/_ext/1534696357/system_init.o ${OBJECTDIR}/_ext/1534696357/system_interrupt.o ${OBJECTDIR}/_ext/1534696357/system_exceptions.o ${OBJECTDIR}/_ext/1534696357/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o ${OBJECTDIR}/_ext/1775169628/spi.o ${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o ${OBJECTDIR}/_ext/1775169628/ili9341_2.o

# Source Files
SOURCEFILES=../src/system_config/plzwork3/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/plzwork3/framework/system/devcon/src/sys_devcon.c ../src/system_config/plzwork3/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/plzwork3/framework/system/ports/src/sys_ports_static.c ../src/system_config/plzwork3/system_init.c ../src/system_config/plzwork3/system_interrupt.c ../src/system_config/plzwork3/system_exceptions.c ../src/system_config/plzwork3/system_tasks.c ../src/app.c ../src/main.c ../../../../../../../microchip/harmony/v2_05/framework/system/int/src/sys_int_pic32.c /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/spi.c /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/i2c_master_noint.c /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/ili9341_2.c


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
	${MAKE}  -f nbproject/Makefile-plzwork3.mk dist/${CND_CONF}/${IMAGE_TYPE}/HW8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX250F128B
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o: ../src/system_config/plzwork3/framework/system/clk/src/sys_clk_pic32mx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/901338372" 
	@${RM} ${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o ../src/system_config/plzwork3/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/711810173/sys_devcon.o: ../src/system_config/plzwork3/framework/system/devcon/src/sys_devcon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/711810173" 
	@${RM} ${OBJECTDIR}/_ext/711810173/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/711810173/sys_devcon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/711810173/sys_devcon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/711810173/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/711810173/sys_devcon.o ../src/system_config/plzwork3/framework/system/devcon/src/sys_devcon.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o: ../src/system_config/plzwork3/framework/system/devcon/src/sys_devcon_pic32mx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/711810173" 
	@${RM} ${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o ../src/system_config/plzwork3/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/95363924/sys_ports_static.o: ../src/system_config/plzwork3/framework/system/ports/src/sys_ports_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/95363924" 
	@${RM} ${OBJECTDIR}/_ext/95363924/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/95363924/sys_ports_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/95363924/sys_ports_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/95363924/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/95363924/sys_ports_static.o ../src/system_config/plzwork3/framework/system/ports/src/sys_ports_static.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1534696357/system_init.o: ../src/system_config/plzwork3/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1534696357" 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1534696357/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1534696357/system_init.o.d" -o ${OBJECTDIR}/_ext/1534696357/system_init.o ../src/system_config/plzwork3/system_init.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1534696357/system_interrupt.o: ../src/system_config/plzwork3/system_interrupt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1534696357" 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_interrupt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1534696357/system_interrupt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1534696357/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1534696357/system_interrupt.o ../src/system_config/plzwork3/system_interrupt.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1534696357/system_exceptions.o: ../src/system_config/plzwork3/system_exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1534696357" 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1534696357/system_exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1534696357/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1534696357/system_exceptions.o ../src/system_config/plzwork3/system_exceptions.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1534696357/system_tasks.o: ../src/system_config/plzwork3/system_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1534696357" 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1534696357/system_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1534696357/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1534696357/system_tasks.o ../src/system_config/plzwork3/system_tasks.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o: ../../../../../../../microchip/harmony/v2_05/framework/system/int/src/sys_int_pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1051747021" 
	@${RM} ${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o ../../../../../../../microchip/harmony/v2_05/framework/system/int/src/sys_int_pic32.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1775169628/spi.o: /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1775169628" 
	@${RM} ${OBJECTDIR}/_ext/1775169628/spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1775169628/spi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1775169628/spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1775169628/spi.o.d" -o ${OBJECTDIR}/_ext/1775169628/spi.o /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/spi.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o: /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/i2c_master_noint.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1775169628" 
	@${RM} ${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o.d 
	@${RM} ${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o.d" -o ${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/i2c_master_noint.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1775169628/ili9341_2.o: /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/ili9341_2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1775169628" 
	@${RM} ${OBJECTDIR}/_ext/1775169628/ili9341_2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1775169628/ili9341_2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1775169628/ili9341_2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1775169628/ili9341_2.o.d" -o ${OBJECTDIR}/_ext/1775169628/ili9341_2.o /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/ili9341_2.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o: ../src/system_config/plzwork3/framework/system/clk/src/sys_clk_pic32mx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/901338372" 
	@${RM} ${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/901338372/sys_clk_pic32mx.o ../src/system_config/plzwork3/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/711810173/sys_devcon.o: ../src/system_config/plzwork3/framework/system/devcon/src/sys_devcon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/711810173" 
	@${RM} ${OBJECTDIR}/_ext/711810173/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/711810173/sys_devcon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/711810173/sys_devcon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/711810173/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/711810173/sys_devcon.o ../src/system_config/plzwork3/framework/system/devcon/src/sys_devcon.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o: ../src/system_config/plzwork3/framework/system/devcon/src/sys_devcon_pic32mx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/711810173" 
	@${RM} ${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/711810173/sys_devcon_pic32mx.o ../src/system_config/plzwork3/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/95363924/sys_ports_static.o: ../src/system_config/plzwork3/framework/system/ports/src/sys_ports_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/95363924" 
	@${RM} ${OBJECTDIR}/_ext/95363924/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/95363924/sys_ports_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/95363924/sys_ports_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/95363924/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/95363924/sys_ports_static.o ../src/system_config/plzwork3/framework/system/ports/src/sys_ports_static.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1534696357/system_init.o: ../src/system_config/plzwork3/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1534696357" 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1534696357/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1534696357/system_init.o.d" -o ${OBJECTDIR}/_ext/1534696357/system_init.o ../src/system_config/plzwork3/system_init.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1534696357/system_interrupt.o: ../src/system_config/plzwork3/system_interrupt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1534696357" 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_interrupt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1534696357/system_interrupt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1534696357/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1534696357/system_interrupt.o ../src/system_config/plzwork3/system_interrupt.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1534696357/system_exceptions.o: ../src/system_config/plzwork3/system_exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1534696357" 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1534696357/system_exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1534696357/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1534696357/system_exceptions.o ../src/system_config/plzwork3/system_exceptions.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1534696357/system_tasks.o: ../src/system_config/plzwork3/system_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1534696357" 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1534696357/system_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1534696357/system_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1534696357/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1534696357/system_tasks.o ../src/system_config/plzwork3/system_tasks.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o: ../../../../../../../microchip/harmony/v2_05/framework/system/int/src/sys_int_pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1051747021" 
	@${RM} ${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1051747021/sys_int_pic32.o ../../../../../../../microchip/harmony/v2_05/framework/system/int/src/sys_int_pic32.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1775169628/spi.o: /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1775169628" 
	@${RM} ${OBJECTDIR}/_ext/1775169628/spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1775169628/spi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1775169628/spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1775169628/spi.o.d" -o ${OBJECTDIR}/_ext/1775169628/spi.o /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/spi.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o: /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/i2c_master_noint.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1775169628" 
	@${RM} ${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o.d 
	@${RM} ${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o.d" -o ${OBJECTDIR}/_ext/1775169628/i2c_master_noint.o /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/i2c_master_noint.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1775169628/ili9341_2.o: /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/ili9341_2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1775169628" 
	@${RM} ${OBJECTDIR}/_ext/1775169628/ili9341_2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1775169628/ili9341_2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1775169628/ili9341_2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/plzwork3" -I"../src/plzwork3" -I"../../../../../../../microchip/harmony/v2_05/framework" -I"../src/system_config/plzwork3/framework" -MMD -MF "${OBJECTDIR}/_ext/1775169628/ili9341_2.o.d" -o ${OBJECTDIR}/_ext/1775169628/ili9341_2.o /Users/patrickbomher/Documents/GitHub/Patrick_Bomher_ME433/HW8/HW8/firmware/HW8.X/ili9341_2.c    -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/HW8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../../microchip/harmony/v2_05/bin/framework/peripheral/PIC32MX250F128B_peripherals.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/HW8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ../../../../../../../microchip/harmony/v2_05/bin/framework/peripheral/PIC32MX250F128B_peripherals.a      -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/HW8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../../microchip/harmony/v2_05/bin/framework/peripheral/PIC32MX250F128B_peripherals.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/HW8.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ../../../../../../../microchip/harmony/v2_05/bin/framework/peripheral/PIC32MX250F128B_peripherals.a      -DXPRJ_plzwork3=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}/xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/HW8.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/plzwork3
	${RM} -r dist/plzwork3

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
